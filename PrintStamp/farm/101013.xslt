<?xml version="1.0" encoding="utf-8"?>
<x:stylesheet version="1.0" xmlns:x="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
  <x:output method="xml" encoding="utf-8" indent="yes" omit-xml-declaration="no" />
  <x:include href="Base1151001.5.05.xslt" />
  <x:template match="/Файл">
    <fo:root text-align="center">
      <x:call-template name="Разметка" />
      <x:apply-templates select="Документ" />
    </fo:root>
  </x:template>
  <x:template match="Документ">
    <!--титул-->
    <fo:page-sequence master-reference="Portrait-title" format="001">
      <fo:static-content flow-name="xsl-region-before" font-size="11pt" font-family="Arial">
        <x:call-template name="Рамка_Portrait-title" />
        <x:choose>
          <x:when test="СвНП/НПЮЛ">
            <x:call-template name="ИНН_КПП_Portrait">
              <x:with-param name="ИНН" select="СвНП/НПЮЛ/@ИННЮЛ" />
              <x:with-param name="КПП" select="СвНП/НПЮЛ/@КПП" />
            </x:call-template>
          </x:when>
          <x:when test="СвНП/НПФЛ">
            <x:call-template name="ИНН_КПП_Portrait">
              <x:with-param name="ИНН" select="СвНП/НПФЛ/@ИННФЛ" />
            </x:call-template>
          </x:when>
        </x:choose>
        <x:call-template name="ШтрихКод_Portrait">
          <x:with-param name="код" select="'-0031-aabh-'" />
        </x:call-template>
        <fo:block-container height="8mm" width="48mm" top="20mm" left="152mm" position="absolute" text-align="right">
          <fo:block font-size="8pt" font-weight="bold">Форма по КНД 1151001</fo:block>
        </fo:block-container>
        <fo:block-container height="5mm" width="75mm" top="1mm" left="135mm" position="absolute" text-align="right" font-weight="normal">
          <fo:block font-size="7pt" margin-right="10mm">Приложение № 1</fo:block>
          <fo:block font-size="7pt" margin-right="10mm">к Приказу ФНС России</fo:block>
          <fo:block font-size="7pt" margin-right="10mm">от 29.10.2014 № ММВ-7-3/558@</fo:block>
          <fo:block font-size="7pt" margin-right="10mm">(в ред. Приказа ФНС России</fo:block>
          <fo:block font-size="7pt" margin-right="10mm">от 20.12.2016 № ММВ-7-3/696@)</fo:block>
        </fo:block-container>
      </fo:static-content>
      <x:call-template name="СвРукОрг_СвПред_Инспектор_Д">
        <x:with-param name="СвНП" select="СвНП" />
        <x:with-param name="Дата" select="$signDate" />
        <x:with-param name="Подписант" select="Подписант" />
      </x:call-template>
      <fo:flow flow-name="xsl-region-body" font-size="9pt" font-family="Arial">
        <fo:block font-weight="bold" text-align="center" font-size="11pt" margin-top="-6mm">Налоговая декларация</fo:block>
        <fo:block font-weight="bold" text-align="center" font-size="11pt">по налогу на добавленную стоимость</fo:block>
        <fo:block space-after="3mm" />
        <fo:table table-layout="fixed" width="100%">
          <fo:table-column column-width="38mm" />
          <fo:table-column column-width="43mm" />
          <fo:table-column column-width="39mm" />
          <fo:table-column column-width="35mm" />
          <fo:table-column column-width="25mm" />
          <fo:table-column column-width="22mm" />
          <fo:table-body>
            <fo:table-cell text-align="center" display-align="center">
              <fo:block>Номер корректировки</fo:block>
            </fo:table-cell>
            <fo:table-cell display-align="center">
              <x:call-template name="table">
                <x:with-param name="column-count" select="'3'" />
                <x:with-param name="value" select="@НомКорр" />
                <x:with-param name="ch" select="'-'" />
              </x:call-template>
            </fo:table-cell>
            <fo:table-cell text-align="center" display-align="center">
              <fo:block>Налоговый период (код)</fo:block>
            </fo:table-cell>
            <fo:table-cell display-align="center">
              <x:call-template name="table">
                <x:with-param name="column-count" select="'2'" />
                <x:with-param name="value" select="@Период" />
                <x:with-param name="ch" select="'-'" />
              </x:call-template>
            </fo:table-cell>
            <fo:table-cell text-align="center" display-align="center">
              <fo:block>Отчетный год</fo:block>
            </fo:table-cell>
            <fo:table-cell display-align="center">
              <x:call-template name="table">
                <x:with-param name="column-count" select="'4'" />
                <x:with-param name="value" select="@ОтчетГод" />
              </x:call-template>
            </fo:table-cell>
          </fo:table-body>
        </fo:table>
        <fo:block space-after="3mm" />
        <fo:table table-layout="fixed" width="100%">
          <fo:table-column column-width="68mm" />
          <fo:table-column column-width="20mm" />
          <fo:table-column column-width="97mm" />
          <fo:table-column column-width="18mm" />
          <fo:table-body>
            <fo:table-cell text-align="left" display-align="center">
              <fo:block margin-left="3mm">Представляется в налоговый орган (код)</fo:block>
            </fo:table-cell>
            <fo:table-cell display-align="center">
              <x:call-template name="table">
                <x:with-param name="column-count" select="'4'" />
                <x:with-param name="value" select="@КодНО" />
                <x:with-param name="ch" select="'-'" />
              </x:call-template>
            </fo:table-cell>
            <fo:table-cell text-align="right" display-align="center">
              <fo:block margin-right="2mm">по месту нахождения (учета) (код)</fo:block>
            </fo:table-cell>
            <fo:table-cell display-align="center">
              <x:call-template name="table">
                <x:with-param name="column-count" select="'3'" />
                <x:with-param name="value" select="@ПоМесту" />
                <x:with-param name="ch" select="'-'" />
              </x:call-template>
            </fo:table-cell>
          </fo:table-body>
        </fo:table>
        <fo:block space-after="2mm" />
        <fo:block>
          <x:choose>
            <x:when test="СвНП/НПЮЛ">
              <x:call-template name="table">
                <x:with-param name="column-count" select="'40'" />
                <x:with-param name="value" select="substring(СвНП/НПЮЛ/@НаимОрг, 1, 40)" />
              </x:call-template>
            </x:when>
            <x:otherwise>
              <x:call-template name="table">
                <x:with-param name="column-count" select="'40'" />
                <x:with-param name="value" select="СвНП/НПФЛ/ФИО/@Фамилия" />
              </x:call-template>
            </x:otherwise>
          </x:choose>
        </fo:block>
        <fo:block space-after="1mm" />
        <fo:block>
          <x:choose>
            <x:when test="СвНП/НПЮЛ">
              <x:call-template name="table">
                <x:with-param name="column-count" select="'40'" />
                <x:with-param name="value" select="substring(СвНП/НПЮЛ/@НаимОрг, 41, 40)" />
              </x:call-template>
            </x:when>
            <x:otherwise>
              <x:call-template name="table">
                <x:with-param name="column-count" select="'40'" />
                <x:with-param name="value" select="СвНП/НПФЛ/ФИО/@Имя" />
              </x:call-template>
            </x:otherwise>
          </x:choose>
        </fo:block>
        <fo:block space-after="1mm" />
        <fo:block>
          <x:choose>
            <x:when test="СвНП/НПЮЛ">
              <x:call-template name="table">
                <x:with-param name="column-count" select="'40'" />
                <x:with-param name="value" select="substring(СвНП/НПЮЛ/@НаимОрг, 81, 40)" />
              </x:call-template>
            </x:when>
            <x:otherwise>
              <x:call-template name="table">
                <x:with-param name="column-count" select="'40'" />
                <x:with-param name="value" select="СвНП/НПФЛ/ФИО/@Отчество" />
              </x:call-template>
            </x:otherwise>
          </x:choose>
        </fo:block>
        <fo:block space-after="1mm" />
        <fo:block>
          <x:call-template name="table">
            <x:with-param name="column-count" select="'40'" />
            <x:with-param name="value" select="substring(СвНП/НПЮЛ/@НаимОрг, 121, 40)" />
          </x:call-template>
        </fo:block>
        <fo:block space-after="2mm" />
        <fo:block text-align="center" font-size="7.5pt">(налогоплательщик)</fo:block>
        <fo:block space-after="3mm" />
        <fo:table table-layout="fixed" width="100%">
          <fo:table-column column-width="105mm" />
          <fo:table-column column-width="57mm" />
          <fo:table-body>
            <fo:table-cell text-align="left" display-align="center">
              <fo:block margin-left="3mm">Код вида экономической деятельности по классификатору ОКВЭД</fo:block>
            </fo:table-cell>
            <fo:table-cell display-align="center">
              <x:call-template name="ОКВЭД">
                <x:with-param name="ОКВЭД" select="СвНП/@ОКВЭД" />
              </x:call-template>
            </fo:table-cell>
          </fo:table-body>
        </fo:table>
        <fo:block space-after="2mm" />
        <fo:table table-layout="fixed" width="100%">
          <fo:table-column column-width="38mm" />
          <fo:table-column column-width="17mm" />
          <fo:table-column column-width="47mm" />
          <fo:table-column column-width="50mm" />
          <fo:table-column column-width="3mm" />4
          <fo:table-column column-width="45mm" /><fo:table-body><fo:table-cell text-align="left" display-align="center"><fo:block margin-left="3mm">
                Форма реорганизации (ликвидация) <fo:inline font-size="8pt"> (код)</fo:inline></fo:block></fo:table-cell><fo:table-cell display-align="center"><x:call-template name="table"><x:with-param name="column-count" select="'1'" /><x:with-param name="value" select="СвНП/НПЮЛ/СвРеоргЮЛ/@ФормРеорг" /><x:with-param name="ch" select="'-'" /></x:call-template></fo:table-cell><fo:table-cell text-align="left" display-align="center"><fo:block margin-left="3mm">ИНН/КПП реорганизованной организации</fo:block></fo:table-cell><fo:table-cell display-align="center"><x:call-template name="table"><x:with-param name="column-count" select="'10'" /><x:with-param name="value" select="СвНП/НПЮЛ/СвРеоргЮЛ/@ИННЮЛ" /><x:with-param name="ch" select="'-'" /></x:call-template></fo:table-cell><fo:table-cell text-align="center" display-align="center"><fo:block>/</fo:block></fo:table-cell><fo:table-cell display-align="center"><x:call-template name="table"><x:with-param name="column-count" select="'9'" /><x:with-param name="value" select="СвНП/НПЮЛ/СвРеоргЮЛ/@КПП" /><x:with-param name="ch" select="'-'" /></x:call-template></fo:table-cell></fo:table-body></fo:table>
        <fo:block space-after="3mm" />
        <fo:table table-layout="fixed" width="100%">
          <fo:table-column column-width="50mm" />
          <fo:table-column column-width="137mm" />
          <fo:table-body>
            <fo:table-cell text-align="left" display-align="center">
              <fo:block margin-left="3mm">Номер контактного телефона</fo:block>
            </fo:table-cell>
            <fo:table-cell display-align="center">
              <x:call-template name="table">
                <x:with-param name="column-count" select="'20'" />
                <x:with-param name="value" select="СвНП/@Тлф" />
                <x:with-param name="ch" select="'-'" />
              </x:call-template>
            </fo:table-cell>
          </fo:table-body>
        </fo:table>
        <fo:block space-after="2.5mm" />
        <fo:table table-layout="fixed" width="100%">
          <fo:table-column column-width="10mm" />
          <fo:table-column column-width="15mm" />
          <fo:table-column column-width="18mm" />
          <fo:table-column column-width="100%-100mm" />
          <fo:table-column column-width="18mm" />
          <fo:table-column column-width="15mm" />
          <fo:table-body>
            <fo:table-cell text-align="left" display-align="center">
              <fo:block margin-left="3mm">На</fo:block>
            </fo:table-cell>
            <fo:table-cell display-align="center">
              <x:call-template name="table">
                <x:with-param name="column-count" select="'3'" />
                <x:with-param name="value" select="$pagesCount" />
                <x:with-param name="ch" select="'-'" />
              </x:call-template>
            </fo:table-cell>
            <fo:table-cell text-align="right" display-align="center">
              <fo:block>страницах</fo:block>
            </fo:table-cell>
            <fo:table-cell text-align="left" display-align="center">
              <fo:block margin-left="1mm">с приложением подтверждающих документов и (или) их копий на</fo:block>
            </fo:table-cell>
            <fo:table-cell display-align="left">
              <x:call-template name="table">
                <x:with-param name="column-count" select="'3'" />
              </x:call-template>
            </fo:table-cell>
            <fo:table-cell text-align="left" display-align="center">
              <fo:block>листах</fo:block>
            </fo:table-cell>
          </fo:table-body>
        </fo:table>
        <fo:block-container height="10mm" top="258mm" left="8mm" position="absolute">
          <fo:block font-size="7pt" linefeed-treatment="preserve" text-align="left">
            <fo:inline font-size="65%" vertical-align="text-top">'</fo:inline> Отчество* указывается при наличии
          </fo:block>
        </fo:block-container>
      </fo:flow>
    </fo:page-sequence>
    <x:apply-templates select="НДС">
      <x:with-param name="СвНП" select="СвНП" />
    </x:apply-templates>
  </x:template>
  <x:template match="НДС">
    <x:param name="СвНП" />
    <x:apply-templates select="СумУплНП">
      <x:with-param name="СвНП" select="$СвНП" />
    </x:apply-templates>
    <x:apply-templates select="СумУплНА">
      <x:with-param name="СвНП" select="$СвНП" />
    </x:apply-templates>
    <x:apply-templates select="СумУпл164">
      <x:with-param name="СвНП" select="$СвНП" />
    </x:apply-templates>
    <x:apply-templates select="СумУпл164/СумВосУпл">
      <x:with-param name="СвНП" select="$СвНП" />
    </x:apply-templates>
    <x:apply-templates select="СумУпл164/СумВычИн">
      <x:with-param name="СвНП" select="$СвНП" />
    </x:apply-templates>
    <x:apply-templates select="НалПодтв0">
      <x:with-param name="СвНП" select="$СвНП" />
    </x:apply-templates>
    <x:apply-templates select="НалВычПред0">
      <x:with-param name="СвНП" select="$СвНП" />
    </x:apply-templates>
    <x:apply-templates select="НалНеПодтв0">
      <x:with-param name="СвНП" select="$СвНП" />
    </x:apply-templates>
    <x:apply-templates select="ОперНеНал">
      <x:with-param name="СвНП" select="$СвНП" />
    </x:apply-templates>
  </x:template>
  <!--Раздел 1-->
  <x:template match="СумУплНП">
    <x:param name="СвНП" />
    <fo:page-sequence master-reference="Portrait" format="001">
      <fo:static-content flow-name="xsl-region-before" font-size="11pt" font-family="Arial">
        <x:call-template name="Рамка_Portrait" />
        <x:choose>
          <x:when test="$СвНП/НПЮЛ">
            <x:call-template name="ИНН_КПП_Portrait">
              <x:with-param name="ИНН" select="$СвНП/НПЮЛ/@ИННЮЛ" />
              <x:with-param name="КПП" select="$СвНП/НПЮЛ/@КПП" />
            </x:call-template>
          </x:when>
          <x:when test="$СвНП/НПФЛ">
            <x:call-template name="ИНН_КПП_Portrait">
              <x:with-param name="ИНН" select="$СвНП/НПФЛ/@ИННФЛ" />
            </x:call-template>
          </x:when>
        </x:choose>
        <x:call-template name="ШтрихКод_Portrait">
          <x:with-param name="код" select="'-0031-aace-'" />
        </x:call-template>
      </fo:static-content>
      <x:call-template name="Подпись" />
      <fo:flow flow-name="xsl-region-body" font-size="9pt" font-family="Arial">
        <fo:block text-align="center" display-align="center" font-size="9.5pt" font-weight="bold">Раздел 1. Сумма налога,</fo:block>
        <fo:block text-align="center" display-align="center" font-size="9.5pt" font-weight="bold">подлежащая уплате в бюджет (возмещению из бюджета),</fo:block>
        <fo:block text-align="center" display-align="center" font-size="9.5pt" font-weight="bold">по данным налогоплательщика</fo:block>
        <fo:block space-after="5mm" />
        <fo:table table-layout="fixed" width="100%">
          <fo:table-column column-width="80mm" />
          <fo:table-column column-width="20mm" />
          <fo:table-column column-width="100mm" />
          <fo:table-body>
            <fo:table-row>
              <fo:table-cell text-align="center" display-align="center" font-style="italic">
                <fo:block linefeed-treatment="preserve">Показатели
1</fo:block>
              </fo:table-cell>
              <fo:table-cell text-align="center" display-align="center" font-style="italic">
                <fo:block linefeed-treatment="preserve">Код строки
2</fo:block>
              </fo:table-cell>
              <fo:table-cell text-align="center" display-align="center" font-style="italic">
                <fo:block linefeed-treatment="preserve">Значения показателей
3</fo:block>
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row height="10mm">
              <fo:table-cell number-columns-spanned="3">
                <fo:block />
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row>
              <fo:table-cell text-align="left" display-align="center">
                <fo:block>Код по ОКТМО</fo:block>
              </fo:table-cell>
              <fo:table-cell text-align="center" display-align="center" font-size="9pt">
                <fo:block>010</fo:block>
              </fo:table-cell>
              <fo:table-cell display-align="center">
                <fo:block>
                  <x:call-template name="ОКТМО_new">
                    <x:with-param name="ОКТМО" select="@ОКТМО" />
                  </x:call-template>
                </fo:block>
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row height="10mm">
              <fo:table-cell number-columns-spanned="3">
                <fo:block />
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row>
              <fo:table-cell text-align="left" display-align="center">
                <fo:block>Код бюджетной классификации</fo:block>
              </fo:table-cell>
              <fo:table-cell text-align="center" display-align="center" font-size="9pt">
                <fo:block>020</fo:block>
              </fo:table-cell>
              <fo:table-cell display-align="center">
                <x:call-template name="table">
                  <x:with-param name="column-count" select="'20'" />
                  <x:with-param name="value" select="@КБК" />
                  <x:with-param name="ch" select="'-'" />
                </x:call-template>
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row height="10mm">
              <fo:table-cell number-columns-spanned="3">
                <fo:block />
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row>
              <fo:table-cell text-align="left" display-align="center">
                <fo:block>Сумма налога, подлежащая уплате в бюджет в</fo:block>
                <fo:block>соответствии с пунктом 5 статьи 173 Налогового</fo:block>
                <fo:block>кодекса Российской Федерации</fo:block>
              </fo:table-cell>
              <fo:table-cell text-align="center" display-align="before" padding-before="1.5mm" font-size="9pt">
                <fo:block>030</fo:block>
              </fo:table-cell>
              <fo:table-cell display-align="before">
                <fo:block>
                  <x:call-template name="Сумма">
                    <x:with-param name="Сумма" select="@СумПУ_173.5" />
                  </x:call-template>
                </fo:block>
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row height="10mm">
              <fo:table-cell number-columns-spanned="3">
                <fo:block />
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row>
              <fo:table-cell text-align="left" display-align="center">
                <fo:block>Сумма налога, подлежащая уплате в бюджет в</fo:block>
                <fo:block>соответствии с пунктом 1 статьи 173 Налогового</fo:block>
                <fo:block>кодекса Российской Федерации</fo:block>
              </fo:table-cell>
              <fo:table-cell text-align="center" display-align="before" padding-before="1.5mm" font-size="9pt">
                <fo:block>040</fo:block>
              </fo:table-cell>
              <fo:table-cell display-align="before">
                <x:call-template name="xabs">
                  <x:with-param name="cc" select="'12'" />
                  <x:with-param name="n" select="@СумПУ_173.1" />
                </x:call-template>
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row>
              <fo:table-cell text-align="left" display-align="before" font-size="7pt" font-style="italic">
                <fo:block>(величина разницы суммы строк 200 раздела 3, 130 раздела 4, 160</fo:block>
                <fo:block>раздела 6 и суммы строк 210 раздела 3, 120 раздела 4, 080</fo:block>
                <fo:block>раздела 5, 090 раздела 5, 170 раздела 6 &gt;= 0)</fo:block>
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row height="10mm">
              <fo:table-cell number-columns-spanned="3">
                <fo:block />
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row>
              <fo:table-cell text-align="left" display-align="center">
                <fo:block>Сумма налога, исчисленная к возмещению из</fo:block>
                <fo:block>бюджета в соответствии с пунктом 2 статьи 173</fo:block>
                <fo:block>Налогового кодекса Российской Федерации</fo:block>
              </fo:table-cell>
              <fo:table-cell text-align="center" display-align="before" font-size="9pt">
                <fo:block margin-top="2mm">050</fo:block>
              </fo:table-cell>
              <fo:table-cell display-align="before">
                <x:choose>
                  <x:when test="@СумПУ_173.1 = 0">
                    <x:call-template name="table">
                      <x:with-param name="column-count" select="12" />
                      <x:with-param name="ch" select="'-'" />
                    </x:call-template>
                  </x:when>
                  <x:otherwise>
                    <x:call-template name="xabs">
                      <x:with-param name="cc" select="'12'" />
                      <x:with-param name="n" select="-1*@СумПУ_173.1" />
                    </x:call-template>
                  </x:otherwise>
                </x:choose>
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row height="13mm">
              <fo:table-cell text-align="left" display-align="before" font-size="7pt" font-style="italic">
                <fo:block>(величина разницы суммы строк 200 раздела 3, 130 раздела 4, 160</fo:block>
                <fo:block>раздела 6 и суммы строк 210 раздела 3, 120 раздела 4, 080</fo:block>
                <fo:block>раздела 5, 090 раздела 5, 170 раздела 6 &lt; 0)</fo:block>
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row height="10mm">
              <fo:table-cell number-columns-spanned="3">
                <fo:block />
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row>
              <fo:table-cell text-align="left" display-align="center">
                <fo:block>Регистрационный номер договора инвестиционного</fo:block>
                <fo:block>товарищества</fo:block>
              </fo:table-cell>
              <fo:table-cell text-align="center" display-align="before" padding-before="1.5mm" font-size="9pt">
                <fo:block>060</fo:block>
              </fo:table-cell>
              <fo:table-cell display-align="before">
                <fo:block>
                  <x:call-template name="НомДог">
                    <x:with-param name="НомДог" select="@НомДогИТ" />
                  </x:call-template>
                </fo:block>
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row height="10mm">
              <fo:table-cell number-columns-spanned="3">
                <fo:block />
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row>
              <fo:table-cell text-align="left" display-align="center">
                <fo:block>Дата начала действия договора инвестиционного</fo:block>
                <fo:block>товарищества</fo:block>
              </fo:table-cell>
              <fo:table-cell text-align="center" display-align="before" padding-before="1.5mm" font-size="9pt">
                <fo:block>070</fo:block>
              </fo:table-cell>
              <fo:table-cell display-align="before">
                <fo:block>
                  <x:call-template name="Дата">
                    <x:with-param name="Дата" select="@ДатаНачДогИТ" />
                  </x:call-template>
                </fo:block>
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row height="10mm">
              <fo:table-cell number-columns-spanned="3">
                <fo:block />
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row>
              <fo:table-cell text-align="left" display-align="center">
                <fo:block>Дата окончания действия договора</fo:block>
                <fo:block>инвестиционного товарищества</fo:block>
              </fo:table-cell>
              <fo:table-cell text-align="center" display-align="before" padding-before="1.5mm" font-size="9pt">
                <fo:block>080</fo:block>
              </fo:table-cell>
              <fo:table-cell display-align="before">
                <fo:block>
                  <x:call-template name="Дата">
                    <x:with-param name="Дата" select="@ДатаКонДогИТ" />
                  </x:call-template>
                </fo:block>
              </fo:table-cell>
            </fo:table-row>
          </fo:table-body>
        </fo:table>
      </fo:flow>
      <fo:static-content flow-name="xsl-region-after" font-size="9pt" font-family="Arial">
        <fo:block-container top="-15mm" position="absolute">
          <x:call-template name="подпись-эцп-мини" />
        </fo:block-container>
      </fo:static-content>
    </fo:page-sequence>
  </x:template>
  <!--Раздел 2-->
  <x:template match="СумУплНА">
    <x:param name="СвНП" />
    <fo:page-sequence master-reference="Portrait" format="001">
      <fo:static-content flow-name="xsl-region-before" font-size="11pt" font-family="Arial">
        <x:call-template name="Рамка_Portrait" />
        <x:choose>
          <x:when test="$СвНП/НПЮЛ">
            <x:call-template name="ИНН_КПП_Portrait">
              <x:with-param name="ИНН" select="$СвНП/НПЮЛ/@ИННЮЛ" />
              <x:with-param name="КПП" select="$СвНП/НПЮЛ/@КПП" />
            </x:call-template>
          </x:when>
          <x:when test="$СвНП/НПФЛ">
            <x:call-template name="ИНН_КПП_Portrait">
              <x:with-param name="ИНН" select="$СвНП/НПФЛ/@ИННФЛ" />
            </x:call-template>
          </x:when>
        </x:choose>
        <x:call-template name="ШтрихКод_Portrait">
          <x:with-param name="код" select="'-0031-aadb-'" />
        </x:call-template>
      </fo:static-content>
      <fo:flow flow-name="xsl-region-body" font-size="9pt" font-family="Arial">
        <fo:block text-align="center" display-align="center" font-size="9.5pt" font-weight="bold">Раздел 2. Сумма налога, подлежащая уплате в бюджет,</fo:block>
        <fo:block text-align="center" display-align="center" font-size="9.5pt" font-weight="bold">по данным налогового агента</fo:block>
        <fo:block space-after="5mm" />
        <fo:table table-layout="fixed" width="100%">
          <fo:table-column column-width="85mm" />
          <fo:table-column column-width="15mm" />
          <fo:table-column column-width="100mm" />
          <fo:table-body>
            <fo:table-row>
              <fo:table-cell text-align="center" display-align="center" font-style="italic">
                <fo:block linefeed-treatment="preserve">Показатели
