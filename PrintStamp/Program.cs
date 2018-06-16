using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using System.Xml;
using System.Xml.Linq;
using System.Xml.XPath;

namespace PrintStamp
{
	class Program
	{
		private static readonly XmlNamespaceManager NameSpaces = new XmlNamespaceManager(new NameTable());
		private static readonly XNamespace X = "http://www.w3.org/1999/XSL/Transform";
		private static readonly XNamespace fo = "http://www.w3.org/1999/XSL/Format";
		private const string ActiveGfvRegexDefault = @"[\d]{6}";
		private const string DefaultPath = @"C:\cement\sprinter.templates\Fop0.9.4";

		static void Main(string[] args)
		{
			if (!TryGetParams(args, out var param))
				return;
			var templatesPath = param.ContainsKey("-p") ? param["-p"] : DefaultPath;
			var findedFile = param.ContainsKey("-g") ? string.Concat(param["-g"], ".xslt") : "*.xslt";
			var justUpdate = param.ContainsKey("-u") && Convert.ToBoolean(param["-u"]);

			var templatesDirectory = new DirectoryInfo(templatesPath);
			var files = templatesDirectory.GetFiles(findedFile);
			NameSpaces.AddNamespace("x", X.ToString());
			NameSpaces.AddNamespace("fo", fo.ToString());
			foreach (var fileInfo in files.Where(f=>f.Name.StartsWith("1")))
			{
				var fileName = fileInfo.Name.Replace(".xslt", "");
				if (fileName.Length > 6 || !Regex.IsMatch(fileName, ActiveGfvRegexDefault))
					continue;
				Console.WriteLine(fileName);
				if (justUpdate)
				{
					UpdateFiles(fileInfo);
					continue;
				}
				AddEcpToFile(fileInfo);
				AddEcpTemplateToFile(fileInfo);
			}
		}

		private static bool TryGetParams(string[] args, out Dictionary<string, string> paramsDictionary)
		{
			paramsDictionary = new Dictionary<string, string>();
			if (args.Length % 2 != 0)
				return false;
			if (args.Any())
				paramsDictionary = args
					.Select((x, i) => new {Index = i, Value = x})
					.Where(iv => iv.Index % 2 == 0)
					.ToDictionary(pair => pair.Value, pair => args[pair.Index + 1]);
			return true;
		}

		private static void UpdateFiles(FileInfo fileInfo)
		{
			var doc = XDocument.Load(fileInfo.FullName);
			doc.Save(fileInfo.FullName, SaveOptions.None);
			if (HasBaseInclude(doc, out var baseHref))
			{
				var basePath = Path.Combine(fileInfo.DirectoryName, baseHref);
				XDocument
					.Load(basePath)
					.Save(basePath, SaveOptions.None);
			}
		}

		private static bool TryExtractArguments(string[] args, out string templatesPath, out string gfv)
		{
			templatesPath = null;
			gfv = null;
			switch (args.Length)
			{
				case 0:
					templatesPath = @"C:\cement\sprinter.templates\Fop0.9.4";
					gfv = null;
					break;
				case 1:
					templatesPath = args[0];
					gfv = null;
					break;
				case 2:
					templatesPath = args[0];
					gfv = args[1];
					break;
				default:
					Console.WriteLine("Usage: PrintStamp.exe templatesPath or Usage: PrintStamp.exe templatesPath, gfv");
					return false;
			}
			return true;
		}

		private static void AddEcpToFile(FileInfo fileInfo)
		{
			var doc = XDocument.Load(fileInfo.FullName);
			var ecp = doc.XPathSelectElement("//x:include[@href = 'ECP.xslt']", NameSpaces);
			if (ecp != null)
				return;
			if (HasBaseInclude(doc, out string baseHref))
				AddECPIncludeToBaseFile(Path.Combine(fileInfo.DirectoryName, baseHref));
			else
				SaveWithFormat(doc, fileInfo.FullName);
		}