1</fo:block>
              </fo:table-cell>
              <fo:table-cell text-align="center" display-align="center" font-style="italic">
                <fo:block linefeed-treatment="preserve">Код строки
2</fo:block>
              </fo:table-cell>
              <fo:table-cell text-align="center" display-align="center" font-style="italic">
                <fo:block linefeed-treatment="preserve">Значения показателей
3</fo:block>
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row height="10mm">
              <fo:table-cell number-columns-spanned="3">
                <fo:block />
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row>
              <fo:table-cell text-align="left" display-align="center">
                <fo:block>КПП подразделения иностранной организации,</fo:block>
                <fo:block>состоящей на учете в налоговых органах</fo:block>
              </fo:table-cell>
              <fo:table-cell text-align="center" display-align="center" font-size="9pt">
                <fo:block>010</fo:block>
              </fo:table-cell>
              <fo:table-cell display-align="center">
                <fo:block>
                  <x:call-template name="table">
                    <x:with-param name="column-count" select="'9'" />
                    <x:with-param name="value" select="@КППИно" />
                    <x:with-param name="ch" select="'-'" />
                  </x:call-template>
                </fo:block>
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row height="5mm">
              <fo:table-cell number-columns-spanned="3">
                <fo:block />
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row height="8mm">
              <fo:table-cell text-align="left" display-align="center">
                <fo:block>Наименование налогоплательщика - продавца</fo:block>
              </fo:table-cell>
              <fo:table-cell text-align="center" display-align="center" font-size="9pt">
                <fo:block>020</fo:block>
              </fo:table-cell>
              <fo:table-cell display-align="center">
                <fo:block>
                  <x:choose>
                    <x:when test="СведПродЮЛ">
                      <x:call-template name="table">
                        <x:with-param name="column-count" select="'20'" />
                        <x:with-param name="value" select="substring(СведПродЮЛ/@НаимПрод, 1, 20)" />
                      </x:call-template>
                    </x:when>
                    <x:otherwise>
                      <x:call-template name="table">
                        <x:with-param name="column-count" select="'20'" />
                        <x:with-param name="value" select="substring(concat(СведПродФЛ/ФИОПрод/@Фамилия,' ',СведПродФЛ/ФИОПрод/@Имя,' ',СведПродФЛ/ФИОПрод/@Отчество), 1, 20)" />
                      </x:call-template>
                    </x:otherwise>
                  </x:choose>
                </fo:block>
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row height="8mm">
              <fo:table-cell number-columns-spanned="2" number-rows-spanned="7">
                <fo:block />
              </fo:table-cell>
              <fo:table-cell display-align="center">
                <fo:block>
                  <x:choose>
                    <x:when test="СведПродЮЛ">
                      <x:call-template name="table">
                        <x:with-param name="column-count" select="'20'" />
                        <x:with-param name="value" select="substring(СведПродЮЛ/@НаимПрод, 21, 20)" />
                      </x:call-template>
                    </x:when>
                    <x:otherwise>
                      <x:call-template name="table">
                        <x:with-param name="column-count" select="'20'" />
                        <x:with-param name="value" select="substring(concat(СведПродФЛ/ФИОПрод/@Фамилия,' ',СведПродФЛ/ФИОПрод/@Имя,' ',СведПродФЛ/ФИОПрод/@Отчество), 21, 20)" />
                      </x:call-template>
                    </x:otherwise>
                  </x:choose>
                </fo:block>
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row height="8mm">
              <fo:table-cell display-align="center">
                <fo:block>
                  <x:choose>
                    <x:when test="СведПродЮЛ">
                      <x:call-template name="table">
                        <x:with-param name="column-count" select="'20'" />
                        <x:with-param name="value" select="substring(СведПродЮЛ/@НаимПрод, 41, 20)" />
                      </x:call-template>
                    </x:when>
                    <x:otherwise>
                      <x:call-template name="table">
                        <x:with-param name="column-count" select="'20'" />
                        <x:with-param name="value" select="substring(concat(СведПродФЛ/ФИОПрод/@Фамилия,' ',СведПродФЛ/ФИОПрод/@Имя,' ',СведПродФЛ/ФИОПрод/@Отчество), 41, 20)" />
                      </x:call-template>
                    </x:otherwise>
                  </x:choose>
                </fo:block>
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row height="8mm">
              <fo:table-cell display-align="center">
                <fo:block>
                  <x:choose>
                    <x:when test="СведПродЮЛ">
                      <x:call-template name="table">
                        <x:with-param name="column-count" select="'20'" />
                        <x:with-param name="value" select="substring(СведПродЮЛ/@НаимПрод, 61, 20)" />
                      </x:call-template>
                    </x:when>
                    <x:otherwise>
                      <x:call-template name="table">
                        <x:with-param name="column-count" select="'20'" />
                        <x:with-param name="value" select="substring(concat(СведПродФЛ/ФИОПрод/@Фамилия,' ',СведПродФЛ/ФИОПрод/@Имя,' ',СведПродФЛ/ФИОПрод/@Отчество), 61, 20)" />
                      </x:call-template>
                    </x:otherwise>
                  </x:choose>
                </fo:block>
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row height="8mm">
              <fo:table-cell display-align="center">
                <fo:block>
                  <x:choose>
                    <x:when test="СведПродЮЛ">
                      <x:call-template name="table">
                        <x:with-param name="column-count" select="'20'" />
                        <x:with-param name="value" select="substring(СведПродЮЛ/@НаимПрод, 81, 20)" />
                      </x:call-template>
                    </x:when>
                    <x:otherwise>
                      <x:call-template name="table">
                        <x:with-param name="column-count" select="'20'" />
                        <x:with-param name="value" select="substring(concat(СведПродФЛ/ФИОПрод/@Фамилия,' ',СведПродФЛ/ФИОПрод/@Имя,' ',СведПродФЛ/ФИОПрод/@Отчество), 81, 20)" />
                      </x:call-template>
                    </x:otherwise>
                  </x:choose>
                </fo:block>
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row height="8mm">
              <fo:table-cell display-align="center">
                <fo:block>
                  <x:choose>
                    <x:when test="СведПродЮЛ">
                      <x:call-template name="table">
                        <x:with-param name="column-count" select="'20'" />
                        <x:with-param name="value" select="substring(СведПродЮЛ/@НаимПрод, 101, 20)" />
                      </x:call-template>
                    </x:when>
                    <x:otherwise>
                      <x:call-template name="table">
                        <x:with-param name="column-count" select="'20'" />
                        <x:with-param name="value" select="substring(concat(СведПродФЛ/ФИОПрод/@Фамилия,' ',СведПродФЛ/ФИОПрод/@Имя,' ',СведПродФЛ/ФИОПрод/@Отчество), 101, 20)" />
                      </x:call-template>
                    </x:otherwise>
                  </x:choose>
                </fo:block>
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row height="8mm">
              <fo:table-cell display-align="center">
                <fo:block>
                  <x:choose>
                    <x:when test="СведПродЮЛ">
                      <x:call-template name="table">
                        <x:with-param name="column-count" select="'20'" />
                        <x:with-param name="value" select="substring(СведПродЮЛ/@НаимПрод, 121, 20)" />
                      </x:call-template>
                    </x:when>
                    <x:otherwise>
                      <x:call-template name="table">
                        <x:with-param name="column-count" select="'20'" />
                        <x:with-param name="value" select="substring(concat(СведПродФЛ/ФИОПрод/@Фамилия,' ',СведПродФЛ/ФИОПрод/@Имя,' ',СведПродФЛ/ФИОПрод/@Отчество), 121, 20)" />
                      </x:call-template>
                    </x:otherwise>
                  </x:choose>
                </fo:block>
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row height="8mm">
              <fo:table-cell display-align="center">
                <fo:block>
                  <x:choose>
                    <x:when test="СведПродЮЛ">
                      <x:call-template name="table">
                        <x:with-param name="column-count" select="'20'" />
                        <x:with-param name="value" select="substring(СведПродЮЛ/@НаимПрод, 141, 20)" />
                      </x:call-template>
                    </x:when>
                    <x:otherwise>
                      <x:call-template name="table">
                        <x:with-param name="column-count" select="'20'" />
                        <x:with-param name="value" select="substring(concat(СведПродФЛ/ФИОПрод/@Фамилия,' ',СведПродФЛ/ФИОПрод/@Имя,' ',СведПродФЛ/ФИОПрод/@Отчество), 141, 20)" />
                      </x:call-template>
                    </x:otherwise>
                  </x:choose>
                </fo:block>
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row height="5mm">
              <fo:table-cell number-columns-spanned="3">
                <fo:block />
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row>
              <fo:table-cell text-align="left" display-align="center">
                <fo:block>ИНН налогоплательщика - продавца</fo:block>
              </fo:table-cell>
              <fo:table-cell text-align="center" display-align="center" font-size="9pt">
                <fo:block>030</fo:block>
              </fo:table-cell>
              <fo:table-cell display-align="center">
                <x:choose>
                  <x:when test="СведПродЮЛ">
                    <x:call-template name="table">
                      <x:with-param name="column-count" select="'12'" />
                      <x:with-param name="value" select="СведПродЮЛ/@ИННЮЛПрод" />
                      <x:with-param name="ch" select="'-'" />
                    </x:call-template>
                  </x:when>
                  <x:otherwise>
                    <x:call-template name="table">
                      <x:with-param name="column-count" select="'12'" />
                      <x:with-param name="value" select="СведПродФЛ/@ИННФЛПрод" />
                      <x:with-param name="ch" select="'-'" />
                    </x:call-template>
                  </x:otherwise>
                </x:choose>
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row height="5mm">
              <fo:table-cell number-columns-spanned="3">
                <fo:block />
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row>
              <fo:table-cell text-align="left" display-align="center">
                <fo:block>Код бюджетной классификации</fo:block>
              </fo:table-cell>
              <fo:table-cell text-align="center" display-align="center" font-size="9pt">
                <fo:block>040</fo:block>
              </fo:table-cell>
              <fo:table-cell display-align="center">
                <fo:block>
                  <x:call-template name="table">
                    <x:with-param name="value" select="@КБК" />
                    <x:with-param name="column-count" select="'20'" />
                    <x:with-param name="ch" select="'-'" />
                  </x:call-template>
                </fo:block>
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row height="5mm">
              <fo:table-cell number-columns-spanned="3">
                <fo:block />
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row>
              <fo:table-cell text-align="left" display-align="center">
                <fo:block>Код по ОКТМО</fo:block>
              </fo:table-cell>
              <fo:table-cell text-align="center" display-align="center" font-size="9pt">
                <fo:block>050</fo:block>
              </fo:table-cell>
              <fo:table-cell display-align="center">
                <fo:block>
                  <x:call-template name="ОКТМО_new">
                    <x:with-param name="ОКТМО" select="@ОКТМО" />
                  </x:call-template>
                </fo:block>
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row height="5mm">
              <fo:table-cell number-columns-spanned="3">
                <fo:block />
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row>
              <fo:table-cell text-align="left" display-align="center">
                <fo:block>Сумма налога, исчисленная к уплате в бюджет (руб.)</fo:block>
              </fo:table-cell>
              <fo:table-cell text-align="center" display-align="center" font-size="9pt">
                <fo:block>060</fo:block>
              </fo:table-cell>
              <fo:table-cell display-align="center">
                <fo:block>
                  <x:call-template name="Сумма">
                    <x:with-param name="Сумма" select="@СумИсчисл" />
                  </x:call-template>
                </fo:block>
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row height="5mm">
              <fo:table-cell number-columns-spanned="3">
                <fo:block />
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row>
              <fo:table-cell text-align="left" display-align="center">
                <fo:block>Код операции</fo:block>
              </fo:table-cell>
              <fo:table-cell text-align="center" display-align="center" font-size="9pt">
                <fo:block>070</fo:block>
              </fo:table-cell>
              <fo:table-cell display-align="center">
                <fo:block>
                  <x:call-template name="table">
                    <x:with-param name="value" select="@КодОпер" />
                    <x:with-param name="column-count" select="'7'" />
                    <x:with-param name="ch" select="'-'" />
                  </x:call-template>
                </fo:block>
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row height="5mm">
              <fo:table-cell number-columns-spanned="3">
                <fo:block />
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row>
              <fo:table-cell text-align="left" display-align="center">
                <fo:block>Сумма налога, исчисленная при отгрузке товаров</fo:block>
                <fo:block>(выполнении работ, оказании услуг, передаче</fo:block>
                <fo:block>имущественных прав)</fo:block>
              </fo:table-cell>
              <fo:table-cell text-align="center" display-align="before" padding-before="1.5mm" font-size="9pt">
                <fo:block>080</fo:block>
              </fo:table-cell>
              <fo:table-cell display-align="before">
                <fo:block>
                  <x:call-template name="Сумма">
                    <x:with-param name="Сумма" select="@СумИсчислОтгр" />
                  </x:call-template>
                </fo:block>
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row height="5mm">
              <fo:table-cell number-columns-spanned="3">
                <fo:block />
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row>
              <fo:table-cell text-align="left" display-align="center">
                <fo:block>Сумма налога, исчисленная при получении оплаты,</fo:block>
                <fo:block>частичной оплаты в счет предстоящей отгрузки</fo:block>
                <fo:block>товаров (выполнения работ, оказания услуг,</fo:block>
                <fo:block>передачи имущественных прав)</fo:block>
              </fo:table-cell>
              <fo:table-cell text-align="center" display-align="before" padding-before="1.5mm" font-size="9pt">
                <fo:block>090</fo:block>
              </fo:table-cell>
              <fo:table-cell display-align="before">
                <fo:block>
                  <x:call-template name="Сумма">
                    <x:with-param name="Сумма" select="@СумИсчислОпл" />
                  </x:call-template>
                </fo:block>
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row height="5mm">
              <fo:table-cell number-columns-spanned="3">
                <fo:block />
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row>
              <fo:table-cell text-align="left" display-align="center">
                <fo:block>Сумма налога, исчисленная налоговым агентом с</fo:block>
                <fo:block>оплаты, частичной оплаты при отгрузке товаров</fo:block>
                <fo:block>(выполнении работ, оказании услуг, передаче</fo:block>
                <fo:block>имущественных прав) в счет этой оплаты,</fo:block>
                <fo:block>частичной оплаты</fo:block>
              </fo:table-cell>
              <fo:table-cell text-align="center" display-align="before" padding-before="1.5mm" font-size="9pt">
                <fo:block>100</fo:block>
              </fo:table-cell>
              <fo:table-cell display-align="before">
                <fo:block>
                  <x:call-template name="Сумма">
                    <x:with-param name="Сумма" select="@СумИсчислНА" />
                  </x:call-template>
                </fo:block>
              </fo:table-cell>
            </fo:table-row>
          </fo:table-body>
        </fo:table>
      </fo:flow>
      <fo:static-content flow-name="xsl-region-after" font-size="9pt" font-family="Arial">
        <fo:block-container top="-15mm" position="absolute">
          <x:call-template name="подпись-эцп-мини" />
        </fo:block-container>
      </fo:static-content>
    </fo:page-sequence>
  </x:template>
  <!--Раздел 3-->
  <x:template match="СумУпл164">
    <x:param name="СвНП" />
    <fo:page-sequence master-reference="Portrait" format="001">
      <fo:static-content flow-name="xsl-region-before" font-size="11pt" font-family="Arial">
        <x:call-template name="Рамка_Portrait" />
        <x:choose>
          <x:when test="$СвНП/НПЮЛ">
            <x:call-template name="ИНН_КПП_Portrait">
              <x:with-param name="ИНН" select="$СвНП/НПЮЛ/@ИННЮЛ" />
              <x:with-param name="КПП" select="$СвНП/НПЮЛ/@КПП" />
            </x:call-template>
          </x:when>
          <x:when test="$СвНП/НПФЛ">
            <x:call-template name="ИНН_КПП_Portrait">
              <x:with-param name="ИНН" select="$СвНП/НПФЛ/@ИННФЛ" />
            </x:call-template>
          </x:when>
        </x:choose>
        <x:call-template name="ШтрихКод_Portrait">
          <x:with-param name="код" select="'-0031-aaei-'" />
        </x:call-template>
      </fo:static-content>
      <fo:flow flow-name="xsl-region-body" font-size="9pt" font-family="Arial">
        <fo:block text-align="center" display-align="center" font-size="9.5pt" font-weight="bold">Раздел 3. Расчет суммы налога, подлежащей уплате в бюджет по операциям, облагаемым по налоговым</fo:block>
        <fo:block text-align="center" display-align="center" font-size="9.5pt" font-weight="bold">ставкам, предусмотренным пунктами 2 - 4 статьи 164 Налогового кодекса Российской Федерации</fo:block>
        <fo:block space-after="1mm" />
        <fo:table table-layout="fixed" width="100%" font-size="7.5pt" font-style="italic">
          <fo:table-column column-width="58mm" />
          <fo:table-column column-width="17mm" />
          <fo:table-column column-width="50mm" />
          <fo:table-column column-width="20mm" />
          <fo:table-column column-width="55mm" />
          <fo:table-body>
            <fo:table-cell text-align="center" display-align="center">
              <fo:block>Налогооблагаемые объекты</fo:block>
            </fo:table-cell>
            <fo:table-cell text-align="center" display-align="center">
              <fo:block>Код строки</fo:block>
            </fo:table-cell>
            <fo:table-cell text-align="center" display-align="center">
              <fo:block>Налоговая база в рублях</fo:block>
            </fo:table-cell>
            <fo:table-cell text-align="center" display-align="center">
              <fo:block>Ставка налога</fo:block>
            </fo:table-cell>
            <fo:table-cell text-align="center" display-align="center">
              <fo:block>Сумма налога в рублях</fo:block>
            </fo:table-cell>
          </fo:table-body>
        </fo:table>
        <fo:table table-layout="fixed" width="100%" font-size="7.5pt">
          <fo:table-column column-width="63mm" />
          <fo:table-column column-width="7mm" />
          <fo:table-column column-width="60mm" />
          <fo:table-column column-width="10mm" />
          <fo:table-column column-width="60mm" />
          <fo:table-body>
            <fo:table-row height="5mm">
              <fo:table-cell text-align="center" display-align="center">
                <fo:block>1</fo:block>
              </fo:table-cell>
              <fo:table-cell text-align="center" display-align="center">
                <fo:block>2</fo:block>
              </fo:table-cell>
              <fo:table-cell text-align="center" display-align="center">
                <fo:block>3</fo:block>
              </fo:table-cell>
              <fo:table-cell text-align="center" display-align="center">
                <fo:block>4</fo:block>
              </fo:table-cell>
              <fo:table-cell text-align="center" display-align="center">
                <fo:block>5</fo:block>
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row>
              <fo:table-cell number-rows-spanned="6" text-align="left" display-align="before">
                <fo:block>1. Реализация (передача на территории</fo:block>
                <fo:block>Российской Федерации для собственных нужд)</fo:block>
                <fo:block>товаров (работ, услуг), передача</fo:block>
                <fo:block>имущественных прав по соответствующим</fo:block>
                <fo:block>ставкам налога, а также суммы, связанные с</fo:block>
                <fo:block>расчетами по оплате налогооблагаемых</fo:block>
                <fo:block>товаров (работ, услуг), всего</fo:block>
              </fo:table-cell>
              <fo:table-cell text-align="center" display-align="center" font-size="7pt">
                <fo:block>010</fo:block>
              </fo:table-cell>
              <fo:table-cell display-align="center">
                <fo:block>
                  <x:call-template name="Сумма">
                    <x:with-param name="Сумма" select="СумНалОб/РеалТов18/@НалБаза" />
                  </x:call-template>
                </fo:block>
              </fo:table-cell>
              <fo:table-cell text-align="center" display-align="center" font-size="7pt">
                <fo:block>18%</fo:block>
              </fo:table-cell>
              <fo:table-cell display-align="center">
                <fo:block>
                  <x:call-template name="Сумма">
                    <x:with-param name="Сумма" select="СумНалОб/РеалТов18/@СумНал" />
                  </x:call-template>
                </fo:block>
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row height="1.5mm">
              <fo:table-cell number-columns-spanned="4">
                <fo:block />
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row>
              <fo:table-cell text-align="center" display-align="center" font-size="7pt">
                <fo:block>020</fo:block>
              </fo:table-cell>
              <fo:table-cell display-align="center">
                <fo:block>
                  <x:call-template name="Сумма">
                    <x:with-param name="Сумма" select="СумНалОб/РеалТов10/@НалБаза" />
                  </x:call-template>
                </fo:block>
              </fo:table-cell>
              <fo:table-cell text-align="center" display-align="center" font-size="7pt">
                <fo:block>10%</fo:block>
              </fo:table-cell>
              <fo:table-cell display-align="center">
                <fo:block>
                  <x:call-template name="Сумма">
                    <x:with-param name="Сумма" select="СумНалОб/РеалТов10/@СумНал" />
                  </x:call-template>
                </fo:block>
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row height="1.5mm">
              <fo:table-cell number-columns-spanned="4">
                <fo:block />
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row>
              <fo:table-cell text-align="center" display-align="center" font-size="7pt">
                <fo:block>030</fo:block>
              </fo:table-cell>
              <fo:table-cell display-align="center">
                <fo:block>
                  <x:call-template name="Сумма">
                    <x:with-param name="Сумма" select="СумНалОб/РеалТов118/@НалБаза" />
                  </x:call-template>
                </fo:block>
              </fo:table-cell>
              <fo:table-cell text-align="center" display-align="center" font-size="7pt">
                <fo:block>18/118</fo:block>
              </fo:table-cell>
              <fo:table-cell display-align="center">
                <fo:block>
                  <x:call-template name="Сумма">
                    <x:with-param name="Сумма" select="СумНалОб/РеалТов118/@СумНал" />
                  </x:call-template>
                </fo:block>
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row height="1.5mm">
              <fo:table-cell number-columns-spanned="4">
                <fo:block />
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row>
              <fo:table-cell>
                <fo:block />
              </fo:table-cell>
              <fo:table-cell text-align="center" display-align="center" font-size="7pt">
                <fo:block>040</fo:block>
              </fo:table-cell>
              <fo:table-cell display-align="center">
                <fo:block>
                  <x:call-template name="Сумма">
                    <x:with-param name="Сумма" select="СумНалОб/РеалТов110/@НалБаза" />
                  </x:call-template>
                </fo:block>
              </fo:table-cell>
              <fo:table-cell text-align="center" display-align="center" font-size="7pt">
                <fo:block>10/110</fo:block>
              </fo:table-cell>
              <fo:table-cell display-align="center">
                <fo:block>
                  <x:call-template name="Сумма">
                    <x:with-param name="Сумма" select="СумНалОб/РеалТов110/@СумНал" />
                  </x:call-template>
                </fo:block>
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row height="1.5mm">
              <fo:table-cell number-columns-spanned="4">
                <fo:block />
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row>
              <fo:table-cell number-rows-spanned="4" text-align="left" display-align="before">
                <fo:block>2. Реализация по истечении срока, указанного</fo:block>
                <fo:block>в абзаце 3 подпункта 1.1 пункта 1 статьи 151</fo:block>
                <fo:block>Налогового кодекса Российской Федерации,</fo:block>
                <fo:block>товаров, в отношении которых при</fo:block>
                <fo:block>таможенном декларировании был исчислен</fo:block>
                <fo:block>налог в соответствии с абзацем 1 подпункта</fo:block>
                <fo:block>1.1 пункта 1 статьи 151 Налогового кодекса</fo:block>
                <fo:block>Российской Федерации</fo:block>
              </fo:table-cell>
              <fo:table-cell text-align="center" display-align="center" font-size="7pt">
                <fo:block>041</fo:block>
              </fo:table-cell>
              <fo:table-cell display-align="center">
                <fo:block>
                  <x:call-template name="Сумма">
                    <x:with-param name="Сумма" select="СумНалОб/РеалСрок151.1_118/@НалБаза" />
                  </x:call-template>
                </fo:block>
              </fo:table-cell>
              <fo:table-cell text-align="center" display-align="center" font-size="7pt">
                <fo:block>18/118</fo:block>
              </fo:table-cell>
              <fo:table-cell display-align="center">
                <fo:block>
                  <x:call-template name="Сумма">
                    <x:with-param name="Сумма" select="СумНалОб/РеалСрок151.1_118/@СумНал" />
                  </x:call-template>
                </fo:block>
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row height="1.5mm">
              <fo:table-cell number-columns-spanned="4">
                <fo:block />
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row>
              <fo:table-cell text-align="center" display-align="center" font-size="7pt">
                <fo:block>042</fo:block>
              </fo:table-cell>
              <fo:table-cell display-align="center">
                <fo:block>
                  <x:call-template name="Сумма">
                    <x:with-param name="Сумма" select="СумНалОб/РеалСрок151.1_110/@НалБаза" />
                  </x:call-template>
                </fo:block>
              </fo:table-cell>
              <fo:table-cell text-align="center" display-align="center" font-size="7pt">
                <fo:block>10/110</fo:block>
              </fo:table-cell>
              <fo:table-cell display-align="center">
                <fo:block>
                  <x:call-template name="Сумма">
                    <x:with-param name="Сумма" select="СумНалОб/РеалСрок151.1_110/@СумНал" />
                  </x:call-template>
                </fo:block>
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row height="15mm">
              <fo:table-cell number-columns-spanned="4">
                <fo:block />
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row>
              <fo:table-cell text-align="left" display-align="before">
                <fo:block>3. Реализация предприятия в целом как</fo:block>
                <fo:block>имущественного комплекса</fo:block>
              </fo:table-cell>
              <fo:table-cell text-align="center" display-align="center" font-size="7pt">
                <fo:block>050</fo:block>
              </fo:table-cell>
              <fo:table-cell display-align="center">
                <fo:block>
                  <x:call-template name="Сумма">
                    <x:with-param name="Сумма" select="СумНалОб/РеалПредИК/@НалБаза" />
                  </x:call-template>
                </fo:block>
              </fo:table-cell>
              <fo:table-cell text-align="center" display-align="center" font-size="7pt">
                <fo:block></fo:block>
              </fo:table-cell>
              <fo:table-cell display-align="center">
                <fo:block>
                  <x:call-template name="Сумма">
                    <x:with-param name="Сумма" select="СумНалОб/РеалПредИК/@СумНал" />
                  </x:call-template>
                </fo:block>
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row height="1.5mm">
              <fo:table-cell number-columns-spanned="4">
                <fo:block />
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row>
              <fo:table-cell text-align="left" display-align="before">
                <fo:block>4. Выполнение строительно-монтажных работ</fo:block>
                <fo:block>для собственного потребления</fo:block>
              </fo:table-cell>
              <fo:table-cell text-align="center" display-align="center" font-size="7pt">
                <fo:block>060</fo:block>
              </fo:table-cell>
              <fo:table-cell display-align="center">
                <fo:block>
                  <x:call-template name="Сумма">
                    <x:with-param name="Сумма" select="СумНалОб/ВыпСМРСоб/@НалБаза" />
                  </x:call-template>
                </fo:block>
              </fo:table-cell>
              <fo:table-cell text-align="center" display-align="center" font-size="7pt">
                <fo:block>18%</fo:block>
              </fo:table-cell>
              <fo:table-cell display-align="center">
                <fo:block>
                  <x:call-template name="Сумма">
                    <x:with-param name="Сумма" select="СумНалОб/ВыпСМРСоб/@СумНал" />
                  </x:call-template>
                </fo:block>
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row height="1.5mm">
              <fo:table-cell number-columns-spanned="4">
                <fo:block />
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row>
              <fo:table-cell text-align="left" display-align="before">
                <fo:block>5. Суммы полученной оплаты, частичной</fo:block>
                <fo:block>оплаты в счет предстоящих поставок товаров</fo:block>
                <fo:block>(выполнения работ, оказания услуг), передачи</fo:block>
                <fo:block>имущественных прав</fo:block>
              </fo:table-cell>
              <fo:table-cell text-align="center" display-align="before" padding-top="2mm" font-size="7pt">
                <fo:block>070</fo:block>
              </fo:table-cell>
              <fo:table-cell display-align="before">
                <fo:block>
                  <x:call-template name="Сумма">
                    <x:with-param name="Сумма" select="СумНалОб/ОплПредПост/@НалБаза" />
                  </x:call-template>
                </fo:block>
              </fo:table-cell>
              <fo:table-cell>
                <fo:block />
              </fo:table-cell>
              <fo:table-cell display-align="before">
                <fo:block>
                  <x:call-template name="Сумма">
                    <x:with-param name="Сумма" select="СумНалОб/ОплПредПост/@СумНал" />
                  </x:call-template>
                </fo:block>
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row height="1.5mm">
              <fo:table-cell number-columns-spanned="4">
                <fo:block />
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row>
              <fo:table-cell text-align="left" display-align="before">
                <fo:block>6. Суммы налога, подлежащие</fo:block>
                <fo:block>восстановлению, всего</fo:block>
              </fo:table-cell>
              <fo:table-cell text-align="center" display-align="center" font-size="7pt">
                <fo:block>080</fo:block>
              </fo:table-cell>
              <fo:table-cell>
                <fo:block />
              </fo:table-cell>
              <fo:table-cell>
                <fo:block />
              </fo:table-cell>
              <fo:table-cell display-align="center">
                <fo:block>
                  <x:call-template name="Сумма">
                    <x:with-param name="Сумма" select="СумНалОб/СумНалВосст/@СумНалВс" />
                  </x:call-template>
                </fo:block>
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row height="1.5mm">
              <fo:table-cell number-columns-spanned="4">
                <fo:block />
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row>
              <fo:table-cell text-align="left" display-align="before">
                <fo:block>в том числе:</fo:block>
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row height="1.5mm">
              <fo:table-cell number-columns-spanned="4">
                <fo:block />
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row>
              <fo:table-cell text-align="left" margin-left="2mm" display-align="before">
                <fo:block>6.1. суммы налога, подлежащие</fo:block>
                <fo:block>восстановлению в соответствии с</fo:block>
                <fo:block>подпунктом 3 пункта 3 статьи 170 Налогового</fo:block>
                <fo:block>кодекса Российской Федерации</fo:block>
              </fo:table-cell>
              <fo:table-cell text-align="center" display-align="before" padding-top="2mm" font-size="7pt">
                <fo:block>090</fo:block>
              </fo:table-cell>
              <fo:table-cell>
                <fo:block />
              </fo:table-cell>
              <fo:table-cell>
                <fo:block />
              </fo:table-cell>
              <fo:table-cell display-align="before">
                <fo:block>
                  <x:call-template name="Сумма">
                    <x:with-param name="Сумма" select="СумНалОб/СумНалВосст/@СумНал170.3.3" />
                  </x:call-template>
                </fo:block>
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row height="1.5mm">
              <fo:table-cell number-columns-spanned="4">
                <fo:block />
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row>
              <fo:table-cell text-align="left" margin-left="2mm" display-align="before">
                <fo:block>6.2. суммы налога, подлежащие</fo:block>
                <fo:block>восстановлению при совершении операций,</fo:block>
                <fo:block>облагаемых по налоговой ставке 0 процентов</fo:block>
              </fo:table-cell>
              <fo:table-cell text-align="center" display-align="before" padding-top="2mm" font-size="7pt">
                <fo:block>100</fo:block>
              </fo:table-cell>
              <fo:table-cell>
                <fo:block />
              </fo:table-cell>
              <fo:table-cell>
                <fo:block />
              </fo:table-cell>
              <fo:table-cell display-align="before">
                <fo:block>
                  <x:call-template name="Сумма">
                    <x:with-param name="Сумма" select="СумНалОб/СумНалВосст/@СумНалОперСт0" />
                  </x:call-template>
                </fo:block>
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row height="1.5mm">
              <fo:table-cell number-columns-spanned="4">
                <fo:block />
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row>
              <fo:table-cell text-align="left" display-align="before" number-rows-spanned="5">
                <fo:block>7. Корректировка реализации товаров (работ,</fo:block>
                <fo:block>услуг), передачи имущественных прав по</fo:block>
                <fo:block>соответствующим ставкам налога, на</fo:block>
                <fo:block>основании пункта 6 статьи 105.3 Налогового</fo:block>
                <fo:block>кодекса Российской Федерации</fo:block>
              </fo:table-cell>
              <fo:table-cell text-align="center" display-align="center" font-size="7pt">
                <fo:block>105</fo:block>
              </fo:table-cell>
              <fo:table-cell display-align="center">
                <fo:block>
                  <x:call-template name="Сумма">
                    <x:with-param name="Сумма" select="СумНалОб/КорРеалТов18/@НалБаза" />
                  </x:call-template>
                </fo:block>
              </fo:table-cell>
              <fo:table-cell text-align="center" display-align="center" font-size="7pt">
                <fo:block>18%</fo:block>
              </fo:table-cell>
              <fo:table-cell display-align="center">
                <fo:block>
                  <x:call-template name="Сумма">
                    <x:with-param name="Сумма" select="СумНалОб/КорРеалТов18/@СумНал" />
                  </x:call-template>
                </fo:block>
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row height="1.5mm">
              <fo:table-cell number-columns-spanned="4">
                <fo:block />
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row>
              <fo:table-cell text-align="center" display-align="center" font-size="7pt">
                <fo:block>106</fo:block>
              </fo:table-cell>
              <fo:table-cell display-align="before">
                <fo:block>
                  <x:call-template name="Сумма">
                    <x:with-param name="Сумма" select="СумНалОб/КорРеалТов10/@НалБаза" />
                  </x:call-template>
                </fo:block>
              </fo:table-cell>
              <fo:table-cell text-align="center" display-align="center" font-size="7pt">
                <fo:block>10%</fo:block>
              </fo:table-cell>
              <fo:table-cell display-align="before">
                <fo:block>
                  <x:call-template name="Сумма">
                    <x:with-param name="Сумма" select="СумНалОб/КорРеалТов10/@СумНал" />
                  </x:call-template>
                </fo:block>
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row height="1.5mm">
              <fo:table-cell number-columns-spanned="4">
                <fo:block />
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row>
              <fo:table-cell text-align="center" display-align="center" font-size="7pt">
                <fo:block>107</fo:block>
              </fo:table-cell>
              <fo:table-cell display-align="before">
                <fo:block>
                  <x:call-template name="Сумма">
                    <x:with-param name="Сумма" select="СумНалОб/КорРеалТов118/@НалБаза" />
                  </x:call-template>
                </fo:block>
              </fo:table-cell>
              <fo:table-cell text-align="center" display-align="center" font-size="7pt">
                <fo:block>18/118</fo:block>
              </fo:table-cell>
              <fo:table-cell display-align="before">
                <fo:block>
                  <x:call-template name="Сумма">
                    <x:with-param name="Сумма" select="СумНалОб/КорРеалТов118/@СумНал" />
                  </x:call-template>
                </fo:block>
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row height="1.5mm">
              <fo:table-cell number-columns-spanned="4">
                <fo:block />
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row>
              <fo:table-cell text-align="left" display-align="before">
                <fo:block />
              </fo:table-cell>
              <fo:table-cell text-align="center" display-align="center" font-size="7pt">
                <fo:block>108</fo:block>
              </fo:table-cell>
              <fo:table-cell display-align="center">
                <fo:block>
                  <x:call-template name="Сумма">
                    <x:with-param name="Сумма" select="СумНалОб/КорРеалТов110/@НалБаза" />
                  </x:call-template>
                </fo:block>
              </fo:table-cell>
              <fo:table-cell text-align="center" display-align="center" font-size="7pt">
                <fo:block>10/110</fo:block>
              </fo:table-cell>
              <fo:table-cell display-align="center">
                <fo:block>
                  <x:call-template name="Сумма">
                    <x:with-param name="Сумма" select="СумНалОб/КорРеалТов110/@СумНал" />
                  </x:call-template>
                </fo:block>
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row height="1.5mm">
              <fo:table-cell number-columns-spanned="4">
                <fo:block />
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row>
              <fo:table-cell text-align="left" display-align="before">
                <fo:block>8. Корректировка реализации предприятия в</fo:block>
                <fo:block>целом как имущественного комплекса, на</fo:block>
                <fo:block>основании пункта 6 статьи 105.3 Налогового</fo:block>
                <fo:block>кодекса Российской Федерации</fo:block>
              </fo:table-cell>
              <fo:table-cell text-align="center" display-align="before" font-size="7pt">
                <fo:block>109</fo:block>
              </fo:table-cell>
              <fo:table-cell display-align="before">
                <fo:block>
                  <x:call-template name="Сумма">
                    <x:with-param name="Сумма" select="СумНалОб/КорРеалПредИК/@НалБаза" />
                  </x:call-template>
                </fo:block>
              </fo:table-cell>
              <fo:table-cell>
                <fo:block />
              </fo:table-cell>
              <fo:table-cell display-align="before">
                <fo:block>
                  <x:call-template name="Сумма">
                    <x:with-param name="Сумма" select="СумНалОб/КорРеалПредИК/@СумНал" />
                  </x:call-template>
                </fo:block>
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row height="2.5mm">
              <fo:table-cell number-columns-spanned="4">
                <fo:block />
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row>
              <fo:table-cell text-align="left" display-align="before">
                <fo:block>9. Уплата сумм налога, исчисленных при</fo:block>
                <fo:block>таможенном декларировании товаров в</fo:block>
                <fo:block>случаях, предусмотренных абзацем 3</fo:block>
                <fo:block>подпункта 1.1 пункта 1 статьи 151 Налогового</fo:block>
                <fo:block>кодекса Российской федерации</fo:block>
              </fo:table-cell>
              <fo:table-cell text-align="center" display-align="top" font-size="7pt">
                <fo:block>110</fo:block>
              </fo:table-cell>
              <fo:table-cell display-align="before">
                <fo:block>
                  <x:call-template name="Сумма">
                    <x:with-param name="Сумма" select="СумНалОб/УплДеклар151.1/@НалБаза" />
                  </x:call-template>
                </fo:block>
              </fo:table-cell>
              <fo:table-cell>
                <fo:block />
              </fo:table-cell>
              <fo:table-cell display-align="before">
                <fo:block>
                  <x:call-template name="Сумма">
                    <x:with-param name="Сумма" select="СумНалОб/УплДеклар151.1/@СумНал" />
                  </x:call-template>
                </fo:block>
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row height="2.5mm">
              <fo:table-cell number-columns-spanned="4">
                <fo:block />
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row>
              <fo:table-cell text-align="left" display-align="before">
                <fo:block>10. Уплата сумм налога, исчисленных при</fo:block>
                <fo:block>таможенном декларировании товаров в случаях,</fo:block>
                <fo:block>предусмотренных пунктом 6 статьи 173</fo:block>
                <fo:block> Налогового кодекса Российской федерации</fo:block>
              </fo:table-cell>
              <fo:table-cell text-align="center" display-align="before" font-size="7pt">
                <fo:block>115</fo:block>
              </fo:table-cell>
              <fo:table-cell display-align="before">
                <fo:block>
                  <x:call-template name="Сумма">
                    <x:with-param name="Сумма" select="СумНалОб/УплДеклар173.6/@НалБаза" />
                  </x:call-template>
                </fo:block>
              </fo:table-cell>
              <fo:table-cell>
                <fo:block />
              </fo:table-cell>
              <fo:table-cell display-align="before">
                <fo:block>
                  <x:call-template name="Сумма">
                    <x:with-param name="Сумма" select="СумНалОб/УплДеклар173.6/@СумНал" />
                  </x:call-template>
                </fo:block>
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row height="2.5mm">
              <fo:table-cell number-columns-spanned="4">
                <fo:block />
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row>
              <fo:table-cell text-align="left" display-align="center">
                <fo:block>11. Общая сумма налога, исчисленная с учетом</fo:block>
                <fo:block>восстановленных сумм налога (сумма величин</fo:block>
                <fo:block>графы 5 строк 010 - 080, 105 - 115)</fo:block>
              </fo:table-cell>
              <fo:table-cell text-align="center" display-align="center" font-size="7pt">
                <fo:block>118</fo:block>
              </fo:table-cell>
              <fo:table-cell>
                <fo:block />
              </fo:table-cell>
              <fo:table-cell>
                <fo:block />
              </fo:table-cell>
              <fo:table-cell display-align="center">
                <fo:block>
                  <x:call-template name="Сумма">
                    <x:with-param name="Сумма" select="СумНалОб/@НалВосстОбщ" />
                  </x:call-template>
                </fo:block>
              </fo:table-cell>
            </fo:table-row>
          </fo:table-body>
        </fo:table>
      </fo:flow>
      <fo:static-content flow-name="xsl-region-after" font-size="9pt" font-family="Arial">
        <fo:block-container top="-15mm" position="absolute">
          <x:call-template name="подпись-эцп-мини" />
        </fo:block-container>
      </fo:static-content>
    </fo:page-sequence>
    <fo:page-sequence master-reference="Portrait" format="001">
      <fo:static-content flow-name="xsl-region-before" font-size="11pt" font-family="Arial">
        <x:call-template name="Рамка_Portrait" />
        <x:choose>
          <x:when test="$СвНП/НПЮЛ">
            <x:call-template name="ИНН_КПП_Portrait">
              <x:with-param name="ИНН" select="$СвНП/НПЮЛ/@ИННЮЛ" />
              <x:with-param name="КПП" select="$СвНП/НПЮЛ/@КПП" />
            </x:call-template>
          </x:when>
          <x:when test="$СвНП/НПФЛ">
            <x:call-template name="ИНН_КПП_Portrait">
              <x:with-param name="ИНН" select="$СвНП/НПФЛ/@ИННФЛ" />
            </x:call-template>
          </x:when>
        </x:choose>
        <x:call-template name="ШтрихКод_Portrait">
          <x:with-param name="код" select="'-0031-aaff-'" />
        </x:call-template>
      </fo:static-content>
      <fo:flow flow-name="xsl-region-body" font-size="9pt" font-family="Arial">
        <fo:table table-layout="fixed" width="100%" font-size="7pt">
          <fo:table-column column-width="124mm" />
          <fo:table-column column-width="16mm" />
          <fo:table-column column-width="55mm" />
          <fo:table-body>
            <fo:table-row>
              <fo:table-cell font-style="italic" text-align="center" display-align="center">
                <fo:block>Налоговые вычеты</fo:block>
              </fo:table-cell>
              <fo:table-cell font-style="italic" text-align="center" display-align="center">
                <fo:block>Код строки</fo:block>
              </fo:table-cell>
              <fo:table-cell font-style="italic" text-align="center" display-align="center">
                <fo:block>Сумма налога в рублях</fo:block>
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row height="8mm">
              <fo:table-cell text-align="center" display-align="center">
                <fo:block>1</fo:block>
              </fo:table-cell>
              <fo:table-cell text-align="center" display-align="center">
                <fo:block>2</fo:block>
              </fo:table-cell>
              <fo:table-cell text-align="center" display-align="center">
                <fo:block>3</fo:block>
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row>
              <fo:table-cell text-align="left" display-align="before">
                <fo:block>12. Сумма налога, предъявленная налогоплательщику при приобретении товаров (работ, услуг),</fo:block>
                <fo:block>имущественных прав на территории Российской Федерации, подлежащая вычету в соответствии с</fo:block>
                <fo:block>пунктом 2, 4, 13 статьи 171 Налогового кодекса Российской Федерации, а также сумма налога,</fo:block>
                <fo:block>подлежащая вычету в соответствии с пунктом 5 статьи 171 Налогового кодекса Российской Федерации</fo:block>
              </fo:table-cell>
              <fo:table-cell text-align="center" display-align="center" font-size="7pt">
                <fo:block>120</fo:block>
              </fo:table-cell>
              <fo:table-cell display-align="center">
                <x:call-template name="Сумма">
                  <x:with-param name="Сумма" select="СумНалВыч/@НалПредНППриоб" />
                </x:call-template>
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row height="6mm">
              <fo:table-cell text-align="left" display-align="center" number-columns-spanned="5">
                <fo:block>в том числе:</fo:block>
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row height="10mm">
              <fo:table-cell text-align="left" display-align="before" margin-left="2mm">
                <fo:block>предъявленная подрядными организациями (застройщиками, техническими заказчиками) по</fo:block>
                <fo:block>выполненным работам при проведении капитального строительства</fo:block>
              </fo:table-cell>
              <fo:table-cell text-align="center" display-align="center" font-size="7pt">
                <fo:block>125</fo:block>
              </fo:table-cell>
              <fo:table-cell display-align="center">
                <x:call-template name="Сумма">
                  <x:with-param name="Сумма" select="СумНалВыч/@НалПредНПКапСтр" />
                </x:call-template>
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row height="3mm">
              <fo:table-cell number-columns-spanned="4">
                <fo:block />
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row>
              <fo:table-cell text-align="left" display-align="before">
                <fo:block>13. Сумма налога, предъявленная налогоплательщику - покупателю при перечислении суммы оплаты,</fo:block>
                <fo:block>частичной оплаты в счет предстоящих поставок товаров (выполнения работ, оказания услуг), передачи</fo:block>
                <fo:block>имущественных прав, подлежащая вычету у покупателя</fo:block>
              </fo:table-cell>
              <fo:table-cell text-align="center" display-align="center" font-size="7pt">
                <fo:block>130</fo:block>
              </fo:table-cell>
              <fo:table-cell display-align="center">
                <x:call-template name="Сумма">
                  <x:with-param name="Сумма" select="СумНалВыч/@НалПредНППок" />
                </x:call-template>
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row height="3mm">
              <fo:table-cell number-columns-spanned="4">
                <fo:block />
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row>
              <fo:table-cell text-align="left" display-align="before">
                <fo:block>14. Сумма налога, исчисленная при выполнении строительно-монтажных работ для собственного</fo:block>
                <fo:block>потребления, подлежащая вычету</fo:block>
              </fo:table-cell>
              <fo:table-cell text-align="center" display-align="center" font-size="7pt">
                <fo:block>140</fo:block>
              </fo:table-cell>
              <fo:table-cell display-align="center">
                <x:call-template name="Сумма">
                  <x:with-param name="Сумма" select="СумНалВыч/@НалИсчСМР" />
                </x:call-template>
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row height="3mm">
              <fo:table-cell number-columns-spanned="4">
                <fo:block />
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row>
              <fo:table-cell text-align="left" display-align="before">
                <fo:block>15. Сумма налога, уплаченная налогоплательщиком таможенным органам при ввозе товаров на</fo:block>
                <fo:block>территорию Российской Федерации и иные территории, находящиеся под её юрисдикцией, в таможенных</fo:block>
                <fo:block>процедурах выпуска для внутреннего потребления, переработки для внутреннего потребления,</fo:block>
                <fo:block>временного ввоза и переработки вне таможенной территории</fo:block>
              </fo:table-cell>
              <fo:table-cell text-align="center" display-align="center" font-size="7pt">
                <fo:block>150</fo:block>
              </fo:table-cell>
              <fo:table-cell display-align="center">
                <x:call-template name="Сумма">
                  <x:with-param name="Сумма" select="СумНалВыч/@НалУплТамож" />
                </x:call-template>
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row height="3mm">
              <fo:table-cell number-columns-spanned="4">
                <fo:block />
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row>
              <fo:table-cell text-align="left" display-align="before">
                <fo:block>16. Cумма налога, уплаченная налогоплательщиком налоговым органам при ввозе товаров на территорию</fo:block>
                <fo:block>Российской Федерации и иные территории, находящиеся под её юрисдикцией, с территории государств -</fo:block>
                <fo:block>членов Евразийского экономического союза</fo:block>
              </fo:table-cell>
              <fo:table-cell text-align="center" display-align="center" font-size="7pt">
                <fo:block>160</fo:block>
              </fo:table-cell>
              <fo:table-cell display-align="center">
                <x:call-template name="Сумма">
                  <x:with-param name="Сумма" select="СумНалВыч/@НалУплНОТовТС" />
                </x:call-template>
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row height="3mm">
              <fo:table-cell number-columns-spanned="4">
                <fo:block />
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row>
              <fo:table-cell text-align="left" display-align="before">
                <fo:block>17. Сумма налога, исчисленная продавцом с сумм оплаты, частичной оплаты, подлежащая вычету у</fo:block>
                <fo:block>продавца с даты отгрузки соответствующих товаров (выполнения работ, оказания услуг)</fo:block>
              </fo:table-cell>
              <fo:table-cell text-align="center" display-align="center" font-size="7pt">
                <fo:block>170</fo:block>
              </fo:table-cell>
              <fo:table-cell display-align="center">
                <x:call-template name="Сумма">
                  <x:with-param name="Сумма" select="СумНалВыч/@НалИсчПрод" />
                </x:call-template>
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row height="3mm">
              <fo:table-cell number-columns-spanned="4">
                <fo:block />
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row>
              <fo:table-cell text-align="left" display-align="before">
                <fo:block>18. Сумма налога, уплаченная в бюджет налогоплательщиком в качестве покупателя – налогового агента,</fo:block>
                <fo:block>подлежащая вычету</fo:block>
              </fo:table-cell>
              <fo:table-cell text-align="center" display-align="center" font-size="7pt">
                <fo:block>180</fo:block>
              </fo:table-cell>
              <fo:table-cell display-align="center">
                <x:call-template name="Сумма">
                  <x:with-param name="Сумма" select="СумНалВыч/@НалУплПокНА" />
                </x:call-template>
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row height="3mm">
              <fo:table-cell number-columns-spanned="4">
                <fo:block />
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row>
              <fo:table-cell text-align="left" display-align="before">
                <fo:block>19. Сумма налога, подлежащая вычету в соответствии с пунктом 14 статьи 171 Налогового кодекса</fo:block>
                <fo:block>Российской Федерации</fo:block>
              </fo:table-cell>
              <fo:table-cell text-align="center" display-align="center" font-size="7pt">
                <fo:block>185</fo:block>
              </fo:table-cell>
              <fo:table-cell display-align="center">
                <x:call-template name="Сумма">
                  <x:with-param name="Сумма" select="СумНалВыч/@НалВыч171.14" />
                </x:call-template>
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row height="3mm">
              <fo:table-cell number-columns-spanned="4">
                <fo:block />
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row>
              <fo:table-cell text-align="left" display-align="center">
                <fo:block>20. Общая сумма налога, подлежащая вычету (сумма величин, указанных в строках 120 - 185)</fo:block>
              </fo:table-cell>
              <fo:table-cell text-align="center" display-align="center" font-size="7pt">
                <fo:block>190</fo:block>
              </fo:table-cell>
              <fo:table-cell display-align="center">
                <x:call-template name="Сумма">
                  <x:with-param name="Сумма" select="СумНалВыч/@НалВычОбщ" />
                </x:call-template>
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row height="3mm">
              <fo:table-cell number-columns-spanned="4">
                <fo:block />
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row>
              <fo:table-cell text-align="left" display-align="center">
                <fo:block>21. Итого сумма налога, подлежащая уплате в бюджет по разделу 3 (разность величин строк 118, 190 &gt;= 0)</fo:block>
              </fo:table-cell>
              <fo:table-cell text-align="center" display-align="center" font-size="7pt">
                <fo:block>200</fo:block>
              </fo:table-cell>
              <fo:table-cell display-align="center">
                <fo:block>
                  <x:call-template name="xabs">
                    <x:with-param name="cc" select="'12'" />
                    <x:with-param name="n" select="@НалПУ164" />
                  </x:call-template>
                </fo:block>
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row height="3mm">
              <fo:table-cell number-columns-spanned="4">
                <fo:block />
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row>
              <fo:table-cell text-align="left" display-align="center">
                <fo:block>22. Итого сумма налога, исчисленная к возмещению по разделу 3 (разность величин строк 118, 190 &lt; 0)</fo:block>
              </fo:table-cell>
              <fo:table-cell text-align="center" display-align="center" font-size="7pt">
                <fo:block>210</fo:block>
              </fo:table-cell>
              <fo:table-cell display-align="center">
                <fo:block>
                  <x:call-template name="xabs">
                    <x:with-param name="cc" select="'12'" />
                    <x:with-param name="n" select="-1*@НалПУ164" />
                  </x:call-template>
                </fo:block>
              </fo:table-cell>
            </fo:table-row>
          </fo:table-body>
        </fo:table>
      </fo:flow>
      <fo:static-content flow-name="xsl-region-after" font-size="9pt" font-family="Arial">
        <fo:block-container top="-15mm" position="absolute">
          <x:call-template name="подпись-эцп-мини" />
        </fo:block-container>
      </fo:static-content>
    </fo:page-sequence>
  </x:template>
  <x:template match="СумВосУпл">
    <x:param name="СвНП" />
    <fo:page-sequence master-reference="Portrait31" format="001">
      <fo:static-content flow-name="xsl-region-before" font-size="11pt" font-family="Arial">
        <x:call-template name="Рамка_Portrait" />
        <x:choose>
          <x:when test="$СвНП/НПЮЛ">
            <x:call-template name="ИНН_КПП_Portrait">
              <x:with-param name="ИНН" select="$СвНП/НПЮЛ/@ИННЮЛ" />
              <x:with-param name="КПП" select="$СвНП/НПЮЛ/@КПП" />
            </x:call-template>
          </x:when>
          <x:when test="$СвНП/НПФЛ">
            <x:call-template name="ИНН_КПП_Portrait">
              <x:with-param name="ИНН" select="$СвНП/НПФЛ/@ИННФЛ" />
            </x:call-template>
          </x:when>
        </x:choose>
        <x:call-template name="ШтрихКод_Portrait">
          <x:with-param name="код" select="'-0031-aagc-'" />
        </x:call-template>
        <fo:block space-after="20mm" />
        <fo:block text-align="right" display-align="center">Приложение 1 к разделу 3 декларации</fo:block>
        <fo:block space-after="2mm" />
        <fo:block text-align="center" display-align="center" font-size="9.5pt" font-weight="bold">Сумма налога, подлежащая восстановлению и уплате в бюджет за истекший календарный год и предыдущие</fo:block>
        <fo:block text-align="center" display-align="center" font-size="9.5pt" font-weight="bold">календарные годы</fo:block>
        <fo:block space-after="2mm" />
        <fo:table table-layout="fixed" width="100%">
          <fo:table-column column-width="35mm" />
          <fo:table-column column-width="165mm" />
          <fo:table-body>
            <fo:table-row height="8mm">
              <fo:table-cell font-size="8.5pt" text-align="left" display-align="before">
                <fo:block>Наименование объекта</fo:block>
                <fo:block>основного средства</fo:block>
              </fo:table-cell>
              <fo:table-cell display-align="center">
                <fo:block>
                  <x:call-template name="table">
                    <x:with-param name="column-count" select="'33'" />
                    <x:with-param name="value" select="substring(@НаимООС,1,33)" />
                  </x:call-template>
                </fo:block>
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row height="8mm">
              <fo:table-cell font-size="8.5pt" text-align="left" display-align="before" number-rows-spanned="2">
                <fo:block>(код строки 010)</fo:block>
              </fo:table-cell>
              <fo:table-cell display-align="center">
                <fo:block>
                  <x:call-template name="table">
                    <x:with-param name="column-count" select="'33'" />
                    <x:with-param name="value" select="substring(@НаимООС,34,33)" />
                  </x:call-template>
                </fo:block>
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row height="8mm">
              <fo:table-cell display-align="center">
                <fo:block>
                  <x:call-template name="table">
                    <x:with-param name="column-count" select="'33'" />
                    <x:with-param name="value" select="substring(@НаимООС,67,33)" />
                  </x:call-template>
                </fo:block>
              </fo:table-cell>
            </fo:table-row>
          </fo:table-body>
        </fo:table>
        <fo:block space-after="3mm" />
        <fo:table table-layout="fixed" width="100%" font-size="8.5pt">
          <fo:table-column column-width="150mm" />
          <fo:table-column column-width="50mm" />
          <fo:table-body>
            <fo:table-row height="10mm">
              <fo:table-cell text-align="left" display-align="center">
                <fo:block>Код операции по объекту основного средства (код строки 020)</fo:block>
              </fo:table-cell>
              <fo:table-cell padding-left="15mm" display-align="center">
                <fo:block>
                  <x:call-template name="table">
                    <x:with-param name="column-count" select="'7'" />
                    <x:with-param name="value" select="@КодОпООС" />
                    <x:with-param name="ch" select="'-'" />
                  </x:call-template>
                </fo:block>
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row height="10mm">
              <fo:table-cell text-align="left" display-align="center">
                <fo:block>Дата ввода объекта основного средства в эксплуатацию для исчисления амортизации (код строки 030)</fo:block>
              </fo:table-cell>
              <fo:table-cell display-align="center">
                <fo:block>
                  <x:call-template name="Дата">
                    <x:with-param name="Дата" select="@ДатаВводООС" />
                  </x:call-template>
                </fo:block>
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row height="10mm">
              <fo:table-cell text-align="left" display-align="center">
                <fo:block>Дата начала начисления амортизационных отчислений по объекту основного средства (код строки 040)</fo:block>
              </fo:table-cell>
              <fo:table-cell display-align="center">
                <fo:block>
                  <x:call-template name="Дата">
                    <x:with-param name="Дата" select="@ДатаНачАмОтч" />
                  </x:call-template>
                </fo:block>
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row height="10mm">
              <fo:table-cell text-align="left" display-align="center">
                <fo:block margin-right="7mm">Стоимость объекта основного средства на дату ввода объекта в эксплуатацию без учета налога</fo:block>
                <fo:block margin-right="7mm">(код строки 050)</fo:block>
              </fo:table-cell>
              <fo:table-cell display-align="center">
                <fo:block>
                  <x:call-template name="table">
                    <x:with-param name="value" select="@СтВводООС" />
                    <x:with-param name="column-count" select="10" />
                    <x:with-param name="ch" select="'-'" />
                  </x:call-template>
                </fo:block>
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row height="10mm">
              <fo:table-cell text-align="left" display-align="center">
                <fo:block>Сумма налога, принятая к вычету по объекту основного средства (код строки 060)</fo:block>
              </fo:table-cell>
              <fo:table-cell display-align="center">
                <fo:block>
                  <x:call-template name="table">
                    <x:with-param name="value" select="@НалВычООС" />
                    <x:with-param name="column-count" select="10" />
                    <x:with-param name="ch" select="'-'" />
                  </x:call-template>
                </fo:block>
              </fo:table-cell>
            </fo:table-row>
          </fo:table-body>
        </fo:table>
        <fo:block space-after="5mm" />
        <fo:block text-align="left" margin-left="10mm" font-size="8.5pt">(код строки 070)</fo:block>
        <fo:block space-after="5mm" />
        <fo:table table-layout="fixed" width="100%" font-size="7.5pt">
          <fo:table-column column-width="42mm" />
          <fo:table-column column-width="66mm" />
          <fo:table-column column-width="51mm" />
          <fo:table-column column-width="60mm" />
          <fo:table-body>
            <fo:table-row font-style="italic">
              <fo:table-cell text-align="center" display-align="before">
                <fo:block>За истекший</fo:block>
                <fo:block>календарный год</fo:block>
                <fo:block>(предыдущие</fo:block>
                <fo:block>календарные годы)</fo:block>
              </fo:table-cell>
              <fo:table-cell text-align="center" display-align="center">
                <fo:block>Дата начала использования объекта</fo:block>
                <fo:block>основного средства для операций,</fo:block>
                <fo:block>указанных в пункте 2 статьи 170</fo:block>
                <fo:block>Налогового кодекса Российской</fo:block>
                <fo:block>Федерации</fo:block>
              </fo:table-cell>
              <fo:table-cell text-align="center" margin-left="-17mm" display-align="before">
                <fo:block>Доля отгруженных товаров (работ,</fo:block>
                <fo:block>услуг), имущественных прав, не</fo:block>
                <fo:block>облагаемых налогом, в общей</fo:block>
                <fo:block>стоимости отгрузки (%)</fo:block>
              </fo:table-cell>
              <fo:table-cell text-align="center" margin-left="-28mm" display-align="before">
                <fo:block>Сумма налога, подлежащая</fo:block>
                <fo:block>восстановлению и уплате в бюджет за</fo:block>
                <fo:block>календарный год (истекшие календарные</fo:block>
                <fo:block>годы) в рублях</fo:block>
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row height="8mm">
              <fo:table-cell text-align="center" display-align="center">
                <fo:block>1</fo:block>
              </fo:table-cell>
              <fo:table-cell text-align="center" display-align="center">
                <fo:block>2</fo:block>
              </fo:table-cell>
              <fo:table-cell text-align="center" margin-left="-17mm" display-align="center">
                <fo:block>3</fo:block>
              </fo:table-cell>
              <fo:table-cell text-align="center" margin-left="-28mm" display-align="center">
                <fo:block>4</fo:block>
              </fo:table-cell>
            </fo:table-row>
          </fo:table-body>
        </fo:table>
      </fo:static-content>
      <fo:flow flow-name="xsl-region-body" font-size="9pt" font-family="Arial">
        <fo:table table-layout="fixed" width="100%">
          <fo:table-column column-width="11mm" />
          <fo:table-column column-width="38mm" />
          <fo:table-column column-width="63mm" />
          <fo:table-column column-width="38mm" />
          <fo:table-column column-width="50mm" />
          <fo:table-body>
            <x:for-each select="СведНалГод">
              <fo:table-row height="8.5mm">
                <fo:table-cell>
                  <fo:block />
                </fo:table-cell>
                <fo:table-cell display-align="center">
                  <fo:block>
                    <x:call-template name="table">
                      <x:with-param name="value" select="@ГодОтч" />
                      <x:with-param name="column-count" select="'4'" />
                      <x:with-param name="ch" select="'-'" />
                    </x:call-template>
                  </fo:block>
                </fo:table-cell>
                <fo:table-cell display-align="center">
                  <fo:block>
                    <x:call-template name="Дата">
                      <x:with-param name="Дата" select="@ДатаИсп170" />
                    </x:call-template>
                  </fo:block>
                </fo:table-cell>
                <fo:table-cell display-align="center">
                  <fo:block>
                    <x:call-template name="Доля">
                      <x:with-param name="Доля" select="@ДоляНеОбл" />
                    </x:call-template>
                  </fo:block>
                </fo:table-cell>
                <fo:table-cell display-align="center">
                  <fo:block>
                    <x:call-template name="table">
                      <x:with-param name="value" select="@НалГод" />
                      <x:with-param name="column-count" select="'10'" />
                      <x:with-param name="ch" select="'-'" />
                    </x:call-template>
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
            </x:for-each>
            <x:call-template name="СведНалГодПусто">
              <x:with-param name="i" select="count(СведНалГод)" />
              <x:with-param name="countAllRows" select="(10 * ceiling(count(СведНалГод) div 10))" />
            </x:call-template>
            <x:if test="count(СведНалГод) = 0">
              <x:call-template name="СведНалГодПусто">
                <x:with-param name="i" select="0" />
                <x:with-param name="countAllRows" select="10" />
              </x:call-template>
            </x:if>
          </fo:table-body>
        </fo:table>
      </fo:flow>
      <fo:static-content flow-name="xsl-region-after" font-size="9pt" font-family="Arial">
        <fo:block-container top="-15mm" position="absolute">
          <x:call-template name="подпись-эцп-мини" />
        </fo:block-container>
      </fo:static-content>
    </fo:page-sequence>
  </x:template>
  <x:template match="СумВычИн">
    <x:param name="СвНП" />
    <fo:page-sequence master-reference="Portrait3" format="001">
      <fo:static-content flow-name="xsl-region-before" font-size="11pt" font-family="Arial">
        <x:call-template name="Рамка_Portrait" />
        <x:choose>
          <x:when test="$СвНП/НПЮЛ">
            <x:call-template name="ИНН_КПП_Portrait">
              <x:with-param name="ИНН" select="$СвНП/НПЮЛ/@ИННЮЛ" />
              <x:with-param name="КПП" select="$СвНП/НПЮЛ/@КПП" />
            </x:call-template>
          </x:when>
          <x:when test="$СвНП/НПФЛ">
            <x:call-template name="ИНН_КПП_Portrait">
              <x:with-param name="ИНН" select="$СвНП/НПФЛ/@ИННФЛ" />
            </x:call-template>
          </x:when>
        </x:choose>
        <x:call-template name="ШтрихКод_Portrait">
          <x:with-param name="код" select="'-0031-aahj-'" />
        </x:call-template>
        <fo:block space-after="20mm" />
        <fo:block text-align="right" display-align="center">Приложение 2 к разделу 3 декларации</fo:block>
        <fo:block space-after="5mm" />
        <fo:block text-align="center" display-align="center" font-size="9.5pt" font-weight="bold">Расчет суммы налога, исчисленной по операциям по реализации товаров (работ, услуг), передаче</fo:block>
        <fo:block text-align="center" display-align="center" font-size="9.5pt" font-weight="bold">имущественных прав и суммы налога, подлежащей вычету, иностранной организацией, осуществляющей</fo:block>
        <fo:block text-align="center" display-align="center" font-size="9.5pt" font-weight="bold">предпринимательскую деятельность на территории Российской Федерации через свои подразделения</fo:block>
        <fo:block text-align="center" display-align="center" font-size="9.5pt" font-weight="bold">(представительства, отделения)</fo:block>
        <fo:block space-after="5mm" />
        <fo:table table-layout="fixed" width="100%">
          <fo:table-column column-width="58mm" />
          <fo:table-column column-width="72mm" />
          <fo:table-column column-width="65mm" />
          <fo:table-body>
            <fo:table-row font-size="8pt" font-style="italic">
              <fo:table-cell text-align="center" display-align="center" linefeed-treatment="preserve">
                <fo:block>КПП подразделений иностранной