		private static bool HasBaseInclude(XDocument doc, out string baseHref)
		{
			var includeElements = doc.XPathSelectElements("//x:include", NameSpaces);
			var includes = includeElements.Select(i => i.Attribute("href")?.Value).Distinct().ToList();
			baseHref = includes.FirstOrDefault(h => h.IndexOf("base", StringComparison.InvariantCultureIgnoreCase) != -1);
			return baseHref != null;
		}

		private static void AddECPIncludeToBaseFile(string filePath)
		{
			var doc = XDocument.Load(filePath);
			var includeElements = doc.XPathSelectElements("//x:include", NameSpaces);
			if (!NeedECPInclude(includeElements)) return;
			SaveWithFormat(doc, filePath);
		}

		private static void AddEcpTemplateToFile(FileInfo fileInfo)
		{
			var doc = XDocument.Load(fileInfo.FullName);
			var calls = doc.XPathSelectElements("//x:call-template", NameSpaces);
			var barCode = calls.Select(c => c.Attribute("name")?.Value).FirstOrDefault(n => n.StartsWith("ШтрихКод"));
			if (barCode == null && fileInfo.Name.StartsWith("1"))
				return;
			AddEcpTemplate(doc, fileInfo);
			EcpMini(doc, fileInfo);
		}

		private static void AddEcpTemplate(XDocument doc, FileInfo fileInfo)
		{
			if (HasBaseInclude(doc, out var baseHref))
			{
				var basePath = Path.Combine(fileInfo.DirectoryName, baseHref);
				var baseDoc = XDocument.Load(basePath);
				AddEcpTemplateToFile(baseDoc, basePath);
			}
			else
				AddEcpTemplateToFile(doc, fileInfo.FullName);
		}

		private static void AddEcpTemplateToFile(XDocument doc, string path)
		{
			var templates = doc.XPathSelectElements("//x:template", NameSpaces);
			var inspector = templates.FirstOrDefault(t => t.Attribute("name")?.Value.StartsWith("Инспектор") == true);
			var founded = inspector?.XPathSelectElements("x:call-template", NameSpaces).FirstOrDefault(call =>
			{
				var name = call.Attribute("name");
				return name != null && name.Value == "подпись-эцп-фнс";
			});
			if (inspector != null && founded == null)
			{
				var table = inspector.XPathSelectElements("fo:table", NameSpaces).LastOrDefault();
				table?.AddBeforeSelf(GetEcpTemplateElement());
				doc.Save(path, SaveOptions.None);
			}
		}

		private static void EcpMini(XDocument doc, FileInfo fileInfo)
		{
			var basePath = "";
			var baseDoc = new XDocument();
			if (HasBaseInclude(doc, out var baseHref))
			{
				basePath = Path.Combine(fileInfo.DirectoryName, baseHref);
				baseDoc = XDocument.Load(basePath);
			}
			var sequences = doc.XPathSelectElements("//fo:page-sequence", NameSpaces).Skip(1);
			foreach (var sequence in sequences)
			{
				//var xPathSelectElements = sequence.XPathSelectElements("fo:static-content", NameSpaces);

				//var staticContentAfter = xPathSelectElements.FirstOrDefault(e =>
				//{
				//	var name = e.Attribute("flow-name");
				//	return name != null && name.Value.Contains("after");
				//});
				//var callECPMini = staticContentAfter?.XPathSelectElements("descendant-or-self::*/x:call-template", NameSpaces).FirstOrDefault(call =>
				//{
				//	var name = call.Attribute("name");
				//	return name != null && name.Value == "подпись-эцп-мини";
				//});
				//var callSign = sequence.XPathSelectElements("x:call-template", NameSpaces).FirstOrDefault(call =>
				//{
				//	var name = call.Attribute("name");
				//	return name != null && name.Value.StartsWith("Подпись");
				//});

				if (!HasStaticContentAfter(sequence, out var staticContentAfter))
				{
					if (!HasCallSign(sequence, out var callSign))
						AddCallECPMiniWithWraper(sequence);
					else if (HasStaticContentAfterInSign(doc, baseDoc, callSign.Attribute("name").Value, out var staticContentAfterSign))
						AddCallECPMini(staticContentAfterSign);
				}
				else
					AddCallECPMini(staticContentAfter);
			}
			doc.Save(fileInfo.FullName, SaveOptions.None);
			if (baseDoc.Root != null)
				baseDoc.Save(basePath, SaveOptions.None);
		}