организации, состоящей на учете в
налоговых органах Российской Федерации</fo:block>
              </fo:table-cell>
              <fo:table-cell text-align="center" display-align="before" linefeed-treatment="preserve">
                <fo:block>Сумма налога, исчисленная по операциям,
подлежащим налогообложению (руб.)</fo:block>
              </fo:table-cell>
              <fo:table-cell text-align="center" display-align="before">
                <fo:block>Сумма налоговых вычетов (руб.)</fo:block>
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row font-size="8.5pt">
              <fo:table-cell text-align="center" display-align="center">
                <fo:block>1</fo:block>
              </fo:table-cell>
              <fo:table-cell text-align="center" display-align="center">
                <fo:block>2</fo:block>
              </fo:table-cell>
              <fo:table-cell text-align="center" display-align="center">
                <fo:block>3</fo:block>
              </fo:table-cell>
            </fo:table-row>
          </fo:table-body>
        </fo:table>
      </fo:static-content>
      <fo:flow flow-name="xsl-region-body" font-size="9pt" font-family="Arial">
        <fo:table table-layout="fixed" width="100%">
          <fo:table-column column-width="58mm" />
          <fo:table-column column-width="72mm" />
          <fo:table-column column-width="65mm" />
          <fo:table-body>
            <x:for-each select="СведНалГодИ">
              <fo:table-row height="8.5mm">
                <fo:table-cell display-align="center" padding-left="6mm">
                  <fo:block>
                    <x:call-template name="table">
                      <x:with-param name="column-count" select="'9'" />
                      <x:with-param name="value" select="@КППИнУч" />
                      <x:with-param name="ch" select="'-'" />
                    </x:call-template>
                  </fo:block>
                </fo:table-cell>
                <fo:table-cell display-align="center" padding-left="6mm">
                  <x:call-template name="Сумма">
                    <x:with-param name="Сумма" select="@СумНалИсч" />
                  </x:call-template>
                </fo:table-cell>
                <fo:table-cell display-align="center" padding-left="3mm">
                  <x:call-template name="Сумма">
                    <x:with-param name="Сумма" select="@СумНалВыч" />
                  </x:call-template>
                </fo:table-cell>
              </fo:table-row>
            </x:for-each>
            <x:call-template name="СведНалГодИПусто">
              <x:with-param name="i" select="count(СведНалГодИ)" />
              <x:with-param name="countAllRows" select="(23 * ceiling(count(СведНалГодИ) div 23))" />
            </x:call-template>
          </fo:table-body>
        </fo:table>
      </fo:flow>
      <fo:static-content flow-name="xsl-region-after" font-size="9pt" font-family="Arial">
        <fo:block-container top="-15mm" position="absolute">
          <x:call-template name="подпись-эцп-мини" />
        </fo:block-container>
      </fo:static-content>
    </fo:page-sequence>
  </x:template>
  <!--Раздел 4-->
  <x:template match="НалПодтв0">
    <x:param name="СвНП" />
    <fo:page-sequence master-reference="Portrait4" format="001">
      <fo:static-content flow-name="xsl-region-before" font-size="11pt" font-family="Arial">
        <x:call-template name="Рамка_Portrait" />
        <x:choose>
          <x:when test="$СвНП/НПЮЛ">
            <x:call-template name="ИНН_КПП_Portrait">
              <x:with-param name="ИНН" select="$СвНП/НПЮЛ/@ИННЮЛ" />
              <x:with-param name="КПП" select="$СвНП/НПЮЛ/@КПП" />
            </x:call-template>
          </x:when>
          <x:when test="$СвНП/НПФЛ">
            <x:call-template name="ИНН_КПП_Portrait">
              <x:with-param name="ИНН" select="$СвНП/НПФЛ/@ИННФЛ" />
            </x:call-template>
          </x:when>
        </x:choose>
        <x:call-template name="ШтрихКод_Portrait">
          <x:with-param name="код" select="'-0031-aaig-'" />
        </x:call-template>
        <fo:block space-after="20mm" />
        <fo:block text-align="center" display-align="center" font-size="9.5pt" font-weight="bold">Раздел 4. Расчет суммы налога по операциям по реализации товаров (работ, услуг), обоснованность применения</fo:block>
        <fo:block text-align="center" display-align="center" font-size="9.5pt" font-weight="bold">
          налоговой ставки 0 процентов по которым  документально подтверждена<fo:inline font-size="65%" vertical-align="text-top"> 1</fo:inline></fo:block>
        <fo:block space-after="3mm" />
        <fo:table table-layout="fixed" width="100%">
          <fo:table-column column-width="118mm" />
          <fo:table-column column-width="20mm" />
          <fo:table-column column-width="50mm" />
          <fo:table-body>
            <fo:table-row font-size="8.5">
              <fo:table-cell text-align="center" display-align="center">
                <fo:block>Показатели</fo:block>
              </fo:table-cell>
              <fo:table-cell text-align="center" display-align="center">
                <fo:block>Код строки</fo:block>
              </fo:table-cell>
              <fo:table-cell text-align="center" display-align="center">
                <fo:block>Значения показателей</fo:block>
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row font-size="8.5" height="6mm">
              <fo:table-cell text-align="center" display-align="center">
                <fo:block>1</fo:block>
              </fo:table-cell>
              <fo:table-cell text-align="center" display-align="center">
                <fo:block>2</fo:block>
              </fo:table-cell>
              <fo:table-cell text-align="center" display-align="center">
                <fo:block>3</fo:block>
              </fo:table-cell>
            </fo:table-row>
          </fo:table-body>
        </fo:table>
        <fo:block space-after="242mm" />
        <fo:block font-size="8pt" text-align="left" display-align="center" margin-left="10mm">
          <fo:inline font-size="65%" vertical-align="text-top">1 </fo:inline>Заполняется необходимое количество листов данного раздела
        </fo:block>
        <fo:block space-after="1mm" />
        <fo:block font-size="8pt" text-align="left" display-align="center" margin-left="10mm">
          <fo:inline font-size="65%" vertical-align="text-top">2 </fo:inline>Указывается на первой странице, на остальных - ставится прочерк.
        </fo:block>
      </fo:static-content>
      <fo:flow flow-name="xsl-region-body" font-size="9pt" font-family="Arial">
        <fo:table table-layout="fixed" width="100%">
          <fo:table-column column-width="118mm" />
          <fo:table-column column-width="20mm" />
          <fo:table-column column-width="50mm" />
          <fo:table-body>
            <x:for-each select="СумОпер4">
              <fo:table-row font-size="8.5">
                <fo:table-cell text-align="left" display-align="center">
                  <fo:block>Код операции</fo:block>
                </fo:table-cell>
                <fo:table-cell text-align="center" display-align="center">
                  <fo:block>010</fo:block>
                </fo:table-cell>
                <fo:table-cell display-align="center" font-family="Cour" font-size="14pt">
                  <fo:block>
                    <x:call-template name="box">
                      <x:with-param name="value" select="@КодОпер" />
                    </x:call-template>
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row height="1mm">
                <fo:table-cell>
                  <fo:block />
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row font-size="8.5">
                <fo:table-cell text-align="left" display-align="center">
                  <fo:block>Налоговая база</fo:block>
                </fo:table-cell>
                <fo:table-cell display-align="center">
                  <fo:block>020</fo:block>
                </fo:table-cell>
                <fo:table-cell display-align="center" font-family="Cour" font-size="14pt">
                  <fo:block>
                    <x:call-template name="box">
                      <x:with-param name="value" select="@НалБаза" />
                    </x:call-template>
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row height="1mm">
                <fo:table-cell>
                  <fo:block />
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row font-size="8.5">
                <fo:table-cell text-align="left" display-align="center">
                  <fo:block>Налоговые вычеты по операциям, обоснованность применения налоговой ставки</fo:block>
                  <fo:block>0 процентов по которым документально подтверждена</fo:block>
                </fo:table-cell>
                <fo:table-cell text-align="center" display-align="center">
                  <fo:block>030</fo:block>
                </fo:table-cell>
                <fo:table-cell display-align="center" font-family="Cour" font-size="14pt">
                  <fo:block>
                    <x:call-template name="box">
                      <x:with-param name="value" select="@НалВычПод" />
                    </x:call-template>
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row height="1mm">
                <fo:table-cell>
                  <fo:block />
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row font-size="8.5">
                <fo:table-cell text-align="left" display-align="center">
                  <fo:block>Сумма налога, ранее исчисленная по операциям, обоснованность применения</fo:block>
                  <fo:block>налоговой ставки 0 процентов по которым ранее не была документально</fo:block>
                  <fo:block>подтверждена</fo:block>
                </fo:table-cell>
                <fo:table-cell text-align="center" display-align="center">
                  <fo:block>040</fo:block>
                </fo:table-cell>
                <fo:table-cell display-align="center" font-family="Cour" font-size="14pt">
                  <fo:block>
                    <x:call-template name="box">
                      <x:with-param name="value" select="@НалНеПод" />
                    </x:call-template>
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row height="1mm">
                <fo:table-cell>
                  <fo:block />
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row font-size="8.5">
                <fo:table-cell text-align="left" display-align="center">
                  <fo:block>Сумма налога, ранее принятая к вычету и подлежащая восстановлению</fo:block>
                </fo:table-cell>
                <fo:table-cell text-align="center" display-align="center">
                  <fo:block>050</fo:block>
                </fo:table-cell>
                <fo:table-cell display-align="center" font-family="Cour" font-size="14pt">
                  <fo:block>
                    <x:call-template name="box">
                      <x:with-param name="value" select="@НалВосст" />
                    </x:call-template>
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row height="1mm">
                <fo:table-cell>
                  <fo:block />
                </fo:table-cell>
              </fo:table-row>
              <!--<x:if test="(position() mod 4)=0">
                <fo:table-row font-size="8.5">
                  <fo:table-cell text-align="left" display-align="center">
                    <fo:block>Код операции</fo:block>
                  </fo:table-cell>
                  <fo:table-cell text-align="center" display-align="center">
                    <fo:block>060</fo:block>
                  </fo:table-cell>
				  
				  <fo:table-cell display-align="center" font-family="Cour" font-size="14pt">
				    <fo:block>
                      <x:call-template name="box">
                        <x:with-param name="value">
                          <x:if test="position() =4">
                            <x:value-of select="1010447" />
                          </x:if>
                        </x:with-param>
                      </x:call-template>
					</fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row height="1.5mm">
                  <fo:table-cell>
                    <fo:block />
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row font-size="8.5">
                  <fo:table-cell text-align="left" display-align="center">
                    <fo:block>
                      Налоговая база<fo:inline font-size="65%" vertical-align="text-top"> 2</fo:inline>
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell text-align="center" display-align="center">
                    <fo:block>070</fo:block>
                  </fo:table-cell>
				  
				  <fo:table-cell display-align="center" font-family="Cour" font-size="14pt">
				    <fo:block>
                      <x:call-template name="box">
                        <x:with-param name="value">
                          <x:if test="position() =4">
                            <x:value-of select="../СумОпер1010447/@НалБаза"/>
                          </x:if>
                        </x:with-param>
                      </x:call-template>
					</fo:block>
                  </fo:table-cell>
				  
                </fo:table-row>
                <fo:table-row height="1.5mm">
                  <fo:table-cell>
                    <fo:block />
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row font-size="8.5">
                  <fo:table-cell text-align="left" display-align="center">
                    <fo:block>
                      Сумма налога, ранее принятая к вычету и подлежащая восстановлению<fo:inline font-size="65%" vertical-align="text-top"> 2</fo:inline>
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell text-align="center" display-align="center">
                    <fo:block>080</fo:block>
                  </fo:table-cell>
				  
				  <fo:table-cell display-align="center" font-family="Cour" font-size="14pt">
				    <fo:block>
                      <x:call-template name="box">
                        <x:with-param name="value">
                          <x:if test="position() =4">
                            <x:value-of select="../СумОпер1010447/@НалВосст"/>
                          </x:if>
                        </x:with-param>
                      </x:call-template>
					</fo:block>
                  </fo:table-cell>
				  
                </fo:table-row>
                <fo:table-row height="1.5mm">
                  <fo:table-cell>
                    <fo:block />
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row font-size="8.5">
                  <fo:table-cell text-align="left" display-align="center">
                    <fo:block>Код операции</fo:block>
                  </fo:table-cell>
                  <fo:table-cell text-align="center" display-align="center">
                    <fo:block>090</fo:block>
                  </fo:table-cell>
				  
				  <fo:table-cell display-align="center" font-family="Cour" font-size="14pt">
				    <fo:block>
                      <x:call-template name="box">
                        <x:with-param name="value">
                          <x:if test="position() =4">
                            <x:value-of select="1010448" />
                          </x:if>
                        </x:with-param>
                      </x:call-template>
					</fo:block>
                  </fo:table-cell>
				  
                </fo:table-row>
                <fo:table-row height="1.5mm">
                  <fo:table-cell>
                    <fo:block />
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row font-size="8.5">
                  <fo:table-cell text-align="left" display-align="center">
                    <fo:block>Сумма, на которую корректируется налоговая база при увеличении цены</fo:block>
                    <fo:block>
                      реализованных товаров (работ, услуг)<fo:inline font-size="65%" vertical-align="text-top"> 2</fo:inline>
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell text-align="center" display-align="center">
                    <fo:block>100</fo:block>
                  </fo:table-cell>
				  
				  <fo:table-cell display-align="center" font-family="Cour" font-size="14pt">
				    <fo:block>
                      <x:call-template name="box">
                        <x:with-param name="value">
                          <x:if test="position() =4">
                            <x:value-of select="../СумОпер1010448/@КорНалБазаУв"/>
                          </x:if>
                        </x:with-param>
                      </x:call-template>
					</fo:block>
                  </fo:table-cell>
				  
                </fo:table-row>
                <fo:table-row height="1.5mm">
                  <fo:table-cell>
                    <fo:block />
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row height="1.5mm">
                  <fo:table-cell>
                    <fo:block />
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row font-size="8.5">
                  <fo:table-cell text-align="left" display-align="center">
                    <fo:block>Сумма, на которую корректируется налоговая база при уменьшении цены</fo:block>
                    <fo:block>
                      реализованных товаров (работ, услуг)<fo:inline font-size="65%" vertical-align="text-top"> 2</fo:inline>
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell text-align="center" display-align="center">
                    <fo:block>110</fo:block>
                  </fo:table-cell>
				  
				  <fo:table-cell display-align="center" font-family="Cour" font-size="14pt">
				    <fo:block>
                      <x:call-template name="box">
                        <x:with-param name="value">
                          <x:if test="position() =4">
                            <x:value-of select="../СумОпер1010448/@КорНалБазаУм"/>
                          </x:if>
                        </x:with-param>
                      </x:call-template>
					</fo:block>
                  </fo:table-cell>
				  
                </fo:table-row>
                <fo:table-row height="1.5mm">
                  <fo:table-cell>
                    <fo:block />
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row font-size="8.5">
                  <fo:table-cell text-align="left" display-align="center">
                    <fo:block>
                      Итого сумма налога, исчисленная к возмещению по разделу 4<fo:inline font-size="65%" vertical-align="text-top"> 2</fo:inline>
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell text-align="center" display-align="center">
                    <fo:block>120</fo:block>
                  </fo:table-cell>
				  
				  <fo:table-cell display-align="before" font-family="Cour" font-size="14pt">
				    <fo:block>
                      <x:call-template name="xabs_box">
                        <x:with-param name="n">
                          <x:if test="position() =4">
                            <x:value-of select="../@СумИсчислИтог"/>
                          </x:if>
                        </x:with-param>
                      </x:call-template>
					</fo:block>
                  </fo:table-cell>
				  
              
                </fo:table-row>
                <fo:table-row height="1.5mm">
                  <fo:table-cell>
                    <fo:block />
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row font-size="8.5">
                  <fo:table-cell text-align="left" display-align="center">
                    <fo:block>
                      Итого сумма налога, исчисленная к уплате по разделу 4<fo:inline font-size="65%" vertical-align="text-top"> 2</fo:inline>
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell text-align="center" display-align="center">
                    <fo:block>130</fo:block>
                  </fo:table-cell>
				  
				  <fo:table-cell display-align="before" font-family="Cour" font-size="14pt">
				    <fo:block>
                    <x:choose>
                      <x:when test="@СумИсчислИтог = 0">
                        <x:call-template name="box">
                          <x:with-param name="value" select="'-'"/>
                        </x:call-template>
                      </x:when>
                      <x:otherwise>
                        <x:call-template name="xabs_box">
                          <x:with-param name="n">
                            <x:if test="position() =4">
                              <x:value-of select="-1*(../@СумИсчислИтог)"/>
                            </x:if>
                          </x:with-param>
                        </x:call-template>
                      </x:otherwise>
                    </x:choose>
					</fo:block>
                  </fo:table-cell>
				  
                </fo:table-row>
              </x:if>-->
            </x:for-each>
            <x:call-template name="СумОпер4Пусто">
              <x:with-param name="i" select="count(СумОпер4)" />
              <x:with-param name="countAllRows" select="(4 * ceiling(count(СумОпер4) div 4))" />
            </x:call-template>
            <x:if test="count(СумОпер4) = 0">
              <x:call-template name="СумОпер4Пусто">
                <x:with-param name="i" select="0" />
                <x:with-param name="countAllRows" select="4" />
              </x:call-template>
            </x:if>
            <x:for-each select="КорНБВозврТов">
              <fo:table-row font-size="8.5">
                <fo:table-cell text-align="left" display-align="center">
                  <fo:block>Код операции</fo:block>
                </fo:table-cell>
                <fo:table-cell text-align="center" display-align="center">
                  <fo:block>060</fo:block>
                </fo:table-cell>
                <fo:table-cell display-align="center" font-family="Cour" font-size="14pt">
                  <fo:block>
                    <x:call-template name="box">
                      <x:with-param name="value">
                        <x:value-of select="@КодОпер" />
                      </x:with-param>
                    </x:call-template>
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row height="1mm">
                <fo:table-cell>
                  <fo:block />
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row font-size="8">
                <fo:table-cell text-align="left" display-align="center">
                  <fo:block>
                      Налоговая база<fo:inline font-size="65%" vertical-align="text-top"> 2</fo:inline></fo:block>
                </fo:table-cell>
                <fo:table-cell text-align="center" display-align="center">
                  <fo:block>070</fo:block>
                </fo:table-cell>
                <fo:table-cell display-align="center" font-family="Cour" font-size="14pt">
                  <fo:block>
                    <x:call-template name="box">
                      <x:with-param name="value">
                        <x:value-of select="@НалБаза" />
                      </x:with-param>
                    </x:call-template>
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row height="1.5mm">
                <fo:table-cell>
                  <fo:block />
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row font-size="8.5">
                <fo:table-cell text-align="left" display-align="center">
                  <fo:block>
                      Сумма налога, ранее принятая к вычету и подлежащая восстановлению<fo:inline font-size="65%" vertical-align="text-top"> 2</fo:inline></fo:block>
                </fo:table-cell>
                <fo:table-cell text-align="center" display-align="center">
                  <fo:block>080</fo:block>
                </fo:table-cell>
                <fo:table-cell display-align="center" font-family="Cour" font-size="14pt">
                  <fo:block>
                    <x:call-template name="box">
                      <x:with-param name="value">
                        <x:value-of select="@НалВосст" />
                      </x:with-param>
                    </x:call-template>
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row height="1.5mm">
                <fo:table-cell>
                  <fo:block />
                </fo:table-cell>
              </fo:table-row>
            </x:for-each>
            <x:if test="count(КорНБВозврТов) = 0">
              <x:call-template name="КорНБВозврТовПусто">
                <x:with-param name="i" select="0" />
                <x:with-param name="countAllRows" select="4" />
              </x:call-template>
            </x:if>
            <x:for-each select="КорНБИзмЦен">
              <fo:table-row font-size="8.5">
                <fo:table-cell text-align="left" display-align="center">
                  <fo:block>Код операции</fo:block>
                </fo:table-cell>
                <fo:table-cell text-align="center" display-align="center">
                  <fo:block>090</fo:block>
                </fo:table-cell>
                <fo:table-cell display-align="center" font-family="Cour" font-size="14pt">
                  <fo:block>
                    <x:call-template name="box">
                      <x:with-param name="value">
                        <x:value-of select="@КодОпер" />
                      </x:with-param>
                    </x:call-template>
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row height="1mm">
                <fo:table-cell>
                  <fo:block />
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row font-size="8.5">
                <fo:table-cell text-align="left" display-align="center">
                  <fo:block>Сумма, на которую корректируется налоговая база при увеличении цены</fo:block>
                  <fo:block>
                      реализованных товаров (работ, услуг)<fo:inline font-size="65%" vertical-align="text-top"> 2</fo:inline></fo:block>
                </fo:table-cell>
                <fo:table-cell text-align="center" display-align="center">
                  <fo:block>100</fo:block>
                </fo:table-cell>
                <fo:table-cell display-align="center" font-family="Cour" font-size="14pt">
                  <fo:block>
                    <x:call-template name="box">
                      <x:with-param name="value">
                        <x:value-of select="@КорНалБазаУв" />
                      </x:with-param>
                    </x:call-template>
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row height="1mm">
                <fo:table-cell>
                  <fo:block />
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row height="1mm">
                <fo:table-cell>
                  <fo:block />
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row font-size="8.5">
                <fo:table-cell text-align="left" display-align="center">
                  <fo:block>Сумма, на которую корректируется налоговая база при уменьшении цены</fo:block>
                  <fo:block>
                    реализованных товаров (работ, услуг)<fo:inline font-size="65%" vertical-align="text-top"> 2</fo:inline></fo:block>
                </fo:table-cell>
                <fo:table-cell text-align="center" display-align="center">
                  <fo:block>110</fo:block>
                </fo:table-cell>
                <fo:table-cell display-align="center" font-family="Cour" font-size="14pt">
                  <fo:block>
                    <x:call-template name="box">
                      <x:with-param name="value">
                        <x:value-of select="@КорНалБазаУм" />
                      </x:with-param>
                    </x:call-template>
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row height="1mm">
                <fo:table-cell>
                  <fo:block />
                </fo:table-cell>
              </fo:table-row>
            </x:for-each>
            <x:if test="count(КорНБИзмЦен) = 0">
              <x:call-template name="КорНБИзмЦенПусто">
                <x:with-param name="i" select="0" />
                <x:with-param name="countAllRows" select="4" />
              </x:call-template>
            </x:if>
            <fo:table-row height="1mm">
              <fo:table-cell>
                <fo:block />
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row font-size="8.5">
              <fo:table-cell text-align="left" display-align="center">
                <fo:block>
                    Итого сумма налога, исчисленная к возмещению по разделу 4<fo:inline font-size="65%" vertical-align="text-top"> 2</fo:inline></fo:block>
              </fo:table-cell>
              <fo:table-cell text-align="center" display-align="center">
                <fo:block>120</fo:block>
              </fo:table-cell>
              <fo:table-cell display-align="before" font-family="Cour" font-size="14pt">
                <x:choose>
                  <x:when test="not(@СумИсчислИтог)">
                    <x:call-template name="box">
                      <x:with-param name="value" select="''" />
                    </x:call-template>
                  </x:when>
                  <x:otherwise>
                    <x:call-template name="xabs_box">
                      <x:with-param name="n">
                        <x:value-of select="@СумИсчислИтог" />
                      </x:with-param>
                    </x:call-template>
                  </x:otherwise>
                </x:choose>
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row height="1mm">
              <fo:table-cell>
                <fo:block />
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row font-size="8.5">
              <fo:table-cell text-align="left" display-align="center">
                <fo:block>
                    Итого сумма налога, исчисленная к уплате по разделу 4<fo:inline font-size="65%" vertical-align="text-top"> 2</fo:inline></fo:block>
              </fo:table-cell>
              <fo:table-cell text-align="center" display-align="center">
                <fo:block>130</fo:block>
              </fo:table-cell>
              <fo:table-cell display-align="before" font-family="Cour" font-size="14pt">
                <x:choose>
                  <x:when test="not(@СумИсчислИтог)">
                    <x:call-template name="box">
                      <x:with-param name="value" select="''" />
                    </x:call-template>
                  </x:when>
                  <x:when test="@СумИсчислИтог = 0">
                    <x:call-template name="box">
                      <x:with-param name="value" select="'-'" />
                    </x:call-template>
                  </x:when>
                  <x:otherwise>
                    <x:call-template name="xabs_box">
                      <x:with-param name="n">
                        <x:value-of select="-1*@СумИсчислИтог" />
                      </x:with-param>
                    </x:call-template>
                  </x:otherwise>
                </x:choose>
              </fo:table-cell>
            </fo:table-row>
          </fo:table-body>
        </fo:table>
      </fo:flow>
      <fo:static-content flow-name="xsl-region-after" font-size="9pt" font-family="Arial">
        <fo:block-container top="-15mm" position="absolute">
          <x:call-template name="подпись-эцп-мини" />
        </fo:block-container>
      </fo:static-content>
    </fo:page-sequence>
  </x:template>
  <!--Раздел 5-->
  <x:template match="НалВычПред0">
    <x:param name="СвНП" />
    <fo:page-sequence master-reference="Portrait5" format="001">
      <fo:static-content flow-name="xsl-region-before" font-size="11pt" font-family="Arial">
        <x:call-template name="Рамка_Portrait" />
        <x:choose>
          <x:when test="$СвНП/НПЮЛ">
            <x:call-template name="ИНН_КПП_Portrait">
              <x:with-param name="ИНН" select="$СвНП/НПЮЛ/@ИННЮЛ" />
              <x:with-param name="КПП" select="$СвНП/НПЮЛ/@КПП" />
            </x:call-template>
          </x:when>
          <x:when test="$СвНП/НПФЛ">
            <x:call-template name="ИНН_КПП_Portrait">
              <x:with-param name="ИНН" select="$СвНП/НПФЛ/@ИННФЛ" />
            </x:call-template>
          </x:when>
        </x:choose>
        <x:call-template name="ШтрихКод_Portrait">
          <x:with-param name="код" select="'-0031-aajd-'" />
        </x:call-template>
        <fo:block space-after="20mm" />
        <fo:block text-align="center" display-align="center" font-size="9.5pt" font-weight="bold">Раздел 5. Расчет суммы налоговых вычетов по операциям по реализации товаров (работ, услуг),</fo:block>
        <fo:block text-align="center" display-align="center" font-size="9.5pt" font-weight="bold">обоснованность применения налоговой ставки 0 процентов по которым ранее документально подтверждена</fo:block>
        <fo:block text-align="center" display-align="center" font-size="9.5pt" font-weight="bold">
          (не подтверждена)<fo:inline font-size="65%" vertical-align="text-top"> 1</fo:inline></fo:block>
        <fo:block space-after="3mm" />
        <fo:table table-layout="fixed" width="100%">
          <fo:table-column column-width="118mm" />
          <fo:table-column column-width="20mm" />
          <fo:table-column column-width="50mm" />
          <fo:table-body>
            <fo:table-row font-size="8.5">
              <fo:table-cell text-align="center" display-align="center">
                <fo:block>Показатели</fo:block>
              </fo:table-cell>
              <fo:table-cell text-align="center" display-align="center">
                <fo:block>Код строки</fo:block>
              </fo:table-cell>
              <fo:table-cell text-align="center" display-align="center">
                <fo:block>Значения показателей</fo:block>
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row font-size="8.5" height="6mm">
              <fo:table-cell text-align="center" display-align="center">
                <fo:block>1</fo:block>
              </fo:table-cell>
              <fo:table-cell text-align="center" display-align="center">
                <fo:block>2</fo:block>
              </fo:table-cell>
              <fo:table-cell text-align="center" display-align="center">
                <fo:block>3</fo:block>
              </fo:table-cell>
            </fo:table-row>
          </fo:table-body>
        </fo:table>
        <fo:block space-after="238mm" />
        <fo:block font-size="8pt" text-align="left" display-align="center" margin-left="10mm">
          <fo:inline font-size="65%" vertical-align="text-top">1 </fo:inline>Заполняется необходимое количество листов данного раздела
        </fo:block>
        <fo:block space-after="1mm" />
        <fo:block font-size="8pt" text-align="left" display-align="center" margin-left="10mm">
          <fo:inline font-size="65%" vertical-align="text-top">2 </fo:inline>Указывается на первой странице, на остальных - ставится прочерк.
        </fo:block>
      </fo:static-content>
      <fo:flow flow-name="xsl-region-body" font-size="9pt" font-family="Arial">
        <x:for-each select="СумПер">
          <x:choose>
            <x:when test="position()=1">
              <fo:table table-layout="fixed" width="100%">
                <fo:table-column column-width="118mm" />
                <fo:table-column column-width="20mm" />
                <fo:table-column column-width="50mm" />
                <fo:table-header>
                  <fo:table-row font-size="8.5">
                    <fo:table-cell text-align="left" display-align="center">
                      <fo:block>Отчетный год</fo:block>
                    </fo:table-cell>
                    <fo:table-cell text-align="center" display-align="center">
                      <fo:block>010</fo:block>
                    </fo:table-cell>
                    <fo:table-cell text-align="center" display-align="center">
                      <fo:block>
                        <x:call-template name="table">
                          <x:with-param name="value" select="@ОтчетГод" />
                          <x:with-param name="column-count" select="'4'" />
                          <x:with-param name="ch" select="'-'" />
                        </x:call-template>
                      </fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row height="1.5mm">
                    <fo:table-cell>
                      <fo:block />
                    </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row font-size="8.5">
                    <fo:table-cell text-align="left" display-align="center">
                      <fo:block>Налоговый период (код)</fo:block>
                    </fo:table-cell>
                    <fo:table-cell text-align="center" display-align="center">
                      <fo:block>020</fo:block>
                    </fo:table-cell>
                    <fo:table-cell text-align="center" display-align="center">
                      <fo:block>
                        <x:call-template name="table">
                          <x:with-param name="value" select="@Период" />
                          <x:with-param name="column-count" select="'2'" />
                          <x:with-param name="ch" select="'-'" />
                        </x:call-template>
                      </fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row height="1.5mm">
                    <fo:table-cell>
                      <fo:block />
                    </fo:table-cell>
                  </fo:table-row>
                </fo:table-header>
                <fo:table-body>
                  <x:for-each select="СумОпер5">
                    <fo:table-row font-size="8.5">
                      <fo:table-cell text-align="left" display-align="center">
                        <fo:block>Код операции</fo:block>
                      </fo:table-cell>
                      <fo:table-cell text-align="center" display-align="center">
                        <fo:block>030</fo:block>
                      </fo:table-cell>
                      <fo:table-cell display-align="center" font-family="Cour" font-size="14pt">
                        <fo:block>
                          <x:call-template name="box">
                            <x:with-param name="value" select="@КодОпер" />
                          </x:call-template>
                        </fo:block>
                      </fo:table-cell>
                    </fo:table-row>
                    <fo:table-row height="1.5mm">
                      <fo:table-cell>
                        <fo:block />
                      </fo:table-cell>
                    </fo:table-row>
                    <fo:table-row font-size="8.5">
                      <fo:table-cell text-align="left" display-align="center" number-columns-spanned="3">
                        <fo:block>По операциям, обоснованность применения налоговой ставки 0 процентов по</fo:block>
                        <fo:block>которым документально подтверждена в предыдущих налоговых периодах:</fo:block>
                      </fo:table-cell>
                    </fo:table-row>
                    <fo:table-row height="1.5mm">
                      <fo:table-cell>
                        <fo:block />
                      </fo:table-cell>
                    </fo:table-row>
                    <fo:table-row font-size="8.5">
                      <fo:table-cell text-align="left" margin-left="5mm" display-align="center">
                        <fo:block>Налоговая база</fo:block>
                      </fo:table-cell>
                      <fo:table-cell text-align="center" display-align="center">
                        <fo:block>040</fo:block>
                      </fo:table-cell>
                      <fo:table-cell display-align="center" font-family="Cour" font-size="14pt">
                        <fo:block>
                          <x:call-template name="box">
                            <x:with-param name="value" select="@НалБазаПод" />
                          </x:call-template>
                        </fo:block>
                      </fo:table-cell>
                    </fo:table-row>
                    <fo:table-row height="1.5mm">
                      <fo:table-cell>
                        <fo:block />
                      </fo:table-cell>
                    </fo:table-row>
                    <fo:table-row font-size="8.5">
                      <fo:table-cell text-align="left" margin-left="5mm" display-align="center">
                        <fo:block>Налоговые вычеты</fo:block>
                      </fo:table-cell>
                      <fo:table-cell text-align="center" display-align="center">
                        <fo:block>050</fo:block>
                      </fo:table-cell>
                      <fo:table-cell display-align="center" font-family="Cour" font-size="14pt">
                        <fo:block>
                          <x:call-template name="box">
                            <x:with-param name="value" select="@НалВычПод" />
                          </x:call-template>
                        </fo:block>
                      </fo:table-cell>
                    </fo:table-row>
                    <fo:table-row height="1.5mm">
                      <fo:table-cell>
                        <fo:block />
                      </fo:table-cell>
                    </fo:table-row>
                    <fo:table-row font-size="8.5">
                      <fo:table-cell text-align="left" display-align="center" number-columns-spanned="3">
                        <fo:block>По операциям, обоснованность применения налоговой ставки 0 процентов по</fo:block>
                        <fo:block>которым документально не подтверждена в предыдущих налоговых периодах:</fo:block>
                      </fo:table-cell>
                    </fo:table-row>
                    <fo:table-row height="1.5mm">
                      <fo:table-cell>
                        <fo:block />
                      </fo:table-cell>
                    </fo:table-row>
                    <fo:table-row font-size="8.5">
                      <fo:table-cell text-align="left" margin-left="5mm" display-align="center">
                        <fo:block>Налоговая база</fo:block>
                      </fo:table-cell>
                      <fo:table-cell text-align="center" display-align="center">
                        <fo:block>060</fo:block>
                      </fo:table-cell>
                      <fo:table-cell display-align="center" font-family="Cour" font-size="14pt">
                        <fo:block>
                          <x:call-template name="box">
                            <x:with-param name="value" select="@НалБазаНеПод" />
                          </x:call-template>
                        </fo:block>
                      </fo:table-cell>
                    </fo:table-row>
                    <fo:table-row height="1.5mm">
                      <fo:table-cell>
                        <fo:block />
                      </fo:table-cell>
                    </fo:table-row>
                    <fo:table-row font-size="8.5">
                      <fo:table-cell text-align="left" margin-left="5mm" display-align="center">
                        <fo:block>Налоговые вычеты</fo:block>
                      </fo:table-cell>
                      <fo:table-cell text-align="center" display-align="center">
                        <fo:block>070</fo:block>
                      </fo:table-cell>
                      <fo:table-cell display-align="center" font-family="Cour" font-size="14pt">
                        <fo:block>
                          <x:call-template name="box">
                            <x:with-param name="value" select="@НалВычНеПод" />
                          </x:call-template>
                        </fo:block>
                      </fo:table-cell>
                    </fo:table-row>
                    <fo:table-row height="1.5mm">
                      <fo:table-cell>
                        <fo:block />
                      </fo:table-cell>
                    </fo:table-row>
                    <x:if test="(position() mod 3)=0">
                      <fo:table-row height="3mm">
                        <fo:table-cell>
                          <fo:block />
                        </fo:table-cell>
                      </fo:table-row>
                      <fo:table-row font-size="8.5">
                        <fo:table-cell text-align="left" display-align="center">
                          <fo:block>Сумма налога, принимаемая к вычету, по операциям, обоснованность применения</fo:block>
                          <fo:block>налоговой ставки 0 процентов по которым документально подтверждена в</fo:block>
                          <fo:block>
                            предыдущих налоговых периодах, исчисленная к возмещению по разделу 5<fo:inline font-size="65%" vertical-align="text-top"> 2</fo:inline></fo:block>
                        </fo:table-cell>
                        <fo:table-cell text-align="center" display-align="center">
                          <fo:block>080</fo:block>
                        </fo:table-cell>
                        <fo:table-cell display-align="center" font-family="Cour" font-size="14pt">
                          <fo:block>
                            <x:call-template name="box">
                              <x:with-param name="value">
                                <x:if test="position() =3">
                                  <x:value-of select="../../@СумВозмПдтв" />
                                </x:if>
                              </x:with-param>
                            </x:call-template>
                          </fo:block>
                        </fo:table-cell>
                        <!--fo:table-cell text-align="center" display-align="center">
                      <fo:block>
                        <x:call-template name="table">
                          <x:with-param name="column-count" select="'12'"/>
                          <x:with-param name="ch" select="'-'"/>
                          <x:with-param name="value">
                            <x:if test="position() =3">
                              <x:value-of select="../../@СумВозмПдтв"/>
                            </x:if>
                          </x:with-param>
                        </x:call-template>
                      </fo:block>
                    </fo:table-cell-->
                      </fo:table-row>
                      <fo:table-row height="3mm">
                        <fo:table-cell>
                          <fo:block />
                        </fo:table-cell>
                      </fo:table-row>
                      <fo:table-row font-size="8.5">
                        <fo:table-cell text-align="left" display-align="center">
                          <fo:block>Сумма налога, принимаемая к вычету, по операциям, обоснованность применения</fo:block>
                          <fo:block>налоговой ставки 0 процентов по которым документально не подтверждена в</fo:block>
                          <fo:block>
                            предыдущих налоговых периодах, исчисленная к возмещению по разделу 5<fo:inline font-size="65%" vertical-align="text-top"> 2</fo:inline></fo:block>
                        </fo:table-cell>
                        <fo:table-cell text-align="center" display-align="center">
                          <fo:block>090</fo:block>
                        </fo:table-cell>
                        <fo:table-cell display-align="center" font-family="Cour" font-size="14pt">
                          <fo:block>
                            <x:call-template name="box">
                              <x:with-param name="value">
                                <x:if test="position() =3">
                                  <x:value-of select="../../@СумВозмНеПдтв" />
                                </x:if>
                              </x:with-param>
                            </x:call-template>
                          </fo:block>
                        </fo:table-cell>
                        <!--fo:table-cell text-align="center" display-align="center">
                      <fo:block>
                        <x:call-template name="table">
                          <x:with-param name="column-count" select="'12'"/>
                          <x:with-param name="ch" select="'-'"/>
                          <x:with-param name="value">
                            <x:if test="position() =3">
                              <x:value-of select="../../@СумВозмНеПдтв"/>
                            </x:if>
                          </x:with-param>
                        </x:call-template>
                      </fo:block>
                    </fo:table-cell-->
                      </fo:table-row>
                    </x:if>
                  </x:for-each>
                  <x:call-template name="СумОпер5Пусто">
                    <x:with-param name="i" select="count(СумОпер5)" />
                    <x:with-param name="countAllRows" select="(3 * ceiling(count(СумОпер5) div 3))" />
                  </x:call-template>
                  <x:if test="count(СумОпер5) = 0">
                    <x:call-template name="СумОпер5Пусто">
                      <x:with-param name="i" select="0" />
                      <x:with-param name="countAllRows" select="3" />
                    </x:call-template>
                  </x:if>
                  <x:if test="(count(СумОпер5) mod 3)!=0">
                    <fo:table-row height="3mm">
                      <fo:table-cell>
                        <fo:block />
                      </fo:table-cell>
                    </fo:table-row>
                    <fo:table-row font-size="8.5">
                      <fo:table-cell text-align="left" display-align="center">
                        <fo:block>Сумма налога, принимаемая к вычету, по операциям, обоснованность применения</fo:block>
                        <fo:block>налоговой ставки 0 процентов по которым документально подтверждена в</fo:block>
                        <fo:block>
                          предыдущих налоговых периодах, исчисленная к возмещению по разделу 5<fo:inline font-size="65%" vertical-align="text-top"> 2</fo:inline></fo:block>
                      </fo:table-cell>
                      <fo:table-cell text-align="center" display-align="center">
                        <fo:block>080</fo:block>
                      </fo:table-cell>
                      <fo:table-cell display-align="center" font-family="Cour" font-size="14pt">
                        <fo:block>
                          <x:call-template name="box">
                            <x:with-param name="value">
                              <x:if test="count(СумОпер7)&lt;3 or count(СумОпер7)&gt;3">
                                <x:value-of select="../@СумВозмПдтв" />
                              </x:if>
                            </x:with-param>
                          </x:call-template>
                        </fo:block>
                      </fo:table-cell>
                      <!--fo:table-cell text-align="center" display-align="center">
                    <fo:block>
                      <x:call-template name="table">
                        <x:with-param name="column-count" select="'12'"/>
                        <x:with-param name="ch" select="'-'"/>
                        <x:with-param name="value">
                          <x:if test="count(СумОпер7)&lt;3 or count(СумОпер7)&gt;3">
                            <x:value-of select="../@СумВозмПдтв"/>
                          </x:if>
                        </x:with-param>
                      </x:call-template>
                    </fo:block>
                  </fo:table-cell-->
                    </fo:table-row>
                    <fo:table-row height="3mm">
                      <fo:table-cell>
                        <fo:block />
                      </fo:table-cell>
                    </fo:table-row>
                    <fo:table-row font-size="8.5">
                      <fo:table-cell text-align="left" display-align="center">
                        <fo:block>Сумма налога, принимаемая к вычету, по операциям, обоснованность применения</fo:block>
                        <fo:block>налоговой ставки 0 процентов по которым документально не подтверждена в</fo:block>
                        <fo:block>
                          предыдущих налоговых периодах, исчисленная к возмещению по разделу 5<fo:inline font-size="65%" vertical-align="text-top"> 2</fo:inline></fo:block>
                      </fo:table-cell>
                      <fo:table-cell text-align="center" display-align="center">
                        <fo:block>090</fo:block>
                      </fo:table-cell>
                      <fo:table-cell display-align="center" font-family="Cour" font-size="14pt">
                        <fo:block>
                          <x:call-template name="box">
                            <x:with-param name="value">
                              <x:if test="count(СумОпер7)&lt;3 or count(СумОпер7)&gt;3">
                                <x:value-of select="../@СумВозмНеПдтв" />
                              </x:if>
                            </x:with-param>
                          </x:call-template>
                        </fo:block>
                      </fo:table-cell>
                      <!--fo:table-cell text-align="center" display-align="center">
                    <fo:block>
                      <x:call-template name="table">
                        <x:with-param name="column-count" select="'12'"/>
                        <x:with-param name="ch" select="'-'"/>
                        <x:with-param name="value">
                          <x:if test="count(СумОпер7)&lt;3 or count(СумОпер7)&gt;3">
                            <x:value-of select="../@СумВозмНеПдтв"/>
                          </x:if>
                        </x:with-param>
                      </x:call-template>
                    </fo:block>
                  </fo:table-cell-->
                    </fo:table-row>
                  </x:if>
                </fo:table-body>
              </fo:table>
            </x:when>
            <x:otherwise>
              <fo:table table-layout="fixed" width="100%">
                <fo:table-column column-width="118mm" />
                <fo:table-column column-width="20mm" />
                <fo:table-column column-width="50mm" />
                <fo:table-header>
                  <fo:table-row font-size="8.5">
                    <fo:table-cell text-align="left" display-align="center">
                      <fo:block>Отчетный год</fo:block>
                    </fo:table-cell>
                    <fo:table-cell text-align="center" display-align="center">
                      <fo:block>010</fo:block>
                    </fo:table-cell>
                    <fo:table-cell text-align="center" display-align="center">
                      <fo:block>
                        <x:call-template name="table">
                          <x:with-param name="value" select="@ОтчетГод" />
                          <x:with-param name="column-count" select="'4'" />
                          <x:with-param name="ch" select="'-'" />
                        </x:call-template>
                      </fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row height="1.5mm">
                    <fo:table-cell>
                      <fo:block />
                    </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row font-size="8.5">
                    <fo:table-cell text-align="left" display-align="center">
                      <fo:block>Налоговый период (код)</fo:block>
                    </fo:table-cell>
                    <fo:table-cell text-align="center" display-align="center">
                      <fo:block>020</fo:block>
                    </fo:table-cell>
                    <fo:table-cell text-align="center" display-align="center">
                      <fo:block>
                        <x:call-template name="table">
                          <x:with-param name="value" select="@Период" />
                          <x:with-param name="column-count" select="'2'" />
                          <x:with-param name="ch" select="'-'" />
                        </x:call-template>
                      </fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row height="1.5mm">
                    <fo:table-cell>
                      <fo:block />
                    </fo:table-cell>
                  </fo:table-row>
                </fo:table-header>
                <fo:table-body>
                  <x:for-each select="СумОпер5">
                    <fo:table-row font-size="8.5">
                      <fo:table-cell text-align="left" display-align="center">
                        <fo:block>Код операции</fo:block>
                      </fo:table-cell>
                      <fo:table-cell text-align="center" display-align="center">
                        <fo:block>030</fo:block>
                      </fo:table-cell>
                      <fo:table-cell display-align="center" font-family="Cour" font-size="14pt">
                        <fo:block>
                          <x:call-template name="box">
                            <x:with-param name="value" select="@КодОпер" />
                          </x:call-template>
                        </fo:block>
                      </fo:table-cell>
                    </fo:table-row>
                    <fo:table-row height="1.5mm">
                      <fo:table-cell>
                        <fo:block />
                      </fo:table-cell>
                    </fo:table-row>
                    <fo:table-row font-size="8.5">
                      <fo:table-cell text-align="left" display-align="center" number-columns-spanned="3">
                        <fo:block>По операциям, обоснованность применения налоговой ставки 0 процентов по</fo:block>
                        <fo:block>которым документально подтверждена в предыдущих налоговых периодах:</fo:block>
                      </fo:table-cell>
                    </fo:table-row>
                    <fo:table-row height="1.5mm">
                      <fo:table-cell>
                        <fo:block />
                      </fo:table-cell>
                    </fo:table-row>
                    <fo:table-row font-size="8.5">
                      <fo:table-cell text-align="left" margin-left="5mm" display-align="center">
                        <fo:block>Налоговая база</fo:block>
                      </fo:table-cell>
                      <fo:table-cell text-align="center" display-align="center">
                        <fo:block>040</fo:block>
                      </fo:table-cell>
                      <fo:table-cell display-align="center" font-family="Cour" font-size="14pt">
                        <fo:block>
                          <x:call-template name="box">
                            <x:with-param name="value" select="@НалБазаПод" />
                          </x:call-template>
                        </fo:block>
                      </fo:table-cell>
                    </fo:table-row>
                    <fo:table-row height="1.5mm">
                      <fo:table-cell>
                        <fo:block />
                      </fo:table-cell>
                    </fo:table-row>
                    <fo:table-row font-size="8.5">
                      <fo:table-cell text-align="left" margin-left="5mm" display-align="center">
                        <fo:block>Налоговые вычеты</fo:block>
                      </fo:table-cell>
                      <fo:table-cell text-align="center" display-align="center">
                        <fo:block>050</fo:block>
                      </fo:table-cell>
                      <fo:table-cell display-align="center" font-family="Cour" font-size="14pt">
                        <fo:block>
                          <x:call-template name="box">
                            <x:with-param name="value" select="@НалВычПод" />
                          </x:call-template>
                        </fo:block>
                      </fo:table-cell>
                    </fo:table-row>
                    <fo:table-row height="1.5mm">
                      <fo:table-cell>
                        <fo:block />
                      </fo:table-cell>
                    </fo:table-row>
                    <fo:table-row font-size="8.5">
                      <fo:table-cell text-align="left" display-align="center" number-columns-spanned="3">
                        <fo:block>По операциям, обоснованность применения налоговой ставки 0 процентов по</fo:block>
                        <fo:block>которым документально не подтверждена в предыдущих налоговых периодах:</fo:block>
                      </fo:table-cell>
                    </fo:table-row>
                    <fo:table-row height="1.5mm">
                      <fo:table-cell>
                        <fo:block />
                      </fo:table-cell>
                    </fo:table-row>
                    <fo:table-row font-size="8.5">
                      <fo:table-cell text-align="left" margin-left="5mm" display-align="center">
                        <fo:block>Налоговая база</fo:block>
                      </fo:table-cell>
                      <fo:table-cell text-align="center" display-align="center">
                        <fo:block>060</fo:block>
                      </fo:table-cell>
                      <fo:table-cell display-align="center" font-family="Cour" font-size="14pt">
                        <fo:block>
                          <x:call-template name="box">
                            <x:with-param name="value" select="@НалБазаНеПод" />
                          </x:call-template>
                        </fo:block>
                      </fo:table-cell>
                    </fo:table-row>
                    <fo:table-row height="1.5mm">
                      <fo:table-cell>
                        <fo:block />
                      </fo:table-cell>
                    </fo:table-row>
                    <fo:table-row font-size="8.5">
                      <fo:table-cell text-align="left" margin-left="5mm" display-align="center">
                        <fo:block>Налоговые вычеты</fo:block>
                      </fo:table-cell>
                      <fo:table-cell text-align="center" display-align="center">
                        <fo:block>070</fo:block>
                      </fo:table-cell>
                      <fo:table-cell display-align="center" font-family="Cour" font-size="14pt">
                        <fo:block>
                          <x:call-template name="box">
                            <x:with-param name="value" select="@НалВычНеПод" />
                          </x:call-template>
                        </fo:block>
                      </fo:table-cell>
                    </fo:table-row>
                    <fo:table-row height="1.5mm">
                      <fo:table-cell>
                        <fo:block />
                      </fo:table-cell>
                    </fo:table-row>
                    <x:if test="(position() mod 3)=0">
                      <fo:table-row height="3mm">
                        <fo:table-cell>
                          <fo:block />
                        </fo:table-cell>
                      </fo:table-row>
                      <fo:table-row font-size="8.5">
                        <fo:table-cell text-align="left" display-align="center">
                          <fo:block>Сумма налога, принимаемая к вычету, по операциям, обоснованность применения</fo:block>
                          <fo:block>налоговой ставки 0 процентов по которым документально подтверждена в</fo:block>
                          <fo:block>
                            предыдущих налоговых периодах, исчисленная к возмещению по разделу 5<fo:inline font-size="65%" vertical-align="text-top"> 2</fo:inline></fo:block>
                        </fo:table-cell>
                        <fo:table-cell text-align="center" display-align="center">
                          <fo:block>080</fo:block>
                        </fo:table-cell>
                        <fo:table-cell display-align="center" font-family="Cour" font-size="14pt">
                          <fo:block>
                            <x:call-template name="box">
                              <!--x:with-param name="value">
						    <x:if test="position() =3">
                              <x:value-of select="../../@СумВозмПдтв"/>
                            </x:if>
						  </x:with-param-->
                            </x:call-template>
                          </fo:block>
                        </fo:table-cell>
                        <!--fo:table-cell text-align="center" display-align="center">
                      <fo:block>
                        <x:call-template name="table">
                          <x:with-param name="column-count" select="'12'"/>
                          <x:with-param name="ch" select="'-'"/>
                          <x:with-param name="value">
                            <x:if test="position() =3">
                              <x:value-of select="../../@СумВозмПдтв"/>
                            </x:if>
                          </x:with-param>
                        </x:call-template>
                      </fo:block>
                    </fo:table-cell-->
                      </fo:table-row>
                      <fo:table-row height="3mm">
                        <fo:table-cell>
                          <fo:block />
                        </fo:table-cell>
                      </fo:table-row>
                      <fo:table-row font-size="8.5">
                        <fo:table-cell text-align="left" display-align="center">
                          <fo:block>Сумма налога, принимаемая к вычету, по операциям, обоснованность применения</fo:block>
                          <fo:block>налоговой ставки 0 процентов по которым документально не подтверждена в</fo:block>
                          <fo:block>
                            предыдущих налоговых периодах, исчисленная к возмещению по разделу 5<fo:inline font-size="65%" vertical-align="text-top"> 2</fo:inline></fo:block>
                        </fo:table-cell>
                        <fo:table-cell text-align="center" display-align="center">
                          <fo:block>090</fo:block>
                        </fo:table-cell>
                        <fo:table-cell display-align="center" font-family="Cour" font-size="14pt">
                          <fo:block>
                            <x:call-template name="box">
                              <!--x:with-param name="value">
						    <x:if test="position() =3">
                              <x:value-of select="../../@СумВозмНеПдтв"/>
                            </x:if>
						  </x:with-param-->
                            </x:call-template>
                          </fo:block>
                        </fo:table-cell>
                        <!--fo:table-cell text-align="center" display-align="center">
                      <fo:block>
                        <x:call-template name="table">
                          <x:with-param name="column-count" select="'12'"/>
                          <x:with-param name="ch" select="'-'"/>
                          <x:with-param name="value">
                            <x:if test="position() =3">
                              <x:value-of select="../../@СумВозмНеПдтв"/>
                            </x:if>
                          </x:with-param>
                        </x:call-template>
                      </fo:block>
                    </fo:table-cell-->
                      </fo:table-row>
                    </x:if>
                  </x:for-each>
                  <x:call-template name="СумОпер5Пусто">
                    <x:with-param name="i" select="count(СумОпер5)" />
                    <x:with-param name="countAllRows" select="(3 * ceiling(count(СумОпер5) div 3))" />
                  </x:call-template>
                  <x:if test="count(СумОпер5) = 0">
                    <x:call-template name="СумОпер5Пусто">
                      <x:with-param name="i" select="0" />
                      <x:with-param name="countAllRows" select="3" />
                    </x:call-template>
                  </x:if>
                  <!-- <x:if test="(count(СумОпер5) mod 3)!=0"> -->
                  <fo:table-row height="3mm">
                    <fo:table-cell>
                      <fo:block />
                    </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row font-size="8.5">
                    <fo:table-cell text-align="left" display-align="center">
                      <fo:block>Сумма налога, принимаемая к вычету, по операциям, обоснованность применения</fo:block>
                      <fo:block>налоговой ставки 0 процентов по которым документально подтверждена в</fo:block>
                      <fo:block>
                          предыдущих налоговых периодах, исчисленная к возмещению по разделу 5<fo:inline font-size="65%" vertical-align="text-top"> 2</fo:inline></fo:block>
                    </fo:table-cell>
                    <fo:table-cell text-align="center" display-align="center">
                      <fo:block>080</fo:block>
                    </fo:table-cell>
                    <fo:table-cell display-align="center" font-family="Cour" font-size="14pt">
                      <fo:block>
                        <x:call-template name="box">
                          <!--x:with-param name="value">
						  <x:if test="count(СумОпер7)&lt;3 or count(СумОпер7)&gt;3">
                            <x:value-of select="../@СумВозмПдтв"/>
                          </x:if>
						</x:with-param-->
                        </x:call-template>
                      </fo:block>
                    </fo:table-cell>
                    <!--fo:table-cell text-align="center" display-align="center">
                    <fo:block>
                      <x:call-template name="table">
                        <x:with-param name="column-count" select="'12'"/>
                        <x:with-param name="ch" select="'-'"/>
                        <x:with-param name="value">
                          <x:if test="count(СумОпер7)&lt;3 or count(СумОпер7)&gt;3">
                            <x:value-of select="../@СумВозмПдтв"/>
                          </x:if>
                        </x:with-param>
                      </x:call-template>
                    </fo:block>
                  </fo:table-cell-->
                  </fo:table-row>
                  <fo:table-row height="3mm">
                    <fo:table-cell>
                      <fo:block />
                    </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row font-size="8.5">
                    <fo:table-cell text-align="left" display-align="center">
                      <fo:block>Сумма налога, принимаемая к вычету, по операциям, обоснованность применения</fo:block>
                      <fo:block>налоговой ставки 0 процентов по которым документально не подтверждена в</fo:block>
                      <fo:block>
                          предыдущих налоговых периодах, исчисленная к возмещению по разделу 5<fo:inline font-size="65%" vertical-align="text-top"> 2</fo:inline></fo:block>
                    </fo:table-cell>
                    <fo:table-cell text-align="center" display-align="center">
                      <fo:block>090</fo:block>
                    </fo:table-cell>
                    <fo:table-cell display-align="center" font-family="Cour" font-size="14pt">
                      <fo:block>
                        <x:call-template name="box">
                          <!--x:with-param name="value">
						  <x:if test="count(СумОпер7)&lt;3 or count(СумОпер7)&gt;3">
                            <x:value-of select="../@СумВозмНеПдтв"/>
                          </x:if>
						</x:with-param-->
                        </x:call-template>
                      </fo:block>
                    </fo:table-cell>
                    <!--fo:table-cell text-align="center" display-align="center">
                    <fo:block>
                      <x:call-template name="table">
                        <x:with-param name="column-count" select="'12'"/>
                        <x:with-param name="ch" select="'-'"/>
                        <x:with-param name="value">
                          <x:if test="count(СумОпер7)&lt;3 or count(СумОпер7)&gt;3">
                            <x:value-of select="../@СумВозмНеПдтв"/>
                          </x:if>
                        </x:with-param>
                      </x:call-template>
                    </fo:block>
                  </fo:table-cell-->
                  </fo:table-row>
                  <!-- </x:if> -->
                </fo:table-body>
              </fo:table>
            </x:otherwise>
          </x:choose>
        </x:for-each>
      </fo:flow>
      <fo:static-content flow-name="xsl-region-after" font-size="9pt" font-family="Arial">
        <fo:block-container top="-15mm" position="absolute">
          <x:call-template name="подпись-эцп-мини" />
        </fo:block-container>
      </fo:static-content>
    </fo:page-sequence>
  </x:template>
  <!--Раздел 6-->
  <x:template match="НалНеПодтв0">
    <x:param name="СвНП" />
    <fo:page-sequence master-reference="Portrait" format="001">
      <fo:static-content flow-name="xsl-region-before" font-size="11pt" font-family="Arial">
        <x:call-template name="Рамка_Portrait" />
        <x:choose>
          <x:when test="$СвНП/НПЮЛ">
            <x:call-template name="ИНН_КПП_Portrait">
              <x:with-param name="ИНН" select="$СвНП/НПЮЛ/@ИННЮЛ" />
              <x:with-param name="КПП" select="$СвНП/НПЮЛ/@КПП" />
            </x:call-template>
          </x:when>
          <x:when test="$СвНП/НПФЛ">
            <x:call-template name="ИНН_КПП_Portrait">
              <x:with-param name="ИНН" select="$СвНП/НПФЛ/@ИННФЛ" />
            </x:call-template>
          </x:when>
        </x:choose>
        <x:call-template name="ШтрихКод_Portrait">
          <x:with-param name="код" select="'-0031-abaj-'" />
        </x:call-template>
        <fo:block space-after="283mm" />
        <fo:block font-size="8pt" text-align="left" display-align="center" margin-left="10mm">
          <fo:inline font-size="65%" vertical-align="text-top">1 </fo:inline>Заполняется необходимое количество листов данного раздела
        </fo:block>
        <fo:block space-after="1mm" />
        <fo:block font-size="8pt" text-align="left" display-align="center" margin-left="10mm">
          <fo:inline font-size="65%" vertical-align="text-top">2 </fo:inline>Указывается на первой странице, на остальных - ставится прочерк.
        </fo:block>
      </fo:static-content>
      <fo:flow flow-name="xsl-region-body" font-size="9pt" font-family="Arial">
        <fo:block text-align="center" display-align="center" font-size="9.5pt" font-weight="bold">Раздел 6. Расчет суммы налога по операциям по реализации товаров (работ, услуг), обоснованность</fo:block>
        <fo:block text-align="center" display-align="center" font-size="9.5pt" font-weight="bold">
          применения налоговой ставки 0 процентов по которым документально не подтверждена<fo:inline font-size="65%" vertical-align="text-top"> 1</fo:inline></fo:block>
        <fo:block space-after="3mm" />
        <fo:table table-layout="fixed" width="100%">
          <fo:table-column column-width="118mm" />
          <fo:table-column column-width="20mm" />
          <fo:table-column column-width="50mm" />
          <fo:table-body>
            <fo:table-row font-size="8.5">
              <fo:table-cell text-align="center" display-align="center">
                <fo:block>Показатели</fo:block>
              </fo:table-cell>
              <fo:table-cell text-align="center" display-align="center">
                <fo:block>Код строки</fo:block>
              </fo:table-cell>
              <fo:table-cell text-align="center" display-align="center">
                <fo:block>Значения показателей</fo:block>
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row font-size="8.5" height="6mm">
              <fo:table-cell text-align="center" display-align="center">
                <fo:block>1</fo:block>
              </fo:table-cell>
              <fo:table-cell text-align="center" display-align="center">
                <fo:block>2</fo:block>
              </fo:table-cell>
              <fo:table-cell text-align="center" display-align="center">
                <fo:block>3</fo:block>
              </fo:table-cell>
            </fo:table-row>
          </fo:table-body>
        </fo:table>
        <x:for-each select="СумОпер6">
          <x:variable name="i" select="1" />
          <fo:table table-layout="fixed" width="100%">
            <fo:table-column column-width="118mm" />
            <fo:table-column column-width="20mm" />
            <fo:table-column column-width="50mm" />
            <fo:table-body>
              <fo:table-row font-size="8.5">
                <fo:table-cell text-align="left" display-align="center">
                  <fo:block>Код операции</fo:block>
                </fo:table-cell>
                <fo:table-cell text-align="center" display-align="center">
                  <fo:block>010</fo:block>
                </fo:table-cell>
                <fo:table-cell display-align="center" font-family="Cour" font-size="14pt">
                  <fo:block>
                    <x:call-template name="box">
                      <x:with-param name="value" select="@КодОпер" />
                    </x:call-template>
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row height="1.5mm">
                <fo:table-cell>
                  <fo:block />
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row font-size="8.5">
                <fo:table-cell text-align="left" display-align="center">
                  <fo:block>Налоговая база</fo:block>
                </fo:table-cell>
                <fo:table-cell text-align="center" display-align="center">
                  <fo:block>020</fo:block>
                </fo:table-cell>
                <fo:table-cell display-align="center" font-family="Cour" font-size="14pt">
                  <fo:block>
                    <x:call-template name="box">
                      <x:with-param name="value" select="@НалБаза" />
                    </x:call-template>
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row height="1.5mm">
                <fo:table-cell>
                  <fo:block />
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row font-size="8.5">
                <fo:table-cell text-align="left" display-align="center">
                  <fo:block>Суммы налога, исчисленные по налоговым ставкам, предусмотренным пунктами</fo:block>
                  <fo:block>2, 3 статьи 164 Налогового кодекса Российской Федерации</fo:block>
                </fo:table-cell>
                <fo:table-cell text-align="center" display-align="center">
                  <fo:block>030</fo:block>
                </fo:table-cell>
                <fo:table-cell display-align="center" font-family="Cour" font-size="14pt">
                  <fo:block>
                    <x:call-template name="box">
                      <x:with-param name="value" select="@СумНал164" />
                    </x:call-template>
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row height="1.5mm">
                <fo:table-cell>
                  <fo:block />
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row font-size="8.5">
                <fo:table-cell text-align="left" display-align="center">
                  <fo:block>Сумма налоговых вычетов по операциям по реализации товаров (работ, услуг),</fo:block>
                  <fo:block>обоснованность применения налоговой ставки 0 процентов по которым</fo:block>
                  <fo:block>документально не подтверждена</fo:block>
                </fo:table-cell>
                <fo:table-cell text-align="center" display-align="center">
                  <fo:block>040</fo:block>
                </fo:table-cell>
                <fo:table-cell display-align="center" font-family="Cour" font-size="14pt">
                  <fo:block>
                    <x:call-template name="box">
                      <x:with-param name="value" select="@НалВычНеПод" />
                    </x:call-template>
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row height="3mm">
                <fo:table-cell>
                  <fo:block />
                </fo:table-cell>
              </fo:table-row>
            </fo:table-body>
          </fo:table>
        </x:for-each>
        <x:call-template name="СумОпер6Пусто">
          <x:with-param name="i" select="count(СумОпер6)" />
          <x:with-param name="countAllRows" select="(2 * ceiling(count(СумОпер6) div 2))" />
        </x:call-template>
        <x:if test="count(СумОпер6) = 0">
          <x:call-template name="СумОпер6Пусто">
            <x:with-param name="i" select="0" />
            <x:with-param name="countAllRows" select="2" />
          </x:call-template>
        </x:if>
        <fo:table table-layout="fixed" width="100%">
          <fo:table-column column-width="118mm" />
          <fo:table-column column-width="20mm" />
          <fo:table-column column-width="50mm" />
          <fo:table-body>
            <fo:table-row font-size="8.5">
              <fo:table-cell text-align="left" display-align="center">
                <fo:block>Итого суммы налога, исчисленные по налоговым ставкам, предусмотренным</fo:block>
                <fo:block>
                  пунктами 2, 3 статьи 164 Налогового кодекса Российской Федерации<fo:inline font-size="65%" vertical-align="text-top"> 2</fo:inline></fo:block>
              </fo:table-cell>
              <fo:table-cell text-align="center" display-align="center">
                <fo:block>050</fo:block>
              </fo:table-cell>
              <fo:table-cell display-align="center" font-family="Cour" font-size="14pt">
                <fo:block>
                  <x:call-template name="box">
                    <x:with-param name="value" select="@СумНал164Ит" />
                  </x:call-template>
                </fo:block>
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row height="1.5mm">
              <fo:table-cell>
                <fo:block />
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row font-size="8.5">
              <fo:table-cell text-align="left" display-align="center">
                <fo:block>Итого сумма налоговых вычетов по операциям по реализации товаров (работ,</fo:block>
                <fo:block>услуг), обоснованность применения налоговой ставки 0 процентов по которым</fo:block>
                <fo:block>
                  документально не подтверждена<fo:inline font-size="65%" vertical-align="text-top"> 2</fo:inline></fo:block>
              </fo:table-cell>
              <fo:table-cell text-align="center" display-align="center">
                <fo:block>060</fo:block>
              </fo:table-cell>
              <fo:table-cell display-align="center" font-family="Cour" font-size="14pt">
                <fo:block>
                  <x:call-template name="box">
                    <x:with-param name="value" select="@НалВычНеПодИт" />
                  </x:call-template>
                </fo:block>
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row height="3mm">
              <fo:table-cell>
                <fo:block />
              </fo:table-cell>
            </fo:table-row>
            <x:for-each select="КорНалВозврТов">
              <fo:table-row font-size="8.5">
                <fo:table-cell text-align="left" display-align="center">
                  <fo:block>Код операции</fo:block>
                </fo:table-cell>
                <fo:table-cell text-align="center" display-align="center">
                  <fo:block>070</fo:block>
                </fo:table-cell>
                <fo:table-cell display-align="center" font-family="Cour" font-size="14pt">
                  <fo:block>
                    <x:call-template name="box">
                      <x:with-param name="value" select="@КодОпер" />
                    </x:call-template>
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row height="1.5mm">
                <fo:table-cell>
                  <fo:block />
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row font-size="8.5">
                <fo:table-cell text-align="left" display-align="center">
                  <fo:block>
                    Налоговая база<fo:inline font-size="65%" vertical-align="text-top"> 2</fo:inline></fo:block>
                </fo:table-cell>
                <fo:table-cell text-align="center" display-align="center">
                  <fo:block>080</fo:block>
                </fo:table-cell>
                <fo:table-cell display-align="center" font-family="Cour" font-size="14pt">
                  <fo:block>
                    <x:call-template name="box">
                      <x:with-param name="value" select="@НалБаза" />
                    </x:call-template>
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row height="1.5mm">
                <fo:table-cell>
                  <fo:block />
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row font-size="8.5">
                <fo:table-cell text-align="left" display-align="center">
                  <fo:block>Корректировка сумм налога, ранее исчисленных по налоговым ставкам,</fo:block>
                  <fo:block>предусмотренным пунктами 2, 3 статьи 164 Налогового кодекса Российской</fo:block>
                  <fo:block>
                    Федерации<fo:inline font-size="65%" vertical-align="text-top"> 2</fo:inline></fo:block>
                </fo:table-cell>
                <fo:table-cell text-align="center" display-align="center">
                  <fo:block>090</fo:block>
                </fo:table-cell>
                <fo:table-cell display-align="center" font-family="Cour" font-size="14pt">
                  <fo:block>
                    <x:call-template name="box">
                      <x:with-param name="value" select="@КорИсч.164.23" />
                    </x:call-template>
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row height="1.5mm">
                <fo:table-cell>
                  <fo:block />
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row font-size="8.5">
                <fo:table-cell text-align="left" display-align="center">
                  <fo:block>
                    Сумма налога, ранее принятая к вычету и подлежащая восстановлению<fo:inline font-size="65%" vertical-align="text-top"> 2</fo:inline></fo:block>
                </fo:table-cell>
                <fo:table-cell text-align="center" display-align="center">
                  <fo:block>100</fo:block>
                </fo:table-cell>
                <fo:table-cell display-align="center" font-family="Cour" font-size="14pt">
                  <fo:block>
                    <x:call-template name="box">
                      <x:with-param name="value" select="@НалВосст" />
                    </x:call-template>
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row height="3mm">
                <fo:table-cell>
                  <fo:block />
                </fo:table-cell>
              </fo:table-row>
            </x:for-each>
            <x:if test="count(КорНалВозврТов) = 0">
              <x:call-template name="КорНалВозврТовПусто" />
            </x:if>
            <x:for-each select="КорНалИзмЦен">
              <fo:table-row font-size="8.5">
                <fo:table-cell text-align="left" display-align="center">
                  <fo:block>Код операции</fo:block>
                </fo:table-cell>
                <fo:table-cell text-align="center" display-align="center">
                  <fo:block>110</fo:block>
                </fo:table-cell>
                <fo:table-cell display-align="center" font-family="Cour" font-size="14pt">
                  <fo:block>
                    <x:call-template name="box">
                      <x:with-param name="value" select="@КодОпер" />
                    </x:call-template>
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row height="1.5mm">
                <fo:table-cell>
                  <fo:block />
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row font-size="8.5">
                <fo:table-cell text-align="left" display-align="center">
                  <fo:block>Сумма, на которую корректируется налоговая база при увеличении цены</fo:block>
                  <fo:block>
                    реализованных товаров (работ, услуг)<fo:inline font-size="65%" vertical-align="text-top"> 2</fo:inline></fo:block>
                </fo:table-cell>
                <fo:table-cell text-align="center" display-align="center">
                  <fo:block>120</fo:block>
                </fo:table-cell>
                <fo:table-cell display-align="center" font-family="Cour" font-size="14pt">
                  <fo:block>
                    <x:call-template name="box">
                      <x:with-param name="value" select="@КорНалБазаУв" />
                    </x:call-template>
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row height="1.5mm">
                <fo:table-cell>
                  <fo:block />
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row font-size="8.5">
                <fo:table-cell text-align="left" display-align="center">
                  <fo:block>Корректировка сумм налога, ранее исчисленных по налоговым ставкам,</fo:block>
                  <fo:block>предусмотренным пунктами 2, 3 статьи 164 Налогового кодекса Российской</fo:block>
                  <fo:block>
                    Федерации<fo:inline font-size="65%" vertical-align="text-top"> 2</fo:inline></fo:block>
                </fo:table-cell>
                <fo:table-cell text-align="center" display-align="center">
                  <fo:block>130</fo:block>
                </fo:table-cell>
                <fo:table-cell display-align="center" font-family="Cour" font-size="14pt">
                  <fo:block>
                    <x:call-template name="box">
                      <x:with-param name="value" select="@КорИсч.164.23Ув" />
                    </x:call-template>
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row height="1.5mm">
                <fo:table-cell>
                  <fo:block />
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row font-size="8.5">
                <fo:table-cell text-align="left" display-align="center">
                  <fo:block>Сумма, на которую корректируется налоговая база при уменьшении цены</fo:block>
                  <fo:block>
                    реализованных товаров (работ, услуг)<fo:inline font-size="65%" vertical-align="text-top"> 2</fo:inline></fo:block>
                </fo:table-cell>
                <fo:table-cell text-align="center" display-align="center">
                  <fo:block>140</fo:block>
                </fo:table-cell>
                <fo:table-cell display-align="center" font-family="Cour" font-size="14pt">
                  <fo:block>
                    <x:call-template name="box">
                      <x:with-param name="value" select="@КорНалБазаУм" />
                    </x:call-template>
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row height="1.5mm">
                <fo:table-cell>
                  <fo:block />
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row font-size="8.5">
                <fo:table-cell text-align="left" display-align="center">
                  <fo:block>Корректировка сумм налога, ранее исчисленных по налоговым ставкам,</fo:block>
                  <fo:block>предусмотренным пунктами 2, 3 статьи 164 Налогового кодекса Российской</fo:block>
                  <fo:block>
                    Федерации<fo:inline font-size="65%" vertical-align="text-top"> 2</fo:inline></fo:block>
                </fo:table-cell>
                <fo:table-cell text-align="center" display-align="center">
                  <fo:block>150</fo:block>
                </fo:table-cell>
                <fo:table-cell display-align="center" font-family="Cour" font-size="14pt">
                  <fo:block>
                    <x:call-template name="box">
                      <x:with-param name="value" select="@КорИсч.164.23Ум" />
                    </x:call-template>
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row height="1.5mm">
                <fo:table-cell>
                  <fo:block />
                </fo:table-cell>
              </fo:table-row>
            </x:for-each>
            <x:if test="count(КорНалИзмЦен) = 0">
              <x:call-template name="КорНалИзмЦенПусто" />
            </x:if>
            <fo:table-row font-size="8.5">
              <fo:table-cell text-align="left" display-align="center">
                <fo:block>
                  Итого сумма налога, исчисленная к уплате в бюджет по разделу 6<fo:inline font-size="65%" vertical-align="text-top"> 2</fo:inline></fo:block>
              </fo:table-cell>
              <fo:table-cell text-align="center" display-align="center">
                <fo:block>160</fo:block>
              </fo:table-cell>
              <fo:table-cell display-align="before" font-family="Cour" font-size="14pt">
                <fo:block>
                  <x:call-template name="xabs_box">
                    <x:with-param name="n" select="@НалИсчислИт" />
                  </x:call-template>
                </fo:block>
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row height="3mm">
              <fo:table-cell>
                <fo:block />
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row font-size="8.5">
              <fo:table-cell text-align="left" display-align="center">
                <fo:block>
                  Итого сумма налога, исчисленная к возмещению по разделу 6<fo:inline font-size="65%" vertical-align="text-top"> 2</fo:inline></fo:block>
              </fo:table-cell>
              <fo:table-cell text-align="center" display-align="center">
                <fo:block>170</fo:block>
              </fo:table-cell>
              <fo:table-cell display-align="before" font-family="Cour" font-size="14pt">
                <x:choose>
                  <x:when test="@НалИсчислИт = 0">
                    <x:call-template name="box">
                      <x:with-param name="value" select="'-'" />
                    </x:call-template>
                  </x:when>
                  <x:otherwise>
                    <x:call-template name="xabs_box">
                      <x:with-param name="n" select="-1*@НалИсчислИт" />
                    </x:call-template>
                  </x:otherwise>
                </x:choose>
              </fo:table-cell>
            </fo:table-row>
          </fo:table-body>
        </fo:table>
      </fo:flow>
      <fo:static-content flow-name="xsl-region-after" font-size="9pt" font-family="Arial">
        <fo:block-container top="-15mm" position="absolute">
          <x:call-template name="подпись-эцп-мини" />
        </fo:block-container>
      </fo:static-content>
    </fo:page-sequence>
  </x:template>
  <!--Раздел 7-->
  <x:template match="ОперНеНал">
    <x:param name="СвНП" />
    <fo:page-sequence master-reference="Portrait7" format="001">
      <fo:static-content flow-name="xsl-region-before" font-size="11pt" font-family="Arial">
        <x:call-template name="Рамка_Portrait" />
        <x:choose>
          <x:when test="$СвНП/НПЮЛ">
            <x:call-template name="ИНН_КПП_Portrait">
              <x:with-param name="ИНН" select="$СвНП/НПЮЛ/@ИННЮЛ" />
              <x:with-param name="КПП" select="$СвНП/НПЮЛ/@КПП" />
            </x:call-template>
          </x:when>
          <x:when test="$СвНП/НПФЛ">
            <x:call-template name="ИНН_КПП_Portrait">
              <x:with-param name="ИНН" select="$СвНП/НПФЛ/@ИННФЛ" />
            </x:call-template>
          </x:when>
        </x:choose>
        <x:call-template name="ШтрихКод_Portrait">
          <x:with-param name="код" select="'-0031-abbg-'" />
        </x:call-template>
        <fo:block space-after="20mm" />
        <fo:block text-align="center" display-align="center" font-size="9.5pt" font-weight="bold">Раздел 7. Операции, не подлежащие налогообложению (освобождаемые от налогообложения); операции, не</fo:block>
        <fo:block text-align="center" display-align="center" font-size="9.5pt" font-weight="bold">признаваемые объектом налогообложения; операции по реализации товаров (работ, услуг), местом реализации</fo:block>
        <fo:block text-align="center" display-align="center" font-size="9.5pt" font-weight="bold">которых не признается территория Российской Федерации; а также суммы оплаты, частичной оплаты в счет</fo:block>
        <fo:block text-align="center" display-align="center" font-size="9.5pt" font-weight="bold">предстоящих поставок товаров (выполнения работ, оказания услуг), длительность производственного цикла</fo:block>
        <fo:block text-align="center" display-align="center" font-size="9.5pt" font-weight="bold">изготовления которых составляет свыше шести месяцев</fo:block>
        <fo:block space-after="3mm" />
        <fo:table table-layout="fixed" width="100%" font-size="10pt">
          <fo:table-column column-width="38mm" />
          <fo:table-column column-width="2mm" />
          <fo:table-column column-width="52mm" />
          <fo:table-column column-width="2mm" />
          <fo:table-column column-width="52mm" />
          <fo:table-column column-width="2mm" />
          <fo:table-column column-width="52mm" />
          <fo:table-body>
            <fo:table-row font-size="8.5pt">
              <fo:table-cell text-align="center" display-align="before">
                <fo:block>Код операции</fo:block>
              </fo:table-cell>
              <fo:table-cell text-align="center" display-align="before" number-columns-spanned="2">
                <fo:block>Стоимость реализованных</fo:block>
                <fo:block>(переданных) товаров (работ, услуг),</fo:block>
                <fo:block>без налога в рублях</fo:block>
              </fo:table-cell>
              <fo:table-cell text-align="center" display-align="before" number-columns-spanned="2">
                <fo:block>Стоимость приобретенных товаров</fo:block>
                <fo:block>(работ, услуг), не облагаемых</fo:block>
                <fo:block>налогом, в рублях</fo:block>
              </fo:table-cell>
              <fo:table-cell text-align="center" display-align="before" number-columns-spanned="2">
                <fo:block>Сумма налога по приобретенным</fo:block>
                <fo:block>товарам (работам, услугам), не</fo:block>
                <fo:block>подлежащая вычету, в рублях</fo:block>
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row height="5mm" font-size="8.5pt">
              <fo:table-cell text-align="center" display-align="center">
                <fo:block>1</fo:block>
              </fo:table-cell>
              <fo:table-cell text-align="center" display-align="center" number-columns-spanned="2">
                <fo:block>2</fo:block>
              </fo:table-cell>
              <fo:table-cell text-align="center" display-align="center" number-columns-spanned="2">
                <fo:block>3</fo:block>
              </fo:table-cell>
              <fo:table-cell text-align="center" display-align="center" number-columns-spanned="2">
                <fo:block>4</fo:block>
              </fo:table-cell>
            </fo:table-row>
          </fo:table-body>
        </fo:table>
      </fo:static-content>
      <fo:flow flow-name="xsl-region-body" font-size="9pt" font-family="Arial">
        <fo:table table-layout="fixed" width="100%" font-size="10pt">
          <fo:table-column column-width="38mm" />
          <fo:table-column column-width="2mm" />
          <fo:table-column column-width="52mm" />
          <fo:table-column column-width="2mm" />
          <fo:table-column column-width="52mm" />
          <fo:table-column column-width="2mm" />
          <fo:table-column column-width="52mm" />
          <fo:table-body>
            <x:for-each select="СумОпер7">
              <fo:table-row height="9mm">
                <fo:table-cell display-align="center" font-family="Cour" font-size="14pt">
                  <fo:block>
                    <x:call-template name="box">
                      <x:with-param name="value" select="@КодОпер" />
                    </x:call-template>
                  </fo:block>
                </fo:table-cell>
                <fo:table-cell>
                  <fo:block />
                </fo:table-cell>
                <fo:table-cell display-align="center" font-family="Cour" font-size="14pt">
                  <fo:block>
                    <x:call-template name="box">
                      <x:with-param name="value" select="@СтРеалТов" />
                    </x:call-template>
                  </fo:block>
                </fo:table-cell>
                <fo:table-cell>
                  <fo:block />
                </fo:table-cell>
                <fo:table-cell display-align="center" font-family="Cour" font-size="14pt">
                  <fo:block>
                    <x:call-template name="box">
                      <x:with-param name="value" select="@СтПриобТов" />
                    </x:call-template>
                  </fo:block>
                </fo:table-cell>
                <fo:table-cell>
                  <fo:block />
                </fo:table-cell>
                <fo:table-cell display-align="center" font-family="Cour" font-size="14pt">
                  <fo:block>
                    <x:call-template name="box">
                      <x:with-param name="value" select="@НалНеВыч" />
                    </x:call-template>
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <x:if test="(position() mod 21)=0">
                <fo:table-row height="3mm">
                  <fo:table-cell>
                    <fo:block />
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell text-align="left" display-align="center" number-columns-spanned="6">
                    <fo:block margin-right="5mm" font-size="8pt">Сумма полученной оплаты, частичной оплаты в счет предстоящих поставок товаров (выполнения работ,</fo:block>
                    <fo:block margin-right="5mm" font-size="8pt">оказания услуг), длительность производственного цикла изготовления которых составляет свыше шести</fo:block>
                    <fo:block margin-right="5mm" font-size="8pt">месяцев, по перечню, определенному Правительством Российской Федерации, в рублях (код строки 010)</fo:block>
                  </fo:table-cell>
                  <fo:table-cell display-align="center" font-family="Cour" font-size="14pt">
                    <fo:block>
                      <x:call-template name="box">
                        <x:with-param name="value">
                          <x:if test="position() =21">
                            <x:value-of select="../@ОплПостСв6Мес" />
                          </x:if>
                        </x:with-param>
                      </x:call-template>
                    </fo:block>
                  </fo:table-cell>
                  <!--fo:table-cell display-align="center">
									<fo:block>
										<x:call-template name="table">
											<x:with-param name="column-count" select="'10'"/>
											<x:with-param name="value">
												<x:if test="position() =21">
													<x:value-of select="../@ОплПостСв6Мес"/>
												</x:if>
											</x:with-param>
											<x:with-param name="ch" select="'-'"/>
										</x:call-template>
									</fo:block>
								</fo:table-cell-->
                </fo:table-row>
              </x:if>
            </x:for-each>
            <x:call-template name="СумОпер7Пусто">
              <x:with-param name="i" select="count(СумОпер7)" />
              <x:with-param name="countAllRows" select="(21 * ceiling(count(СумОпер7) div 21))" />
            </x:call-template>
            <x:if test="count(СумОпер7)=0">
              <x:call-template name="СумОпер7Пусто">
                <x:with-param name="i" select="0" />
                <x:with-param name="countAllRows" select="21" />
              </x:call-template>
            </x:if>
            <x:if test="((count(СумОпер7) mod 21)!=0 or count(СумОпер7)=0)">
              <fo:table-row height="3mm">
                <fo:table-cell>
                  <fo:block />
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row>
                <fo:table-cell text-align="left" display-align="center" number-columns-spanned="6">
                  <fo:block margin-right="5mm" font-size="8pt">Сумма полученной оплаты, частичной оплаты в счет предстоящих поставок товаров (выполнения работ,</fo:block>
                  <fo:block margin-right="5mm" font-size="8pt">оказания услуг), длительность производственного цикла изготовления которых составляет свыше шести</fo:block>
                  <fo:block margin-right="5mm" font-size="8pt">месяцев, по перечню, определенному Правительством Российской Федерации, в рублях (код строки 010)</fo:block>
                </fo:table-cell>
                <fo:table-cell display-align="center" font-family="Cour" font-size="14pt">
                  <fo:block>
                    <x:call-template name="box">
                      <x:with-param name="value">
                        <x:if test="count(СумОпер7)&lt;21">
                          <x:value-of select="@ОплПостСв6Мес" />
                        </x:if>
                      </x:with-param>
                    </x:call-template>
                  </fo:block>
                </fo:table-cell>
                <!--fo:table-cell display-align="center">
									<fo:block>
										<x:call-template name="table">
											<x:with-param name="column-count" select="'10'"/>
											<x:with-param name="value">
											  <x:if test="count(СумОпер7)&lt;21">
												<x:value-of select="@ОплПостСв6Мес"/>
											  </x:if>
											</x:with-param>
                                            <x:with-param name="ch">
                                              <x:if test="@ОплПостСв6Мес">
                                                <x:value-of select="'-'"/>
                                              </x:if>
                                            </x:with-param>
										</x:call-template>
									</fo:block>
								</fo:table-cell-->
              </fo:table-row>
            </x:if>
          </fo:table-body>
        </fo:table>
      </fo:flow>
      <fo:static-content flow-name="xsl-region-after" font-size="9pt" font-family="Arial">
        <fo:block-container top="-15mm" position="absolute">
          <x:call-template name="подпись-эцп-мини" />
        </fo:block-container>
      </fo:static-content>
    </fo:page-sequence>
  </x:template>
  <x:template name="СумОпер4Пусто">
    <x:param name="countAllRows" />
    <x:param name="i" />
    <x:choose>
      <x:when test="$i &lt; $countAllRows">
        <fo:table-row font-size="8.5">
          <fo:table-cell text-align="left" display-align="center">
            <fo:block>Код операции</fo:block>
          </fo:table-cell>
          <fo:table-cell text-align="center" display-align="center">
            <fo:block>010</fo:block>
          </fo:table-cell>
          <fo:table-cell display-align="center">
            <fo:block>
              <x:call-template name="box">
                <x:with-param name="value" select="'-'" />
              </x:call-template>
            </fo:block>
          </fo:table-cell>
        </fo:table-row>
        <fo:table-row height="1.5mm">
          <fo:table-cell>
            <fo:block />
          </fo:table-cell>
        </fo:table-row>
        <fo:table-row font-size="8.5">
          <fo:table-cell text-align="left" display-align="center">
            <fo:block>Налоговая база</fo:block>
          </fo:table-cell>
          <fo:table-cell text-align="center" display-align="center">
            <fo:block>020</fo:block>
          </fo:table-cell>
          <fo:table-cell display-align="center">
            <fo:block>
              <x:call-template name="box">
                <x:with-param name="value" select="'-'" />
              </x:call-template>
            </fo:block>
          </fo:table-cell>
        </fo:table-row>
        <fo:table-row height="1.5mm">
          <fo:table-cell>
            <fo:block />
          </fo:table-cell>
        </fo:table-row>
        <fo:table-row font-size="8.5">
          <fo:table-cell text-align="left" display-align="center">
            <fo:block>Налоговые вычеты по операциям, обоснованность применения налоговой ставки</fo:block>
            <fo:block>0 процентов по которым документально подтверждена</fo:block>
          </fo:table-cell>
          <fo:table-cell text-align="center" display-align="center">
            <fo:block>030</fo:block>
          </fo:table-cell>
          <fo:table-cell display-align="center">
            <fo:block>
              <x:call-template name="box">
                <x:with-param name="value" select="'-'" />
              </x:call-template>
            </fo:block>
          </fo:table-cell>
        </fo:table-row>
        <fo:table-row height="1.5mm">
          <fo:table-cell>
            <fo:block />
          </fo:table-cell>
        </fo:table-row>
        <fo:table-row font-size="8.5">
          <fo:table-cell text-align="left" display-align="center">
            <fo:block>Сумма налога, ранее исчисленная по операциям, обоснованность применения</fo:block>
            <fo:block>налоговой ставки 0 процентов по которым ранее не была документально</fo:block>
            <fo:block>подтверждена</fo:block>
          </fo:table-cell>
          <fo:table-cell text-align="center" display-align="center">
            <fo:block>040</fo:block>
          </fo:table-cell>
          <fo:table-cell display-align="center">
            <fo:block>
              <x:call-template name="box">
                <x:with-param name="value" select="'-'" />
              </x:call-template>
            </fo:block>
          </fo:table-cell>
        </fo:table-row>
        <fo:table-row height="1.5mm">
          <fo:table-cell>
            <fo:block />
          </fo:table-cell>
        </fo:table-row>
        <fo:table-row font-size="8.5">
          <fo:table-cell text-align="left" display-align="center">
            <fo:block>Сумма налога, ранее принятая к вычету и подлежащая восстановлению</fo:block>
          </fo:table-cell>
          <fo:table-cell text-align="center" display-align="center">
            <fo:block>050</fo:block>
          </fo:table-cell>
          <fo:table-cell display-align="center">
            <fo:block>
              <x:call-template name="box">
                <x:with-param name="value" select="'-'" />
              </x:call-template>
            </fo:block>
          </fo:table-cell>
        </fo:table-row>
        <fo:table-row height="1.5mm">
          <fo:table-cell>
            <fo:block />
          </fo:table-cell>
        </fo:table-row>
        <x:call-template name="СумОпер4Пусто">
          <x:with-param name="i" select="$i + 1" />
          <x:with-param name="countAllRows" select="$countAllRows" />
        </x:call-template>
      </x:when>
    </x:choose>
  </x:template>
  <x:template name="КорНБВозврТовПусто">
    <fo:table-row font-size="8.5">
      <fo:table-cell text-align="left" display-align="center">
        <fo:block>Код операции</fo:block>
      </fo:table-cell>
      <fo:table-cell text-align="center" display-align="center">
        <fo:block>060</fo:block>
      </fo:table-cell>
      <fo:table-cell display-align="center" font-family="Cour" font-size="14pt">
        <fo:block>
          <x:call-template name="box">
            <x:with-param name="value">
              <x:value-of select="''" />
            </x:with-param>
          </x:call-template>
        </fo:block>
      </fo:table-cell>
    </fo:table-row>
    <fo:table-row height="1mm">
      <fo:table-cell>
        <fo:block />
      </fo:table-cell>
    </fo:table-row>
    <fo:table-row font-size="8">
      <fo:table-cell text-align="left" display-align="center">
        <fo:block>
          Налоговая база<fo:inline font-size="65%" vertical-align="text-top"> 2</fo:inline></fo:block>
      </fo:table-cell>
      <fo:table-cell text-align="center" display-align="center">
        <fo:block>070</fo:block>
      </fo:table-cell>
      <fo:table-cell display-align="center" font-family="Cour" font-size="14pt">
        <fo:block>
          <x:call-template name="box">
            <x:with-param name="value">
              <x:value-of select="''" />
            </x:with-param>
          </x:call-template>
        </fo:block>
      </fo:table-cell>
    </fo:table-row>
    <fo:table-row height="1.5mm">
      <fo:table-cell>
        <fo:block />
      </fo:table-cell>
    </fo:table-row>
    <fo:table-row font-size="8.5">
      <fo:table-cell text-align="left" display-align="center">
        <fo:block>
          Сумма налога, ранее принятая к вычету и подлежащая восстановлению<fo:inline font-size="65%" vertical-align="text-top"> 2</fo:inline></fo:block>
      </fo:table-cell>
      <fo:table-cell text-align="center" display-align="center">
        <fo:block>080</fo:block>
      </fo:table-cell>
      <fo:table-cell display-align="center" font-family="Cour" font-size="14pt">
        <fo:block>
          <x:call-template name="box">
            <x:with-param name="value">
              <x:value-of select="''" />
            </x:with-param>
          </x:call-template>
        </fo:block>
      </fo:table-cell>
    </fo:table-row>
    <fo:table-row height="1.5mm">
      <fo:table-cell>
        <fo:block />
      </fo:table-cell>
    </fo:table-row>
  </x:template>
  <x:template name="КорНБИзмЦенПусто">
    <fo:table-row font-size="8.5">
      <fo:table-cell text-align="left" display-align="center">
        <fo:block>Код операции</fo:block>
      </fo:table-cell>
      <fo:table-cell text-align="center" display-align="center">
        <fo:block>090</fo:block>
      </fo:table-cell>
      <fo:table-cell display-align="center" font-family="Cour" font-size="14pt">
        <fo:block>
          <x:call-template name="box">
            <x:with-param name="value">
              <x:value-of select="''" />
            </x:with-param>
          </x:call-template>
        </fo:block>
      </fo:table-cell>
    </fo:table-row>
    <fo:table-row height="1mm">
      <fo:table-cell>
        <fo:block />
      </fo:table-cell>
    </fo:table-row>
    <fo:table-row font-size="8.5">
      <fo:table-cell text-align="left" display-align="center">
        <fo:block>Сумма, на которую корректируется налоговая база при увеличении цены</fo:block>
        <fo:block>
                      реализованных товаров (работ, услуг)<fo:inline font-size="65%" vertical-align="text-top"> 2</fo:inline></fo:block>
      </fo:table-cell>
      <fo:table-cell text-align="center" display-align="center">
        <fo:block>100</fo:block>
      </fo:table-cell>
      <fo:table-cell display-align="center" font-family="Cour" font-size="14pt">
        <fo:block>
          <x:call-template name="box">
            <x:with-param name="value">
              <x:value-of select="''" />
            </x:with-param>
          </x:call-template>
        </fo:block>
      </fo:table-cell>
    </fo:table-row>
    <fo:table-row height="1mm">
      <fo:table-cell>
        <fo:block />
      </fo:table-cell>
    </fo:table-row>
    <fo:table-row height="1mm">
      <fo:table-cell>
        <fo:block />
      </fo:table-cell>
    </fo:table-row>
    <fo:table-row font-size="8.5">
      <fo:table-cell text-align="left" display-align="center">
        <fo:block>Сумма, на которую корректируется налоговая база при уменьшении цены</fo:block>
        <fo:block>
                    реализованных товаров (работ, услуг)<fo:inline font-size="65%" vertical-align="text-top"> 2</fo:inline></fo:block>
      </fo:table-cell>
      <fo:table-cell text-align="center" display-align="center">
        <fo:block>110</fo:block>
      </fo:table-cell>
      <fo:table-cell display-align="center" font-family="Cour" font-size="14pt">
        <fo:block>
          <x:call-template name="box">
            <x:with-param name="value">
              <x:value-of select="''" />
            </x:with-param>
          </x:call-template>
        </fo:block>
      </fo:table-cell>
    </fo:table-row>
    <fo:table-row height="1mm">
      <fo:table-cell>
        <fo:block />
      </fo:table-cell>
    </fo:table-row>
  </x:template>
  <x:template name="СумОпер5Пусто">
    <x:param name="countAllRows" />
    <x:param name="i" />
    <x:choose>
      <x:when test="$i &lt; $countAllRows">
        <fo:table-row font-size="8.5">
          <fo:table-cell text-align="left" display-align="center">
            <fo:block>Код операции</fo:block>
          </fo:table-cell>
          <fo:table-cell text-align="center" display-align="center">
            <fo:block>030</fo:block>
          </fo:table-cell>
          <fo:table-cell display-align="center">
            <fo:block>
              <x:call-template name="box">
                <x:with-param name="value" select="'-'" />
              </x:call-template>
            </fo:block>
          </fo:table-cell>
        </fo:table-row>
        <fo:table-row height="1.5mm">
          <fo:table-cell>
            <fo:block />
          </fo:table-cell>
        </fo:table-row>
        <fo:table-row font-size="8.5">
          <fo:table-cell text-align="left" display-align="center" number-columns-spanned="3">
            <fo:block>По операциям, обоснованность применения налоговой ставки 0 процентов по</fo:block>
            <fo:block>которым документально подтверждена в предыдущих налоговых периодах:</fo:block>
          </fo:table-cell>
        </fo:table-row>
        <fo:table-row height="1.5mm">
          <fo:table-cell>
            <fo:block />
          </fo:table-cell>
        </fo:table-row>
        <fo:table-row font-size="8.5">
          <fo:table-cell text-align="left" margin-left="5mm" display-align="center">
            <fo:block>Налоговая база</fo:block>
          </fo:table-cell>
          <fo:table-cell text-align="center" display-align="center">
            <fo:block>040</fo:block>
          </fo:table-cell>
          <fo:table-cell display-align="center">
            <fo:block>
              <x:call-template name="box">
                <x:with-param name="value" select="'-'" />
              </x:call-template>
            </fo:block>
          </fo:table-cell>
        </fo:table-row>
        <fo:table-row height="1.5mm">
          <fo:table-cell>
            <fo:block />
          </fo:table-cell>
        </fo:table-row>
        <fo:table-row font-size="8.5">
          <fo:table-cell text-align="left" margin-left="5mm" display-align="center">
            <fo:block>Налоговые вычеты</fo:block>
          </fo:table-cell>
          <fo:table-cell text-align="center" display-align="center">
            <fo:block>050</fo:block>
          </fo:table-cell>
          <fo:table-cell display-align="center">
            <fo:block>
              <x:call-template name="box">
                <x:with-param name="value" select="'-'" />
              </x:call-template>
            </fo:block>
          </fo:table-cell>
        </fo:table-row>
        <fo:table-row height="1.5mm">
          <fo:table-cell>
            <fo:block />
          </fo:table-cell>
        </fo:table-row>
        <fo:table-row font-size="8.5">
          <fo:table-cell text-align="left" display-align="center" number-columns-spanned="3">
            <fo:block>По операциям, обоснованность применения налоговой ставки 0 процентов по</fo:block>
            <fo:block>которым документально не подтверждена в предыдущих налоговых периодах:</fo:block>
          </fo:table-cell>
        </fo:table-row>
        <fo:table-row height="1.5mm">
          <fo:table-cell>
            <fo:block />
          </fo:table-cell>
        </fo:table-row>
        <fo:table-row font-size="8.5">
          <fo:table-cell text-align="left" margin-left="5mm" display-align="center">
            <fo:block>Налоговая база</fo:block>
          </fo:table-cell>
          <fo:table-cell text-align="center" display-align="center">
            <fo:block>060</fo:block>
          </fo:table-cell>
          <fo:table-cell display-align="center">
            <fo:block>
              <x:call-template name="box">
                <x:with-param name="value" select="'-'" />
              </x:call-template>
            </fo:block>
          </fo:table-cell>
        </fo:table-row>
        <fo:table-row height="1.5mm">
          <fo:table-cell>
            <fo:block />
          </fo:table-cell>
        </fo:table-row>
        <fo:table-row font-size="8.5">
          <fo:table-cell text-align="left" margin-left="5mm" display-align="center">
            <fo:block>Налоговые вычеты</fo:block>
          </fo:table-cell>
          <fo:table-cell text-align="center" display-align="center">
            <fo:block>070</fo:block>
          </fo:table-cell>
          <fo:table-cell display-align="center">
            <fo:block>
              <x:call-template name="box">
                <x:with-param name="value" select="'-'" />
              </x:call-template>
            </fo:block>
          </fo:table-cell>
        </fo:table-row>
        <fo:table-row height="1.5mm">
          <fo:table-cell>
            <fo:block />
          </fo:table-cell>
        </fo:table-row>
        <x:call-template name="СумОпер5Пусто">
          <x:with-param name="i" select="$i + 1" />
          <x:with-param name="countAllRows" select="$countAllRows" />
        </x:call-template>
      </x:when>
    </x:choose>
  </x:template>
  <x:template name="СумОпер6Пусто">
    <x:param name="countAllRows" />
    <x:param name="i" />
    <x:choose>
      <x:when test="$i &lt; $countAllRows">
        <fo:table table-layout="fixed" width="100%">
          <fo:table-column column-width="118mm" />
          <fo:table-column column-width="20mm" />
          <fo:table-column column-width="50mm" />
          <fo:table-body>
            <fo:table-row font-size="8.5">
              <fo:table-cell text-align="left" display-align="center">
                <fo:block>Код операции</fo:block>
              </fo:table-cell>
              <fo:table-cell text-align="center" display-align="center">
                <fo:block>010</fo:block>
              </fo:table-cell>
              <fo:table-cell display-align="center" font-family="Cour" font-size="14pt">
                <fo:block>
                  <x:call-template name="box">
                    <x:with-param name="value" select="''" />
                  </x:call-template>
                </fo:block>
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row height="1.5mm">
              <fo:table-cell>
                <fo:block />
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row font-size="8.5">
              <fo:table-cell text-align="left" display-align="center">
                <fo:block>Налоговая база</fo:block>
              </fo:table-cell>
              <fo:table-cell text-align="center" display-align="center">
                <fo:block>020</fo:block>
              </fo:table-cell>
              <fo:table-cell display-align="center" font-family="Cour" font-size="14pt">
                <fo:block>
                  <x:call-template name="box">
                    <x:with-param name="value" select="''" />
                  </x:call-template>
                </fo:block>
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row height="1.5mm">
              <fo:table-cell>
                <fo:block />
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row font-size="8.5">
              <fo:table-cell text-align="left" display-align="center">
                <fo:block>Суммы налога, исчисленные по налоговым ставкам, предусмотренным пунктами</fo:block>
                <fo:block>2, 3 статьи 164 Налогового кодекса Российской Федерации</fo:block>
              </fo:table-cell>
              <fo:table-cell text-align="center" display-align="center">
                <fo:block>030</fo:block>
              </fo:table-cell>
              <fo:table-cell display-align="center" font-family="Cour" font-size="14pt">
                <fo:block>
                  <x:call-template name="box">
                    <x:with-param name="value" select="''" />
                  </x:call-template>
                </fo:block>
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row height="1.5mm">
              <fo:table-cell>
                <fo:block />
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row font-size="8.5">
              <fo:table-cell text-align="left" display-align="center">
                <fo:block>Сумма налоговых вычетов по операциям по реализации товаров (работ, услуг),</fo:block>
                <fo:block>обоснованность применения налоговой ставки 0 процентов по которым</fo:block>
                <fo:block>документально не подтверждена</fo:block>
              </fo:table-cell>
              <fo:table-cell text-align="center" display-align="center">
                <fo:block>040</fo:block>
              </fo:table-cell>
              <fo:table-cell display-align="center" font-family="Cour" font-size="14pt">
                <fo:block>
                  <x:call-template name="box">
                    <x:with-param name="value" select="''" />
                  </x:call-template>
                </fo:block>
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row height="3mm">
              <fo:table-cell>
                <fo:block />
              </fo:table-cell>
            </fo:table-row>
          </fo:table-body>
        </fo:table>
        <x:call-template name="СумОпер6Пусто">
          <x:with-param name="i" select="$i + 1" />
          <x:with-param name="countAllRows" select="$countAllRows" />
        </x:call-template>
      </x:when>
    </x:choose>
  </x:template>
  <x:template name="КорНалВозврТовПусто">
    <fo:table-row font-size="8.5">
      <fo:table-cell text-align="left" display-align="center">
        <fo:block>Код операции</fo:block>
      </fo:table-cell>
      <fo:table-cell text-align="center" display-align="center">
        <fo:block>070</fo:block>
      </fo:table-cell>
      <fo:table-cell display-align="center" font-family="Cour" font-size="14pt">
        <fo:block>
          <x:call-template name="box">
            <x:with-param name="value" select="''" />
          </x:call-template>
        </fo:block>
      </fo:table-cell>
    </fo:table-row>
    <fo:table-row height="1.5mm">
      <fo:table-cell>
        <fo:block />
      </fo:table-cell>
    </fo:table-row>
    <fo:table-row font-size="8.5">
      <fo:table-cell text-align="left" display-align="center">
        <fo:block>
                    Налоговая база<fo:inline font-size="65%" vertical-align="text-top"> 2</fo:inline></fo:block>
      </fo:table-cell>
      <fo:table-cell text-align="center" display-align="center">
        <fo:block>080</fo:block>
      </fo:table-cell>
      <fo:table-cell display-align="center" font-family="Cour" font-size="14pt">
        <fo:block>
          <x:call-template name="box">
            <x:with-param name="value" select="''" />
          </x:call-template>
        </fo:block>
      </fo:table-cell>
    </fo:table-row>
    <fo:table-row height="1.5mm">
      <fo:table-cell>
        <fo:block />
      </fo:table-cell>
    </fo:table-row>
    <fo:table-row font-size="8.5">
      <fo:table-cell text-align="left" display-align="center">
        <fo:block>Корректировка сумм налога, ранее исчисленных по налоговым ставкам,</fo:block>
        <fo:block>предусмотренным пунктами 2, 3 статьи 164 Налогового кодекса Российской</fo:block>
        <fo:block>
                    Федерации<fo:inline font-size="65%" vertical-align="text-top"> 2</fo:inline></fo:block>
      </fo:table-cell>
      <fo:table-cell text-align="center" display-align="center">
        <fo:block>090</fo:block>
      </fo:table-cell>
      <fo:table-cell display-align="center" font-family="Cour" font-size="14pt">
        <fo:block>
          <x:call-template name="box">
            <x:with-param name="value" select="''" />
          </x:call-template>
        </fo:block>
      </fo:table-cell>
    </fo:table-row>
    <fo:table-row height="1.5mm">
      <fo:table-cell>
        <fo:block />
      </fo:table-cell>
    </fo:table-row>
    <fo:table-row font-size="8.5">
      <fo:table-cell text-align="left" display-align="center">
        <fo:block>
                    Сумма налога, ранее принятая к вычету и подлежащая восстановлению<fo:inline font-size="65%" vertical-align="text-top"> 2</fo:inline></fo:block>
      </fo:table-cell>
      <fo:table-cell text-align="center" display-align="center">
        <fo:block>100</fo:block>
      </fo:table-cell>
      <fo:table-cell display-align="center" font-family="Cour" font-size="14pt">
        <fo:block>
          <x:call-template name="box">
            <x:with-param name="value" select="''" />
          </x:call-template>
        </fo:block>
      </fo:table-cell>
    </fo:table-row>
    <fo:table-row height="3mm">
      <fo:table-cell>
        <fo:block />
      </fo:table-cell>
    </fo:table-row>
  </x:template>
  <x:template name="КорНалИзмЦенПусто">
    <fo:table-row font-size="8.5">
      <fo:table-cell text-align="left" display-align="center">
        <fo:block>Код операции</fo:block>
      </fo:table-cell>
      <fo:table-cell text-align="center" display-align="center">
        <fo:block>110</fo:block>
      </fo:table-cell>
      <fo:table-cell display-align="center" font-family="Cour" font-size="14pt">
        <fo:block>
          <x:call-template name="box">
            <x:with-param name="value" select="''" />
          </x:call-template>
        </fo:block>
      </fo:table-cell>
    </fo:table-row>
    <fo:table-row height="1.5mm">
      <fo:table-cell>
        <fo:block />
      </fo:table-cell>
    </fo:table-row>
    <fo:table-row font-size="8.5">
      <fo:table-cell text-align="left" display-align="center">
        <fo:block>Сумма, на которую корректируется налоговая база при увеличении цены</fo:block>
        <fo:block>
                    реализованных товаров (работ, услуг)<fo:inline font-size="65%" vertical-align="text-top"> 2</fo:inline></fo:block>
      </fo:table-cell>
      <fo:table-cell text-align="center" display-align="center">
        <fo:block>120</fo:block>
      </fo:table-cell>
      <fo:table-cell display-align="center" font-family="Cour" font-size="14pt">
        <fo:block>
          <x:call-template name="box">
            <x:with-param name="value" select="''" />
          </x:call-template>
        </fo:block>
      </fo:table-cell>
    </fo:table-row>
    <fo:table-row height="1.5mm">
      <fo:table-cell>
        <fo:block />
      </fo:table-cell>
    </fo:table-row>
    <fo:table-row font-size="8.5">
      <fo:table-cell text-align="left" display-align="center">
        <fo:block>Корректировка сумм налога, ранее исчисленных по налоговым ставкам,</fo:block>
        <fo:block>предусмотренным пунктами 2, 3 статьи 164 Налогового кодекса Российской</fo:block>
        <fo:block>
                    Федерации<fo:inline font-size="65%" vertical-align="text-top"> 2</fo:inline></fo:block>
      </fo:table-cell>
      <fo:table-cell text-align="center" display-align="center">
        <fo:block>130</fo:block>
      </fo:table-cell>
      <fo:table-cell display-align="center" font-family="Cour" font-size="14pt">
        <fo:block>
          <x:call-template name="box">
            <x:with-param name="value" select="''" />
          </x:call-template>
        </fo:block>
      </fo:table-cell>
    </fo:table-row>
    <fo:table-row height="1.5mm">
      <fo:table-cell>
        <fo:block />
      </fo:table-cell>
    </fo:table-row>
    <fo:table-row font-size="8.5">
      <fo:table-cell text-align="left" display-align="center">
        <fo:block>Сумма, на которую корректируется налоговая база при уменьшении цены</fo:block>
        <fo:block>
                    реализованных товаров (работ, услуг)<fo:inline font-size="65%" vertical-align="text-top"> 2</fo:inline></fo:block>
      </fo:table-cell>
      <fo:table-cell text-align="center" display-align="center">
        <fo:block>140</fo:block>
      </fo:table-cell>
      <fo:table-cell display-align="center" font-family="Cour" font-size="14pt">
        <fo:block>
          <x:call-template name="box">
            <x:with-param name="value" select="''" />
          </x:call-template>
        </fo:block>
      </fo:table-cell>
    </fo:table-row>
    <fo:table-row height="1.5mm">
      <fo:table-cell>
        <fo:block />
      </fo:table-cell>
    </fo:table-row>
    <fo:table-row font-size="8.5">
      <fo:table-cell text-align="left" display-align="center">
        <fo:block>Корректировка сумм налога, ранее исчисленных по налоговым ставкам,</fo:block>
        <fo:block>предусмотренным пунктами 2, 3 статьи 164 Налогового кодекса Российской</fo:block>
        <fo:block>
                    Федерации<fo:inline font-size="65%" vertical-align="text-top"> 2</fo:inline></fo:block>
      </fo:table-cell>
      <fo:table-cell text-align="center" display-align="center">
        <fo:block>150</fo:block>
      </fo:table-cell>
      <fo:table-cell display-align="center" font-family="Cour" font-size="14pt">
        <fo:block>
          <x:call-template name="box">
            <x:with-param name="value" select="''" />
          </x:call-template>
        </fo:block>
      </fo:table-cell>
    </fo:table-row>
    <fo:table-row height="1.5mm">
      <fo:table-cell>
        <fo:block />
      </fo:table-cell>
    </fo:table-row>
  </x:template>
  <x:template name="СумОпер7Пусто">
    <x:param name="countAllRows" />
    <x:param name="i" />
    <x:choose>
      <x:when test="$i &lt; $countAllRows">
        <fo:table-row height="9mm">
          <fo:table-cell display-align="center">
            <fo:block>
              <x:call-template name="box">
                <x:with-param name="value" select="'-'" />
              </x:call-template>
            </fo:block>
          </fo:table-cell>
          <fo:table-cell>
            <fo:block />
          </fo:table-cell>
          <fo:table-cell display-align="center">
            <fo:block>
              <x:call-template name="box">
                <x:with-param name="value" select="'-'" />
              </x:call-template>
            </fo:block>
          </fo:table-cell>
          <fo:table-cell>
            <fo:block />
          </fo:table-cell>
          <fo:table-cell display-align="center">
            <fo:block>
              <x:call-template name="box">
                <x:with-param name="value" select="'-'" />
              </x:call-template>
            </fo:block>
          </fo:table-cell>
          <fo:table-cell>
            <fo:block />
          </fo:table-cell>
          <fo:table-cell display-align="center">
            <fo:block>
              <x:call-template name="box">
                <x:with-param name="value" select="'-'" />
              </x:call-template>
            </fo:block>
          </fo:table-cell>
        </fo:table-row>
        <x:call-template name="СумОпер7Пусто">
          <x:with-param name="i" select="$i + 1" />
          <x:with-param name="countAllRows" select="$countAllRows" />
        </x:call-template>
      </x:when>
    </x:choose>
  </x:template>
  <x:template name="СведНалГодПусто">
    <x:param name="countAllRows" />
    <x:param name="i" />
    <x:choose>
      <x:when test="$i &lt; $countAllRows">
        <fo:table-row height="8.5mm">
          <fo:table-cell>
            <fo:block />
          </fo:table-cell>
          <fo:table-cell display-align="center">
            <fo:block>
              <x:call-template name="table">
                <x:with-param name="column-count" select="'4'" />
              </x:call-template>
            </fo:block>
          </fo:table-cell>
          <fo:table-cell display-align="center">
            <fo:block>
              <x:call-template name="Дата" />
            </fo:block>
          </fo:table-cell>
          <fo:table-cell display-align="center">
            <fo:block>
              <x:call-template name="ДоляПусто" />
            </fo:block>
          </fo:table-cell>
          <fo:table-cell display-align="center">
            <fo:block>
              <x:call-template name="table">
                <x:with-param name="column-count" select="'10'" />
              </x:call-template>
            </fo:block>
          </fo:table-cell>
        </fo:table-row>
        <x:call-template name="СведНалГодПусто">
          <x:with-param name="i" select="$i + 1" />
          <x:with-param name="countAllRows" select="$countAllRows" />
        </x:call-template>
      </x:when>
    </x:choose>
  </x:template>
  <x:template name="СведНалГодИПусто">
    <x:param name="countAllRows" />
    <x:param name="i" />
    <x:choose>
      <x:when test="$i &lt; $countAllRows">
        <fo:table-row height="8.5mm">
          <fo:table-cell display-align="center" padding-left="6mm">
            <fo:block>
              <x:call-template name="table">
                <x:with-param name="column-count" select="'9'" />
              </x:call-template>
            </fo:block>
          </fo:table-cell>
          <fo:table-cell display-align="center" padding-left="6mm">
            <x:call-template name="table">
              <x:with-param name="column-count" select="'12'" />
            </x:call-template>
          </fo:table-cell>
          <fo:table-cell display-align="center" padding-left="3mm">
            <x:call-template name="table">
              <x:with-param name="column-count" select="'12'" />
            </x:call-template>
          </fo:table-cell>
        </fo:table-row>
        <x:call-template name="СведНалГодИПусто">
          <x:with-param name="i" select="$i + 1" />
          <x:with-param name="countAllRows" select="$countAllRows" />
        </x:call-template>
      </x:when>
    </x:choose>
  </x:template>
</x:stylesheet>