		private static bool HasStaticContentAfterInSign(XDocument doc, XDocument baseDoc, string nameSign, out XElement staticContentAfterSign)
		{
			if (HasSignTemplate(doc, nameSign, out var sign))
				return HasStaticContentAfter(sign, out staticContentAfterSign);

			if (baseDoc.Root != null)
				if (HasSignTemplate(baseDoc, nameSign, out var signBase))
					return HasStaticContentAfter(signBase, out staticContentAfterSign);

			staticContentAfterSign = null;
			return false;
		}

		private static bool HasStaticContentAfter(XElement baseElement, out XElement staticContentAfter)
		{
			var staticContent = baseElement.XPathSelectElements("fo:static-content", NameSpaces);
			staticContentAfter = staticContent.FirstOrDefault(e =>
			{
				var name = e.Attribute("flow-name");
				return name != null && name.Value.Contains("after");
			});

			return staticContentAfter != null;
		}

		private static bool HasCallSign(XElement baseElement, out XElement callSign)
		{
			callSign = baseElement.XPathSelectElements("x:call-template", NameSpaces).FirstOrDefault(call =>
			{
				var name = call.Attribute("name");
				return name != null && name.Value.StartsWith("Подпись");
			});

			return callSign != null;
		}

		private static bool HasCallECPMini(XElement baseElement)
		{
			var callECPMini = baseElement?.XPathSelectElements("descendant-or-self::*/x:call-template", NameSpaces).FirstOrDefault(call =>
			{
				var name = call.Attribute("name");
				return name != null && name.Value == "подпись-эцп-мини";
			});

			return callECPMini != null;
		}

		private static bool HasSignTemplate(XDocument doc, string nameSign, out XElement sign)
		{
			var templates = doc.XPathSelectElements("//x:template", NameSpaces);
			sign = templates.FirstOrDefault(t => t.Attribute("name")?.Value == nameSign);
			return sign != null;
		}

		private static void AddCallECPMini(XElement staticContentAfter)
		{
			if (HasCallECPMini(staticContentAfter))
				return;
			var blockElement = new XElement(fo + "block", new XAttribute("space-after", "-6mm"));
			var callElement = new XElement(X + "call-template", new XAttribute("name", "подпись-эцп-мини"));
			staticContentAfter.Add(blockElement);
			staticContentAfter.Add(callElement);
		}

		private static void AddCallECPMiniWithWraper(XElement sequence)
		{
			var staticElement = new XElement(fo + "static-content", new XAttribute("flow-name", "xsl-region-after"),
				new XAttribute("font-size", "9pt"), new XAttribute("font-family", "Arial"));
			var blockElement = new XElement(fo + "block-container", new XAttribute("top", "-15mm"),
				new XAttribute("position", "absolute"));
			blockElement.Add(new XElement(X + "call-template", new XAttribute("name", "подпись-эцп-мини")));
			staticElement.Add(blockElement);
			sequence.Add(staticElement);
		}

		private static bool NeedECPInclude(IEnumerable<XElement> includes)
		{
			var hrefs = includes.Select(i => i.Attribute("href")?.Value).Distinct().ToList();
			return hrefs.All(href => href != "ECP.xslt");
		}

		private static XElement GetECPElement()
		{
			var newElement = new XElement(X + "include");
			newElement.Add(new XAttribute("href", "ECP.xslt"));
			return newElement;
		}

		private static XElement GetEcpTemplateElement()
		{
			var newElement = new XElement(X + "call-template");
			newElement.Add(new XAttribute("name", "подпись-эцп-фнс"));
			return newElement;
		}

		private static void SaveWithFormat(XDocument doc, string filePath)
		{
			doc.Root?.AddFirst(GetECPElement());
			doc.Save(filePath, SaveOptions.None);
		}


	}
}
