<?xml version="1.0" encoding="utf-8"?>
<x:stylesheet version="1.0" xmlns:x="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
  <x:output method="xml" encoding="utf-8" indent="yes" omit-xml-declaration="no" />
  <!--x:include href="Base104812.xslt"/-->
  <x:include href="parameters.xslt" />
  <x:template name="Разметка">
    <fo:layout-master-set>
      <fo:simple-page-master master-name="Portrait-title" margin-left="5mm" margin-right="5mm" margin-top="5mm" margin-bottom="5mm" page-width="210mm" page-height="297mm">
        <fo:region-body margin-top="38mm" margin-bottom="20mm" />
        <fo:region-before />
        <fo:region-after />
      </fo:simple-page-master>
      <fo:simple-page-master master-name="Portrait" margin-left="5mm" margin-right="5mm" margin-top="5mm" margin-bottom="5mm" page-width="210mm" page-height="297mm">
        <fo:region-body margin-top="40mm" margin-bottom="25mm" />
        <fo:region-before extent="50mm" />
        <fo:region-after extent="20mm" />
      </fo:simple-page-master>
      <fo:simple-page-master master-name="Portrait_3" margin-left="5mm" margin-right="2mm" margin-top="5mm" margin-bottom="5mm" page-width="210mm" page-height="297mm">
        <fo:region-body margin-top="40mm" margin-bottom="25mm" />
        <fo:region-before extent="50mm" />
        <fo:region-after extent="20mm" />
      </fo:simple-page-master>
      <fo:simple-page-master master-name="first" margin-left="5mm" margin-right="5mm" margin-top="5mm" margin-bottom="5mm" page-width="210mm" page-height="297mm">
        <fo:region-body margin-top="55mm" margin-bottom="30mm" />
        <fo:region-before margin-top="50mm" margin-bottom="10mm" />
        <fo:region-after extent="20mm" />
      </fo:simple-page-master>
      <fo:simple-page-master master-name="rest" margin-left="5mm" margin-right="5mm" margin-top="5mm" margin-bottom="5mm" page-width="210mm" page-height="297mm">
        <fo:region-body margin-top="95mm" margin-bottom="37mm" />
        <fo:region-before region-name="header-rest" extent="95mm" />
        <fo:region-after extent="37mm" />
      </fo:simple-page-master>
      <fo:page-sequence-master master-name="Portrait2" margin-left="5mm" margin-right="5mm" margin-top="5mm" margin-bottom="5mm" page-width="210mm" page-height="297mm">
        <fo:repeatable-page-master-alternatives>
          <fo:conditional-page-master-reference page-position="first" master-reference="first" />
          <fo:conditional-page-master-reference page-position="rest" master-reference="rest" />
        </fo:repeatable-page-master-alternatives>
      </fo:page-sequence-master>
      <fo:simple-page-master master-name="Portrait3" margin-left="5mm" margin-right="5mm" margin-top="5mm" margin-bottom="5mm" page-width="210mm" page-height="297mm">
        <fo:region-body margin-top="35mm" margin-bottom="30mm" />
        <fo:region-before extent="35mm" />
        <fo:region-after extent="30mm" />
      </fo:simple-page-master>
    </fo:layout-master-set>
  </x:template>
  <x:template name="ШтрихКод_Portrait">
    <x:param name="код" />
    <fo:block-container height="17mm" width="35mm" left="5mm" position="absolute">
      <fo:block font-family="EanBarcode" font-size="38pt">
        <fo:block>
          <x:value-of select="$код" />
        </fo:block>
      </fo:block>
    </fo:block-container>
  </x:template>
  <x:template name="ИНН_КПП_Portrait">
    <x:param name="ИНН" />
    <x:param name="КПП" />
    <fo:block-container height="6mm" width="60mm" left="58mm + 1.5mm" position="absolute" display-align="after">
      <fo:block font-family="monoCour" text-align="right" font-size="12pt">
        <x:value-of select="$ИНН" />
        <x:if test="string-length($ИНН)=10">
          <x:value-of select="'--'" />
        </x:if>
      </fo:block>
    </fo:block-container>
    <fo:block-container height="6mm" width="45mm" top="7.5mm" left="58mm + 1.5mm" position="absolute" display-align="after">
      <fo:block font-family="monoCour" text-align="right" font-size="12pt">
        <x:value-of select="$КПП" />
      </fo:block>
    </fo:block-container>
  </x:template>
  <x:template name="Рамка_Portrait-title">
    <fo:block-container height="5mm" width="5mm" background-color="black" position="absolute">
      <fo:block />
    </fo:block-container>
    <fo:block-container height="5mm" width="5mm" left="40mm" background-color="black" position="absolute">
      <fo:block />
    </fo:block-container>
    <fo:block-container height="5mm" width="5mm" top="280mm" background-color="black" position="absolute">
      <fo:block />
    </fo:block-container>
    <fo:block-container height="5mm" width="5mm" top="280mm" left="195mm" background-color="black" position="absolute">
      <fo:block />
    </fo:block-container>
    <fo:block-container height="6mm" width="13mm" left="45mm" position="absolute" display-align="center">
      <fo:block>ИНН</fo:block>
    </fo:block-container>
    <fo:block-container height="6mm" width="13mm" left="45mm" top="7.5mm" position="absolute" display-align="center">
      <fo:block>КПП</fo:block>
    </fo:block-container>
    <fo:block-container height="6mm" width="10mm" top="7.5mm" left="103mm" position="absolute" display-align="center">
      <fo:block>Стр.</fo:block>
    </fo:block-container>
    <fo:block-container height="6mm" width="60mm" left="58mm" position="absolute">
      <x:call-template name="table">
        <x:with-param name="width" select="'100%'" />
        <x:with-param name="column-count" select="12" />
      </x:call-template>
    </fo:block-container>
    <fo:block-container height="6mm" width="45mm" left="58mm" top="7.5mm" position="absolute">
      <x:call-template name="table">
        <x:with-param name="width" select="'100%'" />
        <x:with-param name="column-count" select="9" />
      </x:call-template>
    </fo:block-container>
    <fo:block-container height="6mm" width="15mm" top="7.5mm" left="113mm" position="absolute">
      <x:call-template name="table">
        <x:with-param name="width" select="'100%'" />
        <x:with-param name="column-count" select="3" />
      </x:call-template>
    </fo:block-container>
    <fo:block-container height="6mm" width="15mm" top="8mm" left="113mm + 1.5mm" position="absolute" display-align="center">
      <fo:block font-family="monoCour" text-align="right" font-size="12pt">
        <fo:page-number />
      </fo:block>
    </fo:block-container>
  </x:template>
  <x:template match="/Файл">
    <fo:root text-align="center">
      <x:call-template name="Разметка" />
      <x:apply-templates select="Документ" />
    </fo:root>
  </x:template>
  <x:template match="Документ">
    <!--страница 1-->
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
          <x:with-param name="код" select="'-0291-eabf-'" />
        </x:call-template>
        <fo:block-container height="8mm" top="23mm" left="143mm" position="absolute" text-align="right">
          <fo:block font-weight="bold" text-align="right" font-size="10pt">Форма по КНД 1152016</fo:block>
        </fo:block-container>
        <fo:block-container height="5mm" top="30mm" position="absolute">
          <fo:block font-weight="bold" text-align="center" linefeed-treatment="preserve" font-size="11pt">Налоговая декларация
по единому налогу на вмененный доход для отдельных видов деятельности</fo:block>
        </fo:block-container>
      </fo:static-content>
      <x:call-template name="СвРукОрг_СвПред_Инспектор">
        <x:with-param name="СвНП" select="СвНП" />
        <x:with-param name="Дата" select="$signDate" />
        <x:with-param name="Подписант" select="Подписант" />
      </x:call-template>
      <fo:flow flow-name="xsl-region-body" font-size="9pt" font-family="Arial">
        <fo:table table-layout="fixed" width="100%">
          <fo:table-column column-width="20%" />
          <fo:table-column column-width="8%" />
          <fo:table-column column-width="8%" />
          <fo:table-column column-width="20%" />
          <fo:table-column column-width="6%" />
          <fo:table-column column-width="14%" />
          <fo:table-column column-width="12%" />
          <fo:table-column column-width="12%" />
          <fo:table-body>
            <fo:table-row height="10mm">
              <fo:table-cell text-align="left" display-align="center">
                <fo:block>Номер корректировки</fo:block>
              </fo:table-cell>
              <fo:table-cell text-align="left" display-align="center">
                <x:call-template name="table_left">
                  <x:with-param name="column-count" select="'3'" />
                  <x:with-param name="value" select="@НомКорр" />
                </x:call-template>
              </fo:table-cell>
              <fo:table-cell>
                <fo:block />
              </fo:table-cell>
              <fo:table-cell text-align="left" display-align="center">
                <fo:block>Налоговый период (код)</fo:block>
              </fo:table-cell>
              <fo:table-cell text-align="left" display-align="center">
                <x:call-template name="table_left">
                  <x:with-param name="column-count" select="'2'" />
                  <x:with-param name="value" select="@Период" />
                </x:call-template>
              </fo:table-cell>
              <fo:table-cell>
                <fo:block />
              </fo:table-cell>
              <fo:table-cell text-align="left" display-align="center">
                <fo:block>Отчетный год</fo:block>
              </fo:table-cell>
              <fo:table-cell text-align="left" display-align="center">
                <x:call-template name="table_left">
                  <x:with-param name="column-count" select="'4'" />
                  <x:with-param name="value" select="@ОтчетГод" />
                </x:call-template>
              </fo:table-cell>
            </fo:table-row>
          </fo:table-body>
        </fo:table>
        <fo:block space-after="1.5mm" />
        <fo:table table-layout="fixed" width="100%">
          <fo:table-column column-width="32%" />
          <fo:table-column column-width="12%" />
          <fo:table-column column-width="29%" />
          <fo:table-column column-width="17%" />
          <fo:table-column column-width="9%" />
          <fo:table-body>
            <fo:table-row>
              <fo:table-cell>
                <fo:block text-align="left">Представляется в налоговый орган (код)</fo:block>
              </fo:table-cell>
              <fo:table-cell>
                <x:call-template name="table_left">
                  <x:with-param name="column-count" select="'4'" />
                  <x:with-param name="value" select="@КодНО" />
                </x:call-template>
              </fo:table-cell>
              <fo:table-cell>
                <fo:block />
              </fo:table-cell>
              <fo:table-cell>
                <fo:block>по месту учета (код)</fo:block>
              </fo:table-cell>
              <fo:table-cell>
                <x:call-template name="table_left">
                  <x:with-param name="column-count" select="'3'" />
                  <x:with-param name="value" select="@ПоМесту" />
                </x:call-template>
              </fo:table-cell>
            </fo:table-row>
          </fo:table-body>
        </fo:table>
        <fo:block space-after="1.5mm" />
        <x:choose>
          <x:when test="СвНП/НПЮЛ">
            <x:call-template name="table_left">
              <x:with-param name="column-count" select="'40'" />
              <x:with-param name="value" select="substring(СвНП/НПЮЛ/@НаимОрг,1,40)" />
            </x:call-template>
            <fo:block space-after="1.5mm" />
            <x:call-template name="table_left">
              <x:with-param name="column-count" select="'40'" />
              <x:with-param name="value" select="substring(СвНП/НПЮЛ/@НаимОрг,41,80)" />
            </x:call-template>
            <fo:block space-after="1.5mm" />
            <x:call-template name="table_left">
              <x:with-param name="column-count" select="'40'" />
              <x:with-param name="value" select="substring(СвНП/НПЮЛ/@НаимОрг,81,120)" />
            </x:call-template>
            <fo:block space-after="1.5mm" />
            <x:call-template name="table_left">
              <x:with-param name="column-count" select="'40'" />
              <x:with-param name="value" select="substring(СвНП/НПЮЛ/@НаимОрг,121,160)" />
            </x:call-template>
          </x:when>
          <x:when test="СвНП/НПФЛ">
            <fo:block>
              <x:call-template name="table_left">
                <x:with-param name="column-count" select="'40'" />
                <x:with-param name="value" select="СвНП/НПФЛ/ФИО/@Фамилия" />
              </x:call-template>
            </fo:block>
            <fo:block space-after="2mm" />
            <fo:block>
              <x:call-template name="table_left">
                <x:with-param name="column-count" select="'40'" />
                <x:with-param name="value" select="СвНП/НПФЛ/ФИО/@Имя" />
              </x:call-template>
            </fo:block>
            <fo:block space-after="2mm" />
            <fo:block>
              <x:call-template name="table_left">
                <x:with-param name="column-count" select="'40'" />
                <x:with-param name="value" select="СвНП/НПФЛ/ФИО/@Отчество" />
              </x:call-template>
            </fo:block>
            <fo:block space-after="2mm" />
            <fo:block>
              <x:call-template name="table_left">
                <x:with-param name="column-count" select="'40'" />
              </x:call-template>
            </fo:block>
          </x:when>
          <x:otherwise>
            <x:value-of select="' '" />
          </x:otherwise>
        </x:choose>
        <fo:block space-after="1.5mm" />
        <fo:block text-align="center" font-size="7.5pt">(налогоплательщик)</fo:block>
        <fo:block space-after="1.5mm" />
        <fo:table table-layout="fixed" width="100%">
          <fo:table-column column-width="50%" />
          <fo:table-column column-width="5%" />
          <fo:table-column column-width="2.5%" />
          <fo:table-column column-width="5%" />
          <fo:table-column column-width="2.5%" />
          <fo:table-column column-width="5%" />
          <fo:table-column column-width="35%" />
          <fo:table-body>
            <fo:table-row>
              <fo:table-cell>
                <fo:block text-align="left">Код вида экономической деятельности по классификатору ОКВЭД</fo:block>
              </fo:table-cell>
              <fo:table-cell>
                <x:call-template name="table_left">
                  <x:with-param name="column-count" select="'2'" />
                  <x:with-param name="value" select="substring(СвНП/@ОКВЭД,1,2)" />
                </x:call-template>
              </fo:table-cell>
              <fo:table-cell text-align="center" display-align="center">
                <fo:block font-weight="bold">.</fo:block>
              </fo:table-cell>
              <fo:table-cell>
                <x:call-template name="table_left">
                  <x:with-param name="column-count" select="'2'" />
                  <x:with-param name="value" select="substring(СвНП/@ОКВЭД,4,2)" />
                </x:call-template>
              </fo:table-cell>
              <fo:table-cell text-align="center" display-align="center">
                <fo:block font-weight="bold">.</fo:block>
              </fo:table-cell>
              <fo:table-cell>
                <x:call-template name="table_left">
                  <x:with-param name="column-count" select="'2'" />
                  <x:with-param name="value" select="substring(СвНП/@ОКВЭД,7,2)" />
                </x:call-template>
              </fo:table-cell>
              <fo:table-cell>
                <fo:block />
              </fo:table-cell>
            </fo:table-row>
          </fo:table-body>
        </fo:table>
        <fo:block space-after="1.5mm"></fo:block>
        <fo:table table-layout="fixed" width="100%">
          <fo:table-column column-width="17%" />
          <fo:table-column column-width="2%" />
          <fo:table-column column-width="4%" />
          <fo:table-column column-width="2%" />
          <fo:table-column column-width="22%" />
          <fo:table-column column-width="2%" />
          <fo:table-column column-width="24%" />
          <fo:table-column column-width="3%" />
          <fo:table-column column-width="24%" />
          <fo:table-body>
            <fo:table-row>
              <fo:table-cell>
                <fo:block linefeed-treatment="preserve" text-align="right">Форма реорганизации
(ликвидация) (код)</fo:block>
              </fo:table-cell>
              <fo:table-cell>
                <fo:block></fo:block>
              </fo:table-cell>
              <fo:table-cell>
                <x:call-template name="table">
                  <x:with-param name="column-count" select="'1'" />
                  <x:with-param name="value" select="СвНП/НПЮЛ/СвРеоргЮЛ/@ФормРеорг" />
                </x:call-template>
              </fo:table-cell>
              <fo:table-cell>
                <fo:block></fo:block>
              </fo:table-cell>
              <fo:table-cell>
                <fo:block linefeed-treatment="preserve" text-align="right">ИНН/КПП реорганизованной
организации</fo:block>
              </fo:table-cell>
              <fo:table-cell>
                <fo:block></fo:block>
              </fo:table-cell>
              <fo:table-cell>
                <x:call-template name="table">
                  <x:with-param name="column-count" select="'10'" />
                  <x:with-param name="value" select="СвНП/НПЮЛ/СвРеоргЮЛ/@ИННЮЛ" />
                </x:call-template>
              </fo:table-cell>
              <fo:table-cell>
                <fo:block>/</fo:block>
              </fo:table-cell>
              <fo:table-cell>
                <x:call-template name="table">
                  <x:with-param name="column-count" select="'9'" />
                  <x:with-param name="value" select="СвНП/НПЮЛ/СвРеоргЮЛ/@КПП" />
                </x:call-template>
              </fo:table-cell>
            </fo:table-row>
          </fo:table-body>
        </fo:table>
        <fo:block space-after="1.5mm" />
        <fo:table table-layout="fixed" width="100%">
          <fo:table-column column-width="23%" />
          <fo:table-column column-width="78%" />
          <fo:table-body>
            <fo:table-row>
              <fo:table-cell>
                <fo:block text-align="left">Номер контактного телефона</fo:block>
              </fo:table-cell>
              <fo:table-cell>
                <x:call-template name="table_left">
                  <x:with-param name="column-count" select="'20'" />
                  <x:with-param name="value" select="СвНП/@Тлф" />
                  <x:with-param name="ch" select="'-'" />
                </x:call-template>
              </fo:table-cell>
            </fo:table-row>
          </fo:table-body>
        </fo:table>
        <fo:block space-after="2mm" />
        <fo:table width="100%">
          <fo:table-column column-width="4%" />
          <fo:table-column column-width="10%" />
          <fo:table-column column-width="55%" />
          <fo:table-column column-width="10%" />
          <fo:table-column column-width="21%" />
          <fo:table-body>
            <fo:table-row>
              <fo:table-cell>
                <fo:block>На</fo:block>
              </fo:table-cell>
              <fo:table-cell>
                <x:call-template name="table">
                  <x:with-param name="column-count" select="'3'" />
                  <x:with-param name="value" select="$pagesCount" />
                  <x:with-param name="ch" select="'-'" />
                </x:call-template>
              </fo:table-cell>
              <fo:table-cell>
                <fo:block>страницах с приложением подтверждающих документов или их копий на</fo:block>
              </fo:table-cell>
              <fo:table-cell>
                <x:call-template name="table">
                  <x:with-param name="column-count" select="'3'" />
                  <!--<x:with-param name="value" select="$pagesCount"/>-->
                  <x:with-param name="ch" select="'-'" />
                </x:call-template>
              </fo:table-cell>
              <fo:table-cell>
                <fo:block text-align="left">листах</fo:block>
              </fo:table-cell>
            </fo:table-row>
          </fo:table-body>
        </fo:table>
        <fo:block space-after="10mm" />
      </fo:flow>
    </fo:page-sequence>
    <x:apply-templates select="ЕНВД/СумНалПУВД">
      <x:with-param name="СвНП" select="СвНП" />
    </x:apply-templates>
    <x:apply-templates select="ЕНВД/СумНалПУВД/СумПУВД/РасчНалВД">
      <x:with-param name="СвНП" select="СвНП" />
    </x:apply-templates>
    <x:apply-templates select="ЕНВД/СумНалПУ">
      <x:with-param name="СвНП" select="СвНП" />
    </x:apply-templates>
  </x:template>
  <x:template match="ЕНВД/СумНалПУВД">
    <x:param name="СвНП" />
    <fo:page-sequence master-reference="Portrait" format="001">
      <fo:static-content flow-name="xsl-region-before" font-size="11pt" font-family="Arial">
        <x:call-template name="Рамка_Portrait-title" />
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
          <x:with-param name="код" select="'-0291-eacc-'" />
        </x:call-template>
        <fo:block space-after="15mm" />
        <fo:block font-weight="bold" font-size="10pt" text-align="center" linefeed-treatment="preserve">
          Раздел 1. Сумма единого налога на вмененный доход, подлежащая уплате в бюджет
        </fo:block>
        <fo:block space-after="2mm" />
        <x:call-template name="НаимКолонок" />
        <fo:block space-after="10mm" />
      </fo:static-content>
      <fo:static-content flow-name="xsl-region-after" font-family="Arial">
        <fo:block text-align="center" font-size="9pt">Достоверность и полноту сведений, указанных на данной странице, подтверждаю:</fo:block>
        <fo:block space-after="4mm" />
        <fo:table table-layout="fixed" width="100%">
          <fo:table-column column-width="10%" />
          <fo:table-column column-width="25%" />
          <fo:table-column column-width="10%" />
          <fo:table-column column-width="10%" />
          <fo:table-column column-width="25%" />
          <fo:table-column column-width="10%" />
          <fo:table-column column-width="10%" />
          <fo:table-body>
            <fo:table-row>
              <fo:table-cell>
                <fo:block />
              </fo:table-cell>
              <fo:table-cell border-bottom="1pt black solid">
                <fo:block />
              </fo:table-cell>
              <fo:table-cell>
                <fo:block font-size="7.5pt">(подпись)</fo:block>
              </fo:table-cell>
              <fo:table-cell>
                <fo:block />
              </fo:table-cell>
              <fo:table-cell border-bottom="1pt black solid">
                <fo:block />
              </fo:table-cell>
              <fo:table-cell>
                <fo:block font-size="7.5pt">(дата)</fo:block>
              </fo:table-cell>
              <fo:table-cell>
                <fo:block />
              </fo:table-cell>
            </fo:table-row>
          </fo:table-body>
        </fo:table>
        <fo:block space-after="5mm" />
      </fo:static-content>
      
        <fo:flow flow-name="xsl-region-body" font-size="9pt" font-family="Arial">
		<fo:block space-after="1mm" />
          <x:for-each select="СумПУВД">
            <x:call-template name="НаимНомСтр">
              <x:with-param name="Наименование" select="'Код по ОКТМО'" />
              <x:with-param name="НомерСтроки" select="'010'" />
              <x:with-param name="КолЯчеек" select="'11'" />
              <x:with-param name="Значение" select="@ОКТМО" />
            </x:call-template>
            <x:call-template name="НаимНомСтр3">
              <x:with-param name="Наименование" select="'Сумма единого налога на вмененный доход, подлежащая уплате за налоговый период (руб.) (стр. 040 раздела 3 Х (сумма строк 110 всех разделов 2 по данному коду ОКТМО / стр. 010 раздела 3))'" />
              <x:with-param name="НомерСтроки" select="'020'" />
              <x:with-param name="КолЯчеек" select="'10'" />
              <x:with-param name="Значение" select="@НалПУ" />
            </x:call-template>
            <fo:block space-after="4mm" />
          </x:for-each>
          <x:variable name="cnt1" select="count(СумПУВД) mod 8" />
          <x:if test="8-$cnt1 &gt; 0 and $cnt1 &gt; 0">
            <x:call-template name="НаимНомСтр">
              <x:with-param name="Наименование" select="'Код по ОКТМО'" />
              <x:with-param name="НомерСтроки" select="'010'" />
              <x:with-param name="КолЯчеек" select="'11'" />
              <x:with-param name="Значение" select="''" />
            </x:call-template>
            <x:call-template name="НаимНомСтр3">
              <x:with-param name="Наименование" select="'Сумма единого налога на вмененный доход, подлежащая уплате за налоговый период (руб.) (стр. 040 раздела 3 Х (сумма строк 110 всех разделов 2 по данному коду ОКТМО / стр. 010 раздела 3))'" />
              <x:with-param name="НомерСтроки" select="'020'" />
              <x:with-param name="КолЯчеек" select="'10'" />
              <x:with-param name="Значение" select="''" />
            </x:call-template>
            <fo:block space-after="4mm" />
          </x:if>
          <x:if test="7-$cnt1 &gt; 0 and $cnt1 &gt; 0">
            <x:call-template name="НаимНомСтр">
              <x:with-param name="Наименование" select="'Код по ОКТМО'" />
              <x:with-param name="НомерСтроки" select="'010'" />
              <x:with-param name="КолЯчеек" select="'11'" />
              <x:with-param name="Значение" select="''" />
            </x:call-template>
            <x:call-template name="НаимНомСтр3">
              <x:with-param name="Наименование" select="'Сумма единого налога на вмененный доход, подлежащая уплате за налоговый период (руб.) (стр. 040 раздела 3 Х (сумма строк 110 всех разделов 2 по данному коду ОКТМО / стр. 010 раздела 3))'" />
              <x:with-param name="НомерСтроки" select="'020'" />
              <x:with-param name="КолЯчеек" select="'10'" />
              <x:with-param name="Значение" select="''" />
            </x:call-template>
            <fo:block space-after="4mm" />
          </x:if>
          <x:if test="6-$cnt1 &gt; 0 and $cnt1 &gt; 0">
            <x:call-template name="НаимНомСтр">
              <x:with-param name="Наименование" select="'Код по ОКТМО'" />
              <x:with-param name="НомерСтроки" select="'010'" />
              <x:with-param name="КолЯчеек" select="'11'" />
              <x:with-param name="Значение" select="''" />
            </x:call-template>
            <x:call-template name="НаимНомСтр3">
              <x:with-param name="Наименование" select="'Сумма единого налога на вмененный доход, подлежащая уплате за налоговый период (руб.) (стр. 040 раздела 3 Х (сумма строк 110 всех разделов 2 по данному коду ОКТМО / стр. 010 раздела 3))'" />
              <x:with-param name="НомерСтроки" select="'020'" />
              <x:with-param name="КолЯчеек" select="'10'" />
              <x:with-param name="Значение" select="''" />
            </x:call-template>
            <fo:block space-after="4mm" />
          </x:if>
          <x:if test="5-$cnt1 &gt; 0 and $cnt1 &gt; 0">
            <x:call-template name="НаимНомСтр">
              <x:with-param name="Наименование" select="'Код по ОКТМО'" />
              <x:with-param name="НомерСтроки" select="'010'" />
              <x:with-param name="КолЯчеек" select="'11'" />
              <x:with-param name="Значение" select="''" />
            </x:call-template>
            <x:call-template name="НаимНомСтр3">
              <x:with-param name="Наименование" select="'Сумма единого налога на вмененный доход, подлежащая уплате за налоговый период (руб.) (стр. 040 раздела 3 Х (сумма строк 110 всех разделов 2 по данному коду ОКТМО / стр. 010 раздела 3))'" />
              <x:with-param name="НомерСтроки" select="'020'" />
              <x:with-param name="КолЯчеек" select="'10'" />
              <x:with-param name="Значение" select="''" />
            </x:call-template>
            <fo:block space-after="4mm" />
          </x:if>
          <x:if test="4-$cnt1 &gt; 0 and $cnt1 &gt; 0">
            <x:call-template name="НаимНомСтр">
              <x:with-param name="Наименование" select="'Код по ОКТМО'" />
              <x:with-param name="НомерСтроки" select="'010'" />
              <x:with-param name="КолЯчеек" select="'11'" />
              <x:with-param name="Значение" select="''" />
            </x:call-template>
            <x:call-template name="НаимНомСтр3">
              <x:with-param name="Наименование" select="'Сумма единого налога на вмененный доход, подлежащая уплате за налоговый период (руб.) (стр. 040 раздела 3 Х (сумма строк 110 всех разделов 2 по данному коду ОКТМО / стр. 010 раздела 3))'" />
              <x:with-param name="НомерСтроки" select="'020'" />
              <x:with-param name="КолЯчеек" select="'10'" />
              <x:with-param name="Значение" select="''" />
            </x:call-template>
            <fo:block space-after="4mm" />
          </x:if>
          <x:if test="3-$cnt1 &gt; 0 and $cnt1 &gt; 0">
            <x:call-template name="НаимНомСтр">
              <x:with-param name="Наименование" select="'Код по ОКТМО'" />
              <x:with-param name="НомерСтроки" select="'010'" />
              <x:with-param name="КолЯчеек" select="'11'" />
              <x:with-param name="Значение" select="''" />
            </x:call-template>
            <x:call-template name="НаимНомСтр3">
              <x:with-param name="Наименование" select="'Сумма единого налога на вмененный доход, подлежащая уплате за налоговый период (руб.) (стр. 040 раздела 3 Х (сумма строк 110 всех разделов 2 по данному коду ОКТМО / стр. 010 раздела 3))'" />
              <x:with-param name="НомерСтроки" select="'020'" />
              <x:with-param name="КолЯчеек" select="'10'" />
              <x:with-param name="Значение" select="''" />
            </x:call-template>
            <fo:block space-after="4mm" />
          </x:if>
          <x:if test="2-$cnt1 &gt; 0 and $cnt1 &gt; 0">
            <x:call-template name="НаимНомСтр">
              <x:with-param name="Наименование" select="'Код по ОКТМО'" />
              <x:with-param name="НомерСтроки" select="'010'" />
              <x:with-param name="КолЯчеек" select="'11'" />
              <x:with-param name="Значение" select="''" />
            </x:call-template>
            <x:call-template name="НаимНомСтр3">
              <x:with-param name="Наименование" select="'Сумма единого налога на вмененный доход, подлежащая уплате за налоговый период (руб.) (стр. 040 раздела 3 Х (сумма строк 110 всех разделов 2 по данному коду ОКТМО / стр. 010 раздела 3))'" />
              <x:with-param name="НомерСтроки" select="'020'" />
              <x:with-param name="КолЯчеек" select="'10'" />
              <x:with-param name="Значение" select="''" />
            </x:call-template>
            <fo:block space-after="4mm" />
          </x:if>
          <x:if test="1-$cnt1 &gt; 0 and $cnt1 &gt; 0">
            <x:call-template name="НаимНомСтр">
              <x:with-param name="Наименование" select="'Код по ОКТМО'" />
              <x:with-param name="НомерСтроки" select="'010'" />
              <x:with-param name="КолЯчеек" select="'11'" />
              <x:with-param name="Значение" select="''" />
            </x:call-template>
            <x:call-template name="НаимНомСтр3">
              <x:with-param name="Наименование" select="'Сумма единого налога на вмененный доход, подлежащая уплате за налоговый период (руб.) (стр. 040 раздела 3 Х (сумма строк 110 всех разделов 2 по данному коду ОКТМО / стр. 010 раздела 3))'" />
              <x:with-param name="НомерСтроки" select="'020'" />
              <x:with-param name="КолЯчеек" select="'10'" />
              <x:with-param name="Значение" select="''" />
            </x:call-template>
            <fo:block space-after="4mm" />
          </x:if>
        </fo:flow>
      
    </fo:page-sequence>
  </x:template>
  <x:template match="ЕНВД/СумНалПУВД/СумПУВД/РасчНалВД">
    <x:param name="СвНП" />
    <x:param name="ОКТМО" />
    <fo:page-sequence master-reference="Portrait_3" format="001">
      <fo:static-content flow-name="xsl-region-before" font-size="11pt" font-family="Arial">
        <x:call-template name="Рамка_Portrait-title" />
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
          <x:with-param name="код" select="'-0291-eadj-'" />
        </x:call-template>
        <fo:block space-after="20mm" />
        <fo:block font-weight="bold" font-size="10pt" text-align="center" linefeed-treatment="preserve">
          Раздел 2. Расчет суммы единого налога на вмененный доход по отдельным видам деятельности
        </fo:block>
        <fo:block space-after="2mm" />
      </fo:static-content>
      <fo:flow flow-name="xsl-region-body" font-size="9pt" font-family="Arial">
        <fo:table width="100%">
          <fo:table-column column-width="50%" />
          <fo:table-column column-width="5%" />
          <fo:table-column column-width="10%" />
          <fo:table-column column-width="25%" />
          <fo:table-body>
            <fo:table-row>
              <fo:table-cell>
                <fo:block text-align="left">Код вида предпринимательской деятельности (код стр. 010)</fo:block>
              </fo:table-cell>
              <fo:table-cell>
                <fo:block />
              </fo:table-cell>
              <fo:table-cell>
                <x:call-template name="table">
                  <x:with-param name="column-count" select="2" />
                  <x:with-param name="value" select="@КодВД" />
                  <x:with-param name="ch" select="'-'" />
                </x:call-template>
              </fo:table-cell>
            </fo:table-row>
          </fo:table-body>
        </fo:table>
        <fo:block space-after="2mm" />
        <fo:block>
          <fo:block text-align="left" font-weight="bold">Адрес места осуществления предпринимательской деятельности <fo:inline font-weight="normal">(код стр. 020)</fo:inline></fo:block>
        </fo:block>
        <fo:block space-after="2mm" />
        <x:call-template name="Адрес">
          <x:with-param name="path" select="АдрПредДеят" />
        </x:call-template>
        <fo:block space-after="2mm" />
        <fo:table width="100%">
          <fo:table-column column-width="25%" />
          <fo:table-column column-width="50%" />
          <fo:table-body>
            <fo:table-row>
              <fo:table-cell>
                <fo:block text-align="left">Код по ОКТМО (код стр. 030)</fo:block>
              </fo:table-cell>
              <fo:table-cell>
                <x:call-template name="table_left">
                  <x:with-param name="column-count" select="11" />
                  <x:with-param name="value" select="../@ОКТМО" />
                  <x:with-param name="ch" select="'-'" />
                </x:call-template>
              </fo:table-cell>
            </fo:table-row>
          </fo:table-body>
        </fo:table>
        <fo:block space-after="2mm" />
        <x:call-template name="НаимКолонок" />
        <fo:block space-after="2mm" />
        <fo:table table-layout="fixed" width="100%">
          <fo:table-column column-width="55%" />
          <fo:table-column column-width="15%" />
          <fo:table-column column-width="5%" />
          <fo:table-column column-width="25%" />
          <fo:table-body>
            <fo:table-row>
              <fo:table-cell>
                <fo:block text-align="left">Базовая доходность на единицу физического показателя в месяц (руб.)</fo:block>
              </fo:table-cell>
              <fo:table-cell>
                <fo:block>040</fo:block>
              </fo:table-cell>
              <fo:table-cell>
                <fo:block />
              </fo:table-cell>
              <fo:table-cell text-align="right">
                <x:call-template name="table">
                  <x:with-param name="column-count" select="6" />
                  <x:with-param name="value" select="РасчНалВДАдр/@БазДоход" />
                  <x:with-param name="ch" select="'-'" />
                </x:call-template>
              </fo:table-cell>
            </fo:table-row>
          </fo:table-body>
        </fo:table>
        <fo:block space-after="2mm" />
        <fo:table table-layout="fixed" width="100%">
          <fo:table-column column-width="55%" />
          <fo:table-column column-width="15%" />
          <fo:table-column column-width="5%" />
          <fo:table-column column-width="2.5%" />
          <fo:table-column column-width="2.5%" />
          <fo:table-column column-width="20%" />
          <fo:table-body>
            <fo:table-row height="10mm">
              <fo:table-cell>
                <fo:block text-align="left">Корректирующий коэффициент К1</fo:block>
              </fo:table-cell>
              <fo:table-cell>
                <fo:block>050</fo:block>
              </fo:table-cell>
              <fo:table-cell>
                <fo:block />
              </fo:table-cell>
              <fo:table-cell text-align="right">
                <x:call-template name="table">
                  <x:with-param name="column-count" select="1" />
                  <x:with-param name="value" select="substring(РасчНалВДАдр/@К1, 1, 1)" />
                  <x:with-param name="ch" select="'-'" />
                </x:call-template>
              </fo:table-cell>
              <fo:table-cell>
                <fo:block>
                  <fo:inline font-weight="bold" vertical-align="text-bottom">.</fo:inline>
                </fo:block>
              </fo:table-cell>
              <fo:table-cell>
                <x:call-template name="table">
                  <x:with-param name="column-count" select="3" />
                  <x:with-param name="value" select="substring(РасчНалВДАдр/@К1, 3, 5)" />
                  <x:with-param name="ch" select="'-'" />
                </x:call-template>
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row height="10mm">
              <fo:table-cell>
                <fo:block text-align="left">Корректирующий коэффициент К2</fo:block>
              </fo:table-cell>
              <fo:table-cell>
                <fo:block>060</fo:block>
              </fo:table-cell>
              <fo:table-cell>
                <fo:block />
              </fo:table-cell>
              <fo:table-cell text-align="right">
                <x:call-template name="table">
                  <x:with-param name="column-count" select="1" />
                  <x:with-param name="value" select="substring(РасчНалВДАдр/@К2, 1, 1)" />
                  <x:with-param name="ch" select="'-'" />
                </x:call-template>
              </fo:table-cell>
              <fo:table-cell>
                <fo:block>
                  <fo:inline font-weight="bold" vertical-align="text-bottom">.</fo:inline>
                </fo:block>
              </fo:table-cell>
              <fo:table-cell>
                <x:call-template name="table_left">
                  <x:with-param name="column-count" select="3" />
                  <x:with-param name="value" select="substring(РасчНалВДАдр/@К2, 3, 5)" />
                  <!--<x:with-param name="ch" select="'-'"/>-->
                </x:call-template>
              </fo:table-cell>
            </fo:table-row>
          </fo:table-body>
        </fo:table>
        <fo:block space-after="2mm" />
        <fo:table table-layout="fixed" width="100%" font-style="italic">
          <fo:table-column column-width="17%" />
          <fo:table-column column-width="7%" />
          <fo:table-column column-width="10%" />
          <fo:table-column column-width="33%" />
          <fo:table-column column-width="33%" />
          <fo:table-body>
            <fo:table-row height="25mm">
              <fo:table-cell>
                <fo:block />
              </fo:table-cell>
              <fo:table-cell display-align="center">
                <fo:block text-align="center" linefeed-treatment="preserve">Код строки</fo:block>
              </fo:table-cell>
              <fo:table-cell display-align="center">
                <fo:block text-align="center">Величина физического показателя</fo:block>
              </fo:table-cell>
              <fo:table-cell display-align="center">
                <fo:block text-align="center" linefeed-treatment="preserve">Количество календарных дней
осуществления деятельности в
месяце постановки на учет (снятия
с учета) в качестве
налогоплательщика единого налога</fo:block>
              </fo:table-cell>
              <fo:table-cell display-align="center">
                <fo:block text-align="center" linefeed-treatment="preserve">Налоговая база с учетом количества
календарных дней осуществления
деятельности в месяце постановки на
учет (снятия с учета) в качестве
налогоплательщика единого налога</fo:block>
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row height="6mm">
              <fo:table-cell>
                <fo:block />
              </fo:table-cell>
              <fo:table-cell>
                <fo:block display-align="center">1</fo:block>
              </fo:table-cell>
              <fo:table-cell>
                <fo:block display-align="center">2</fo:block>
              </fo:table-cell>
              <fo:table-cell>
                <fo:block display-align="center">3</fo:block>
              </fo:table-cell>
              <fo:table-cell>
                <fo:block display-align="center">4</fo:block>
              </fo:table-cell>
            </fo:table-row>
          </fo:table-body>
        </fo:table>
        <fo:block space-after="2mm" />
        <fo:table table-layout="fixed" width="100%">
          <fo:table-column column-width="17%" />
          <fo:table-column column-width="7%" />
          <fo:table-column column-width="15%" />
          <fo:table-column column-width="10%" />
          <fo:table-column column-width="5%" />
          <fo:table-column column-width="18%" />
          <fo:table-column column-width="28%" />
          <fo:table-body>
            <fo:table-row height="10mm">
              <fo:table-cell>
                <fo:block>В: 1 месяце квартала</fo:block>
              </fo:table-cell>
              <fo:table-cell>
                <fo:block>070</fo:block>
              </fo:table-cell>
              <fo:table-cell>
                <x:call-template name="table">
                  <x:with-param name="column-count" select="6" />
                  <x:with-param name="value" select="РасчНалВДАдр/@ФизПокМес1" />
                  <x:with-param name="ch" select="'-'" />
                </x:call-template>
              </fo:table-cell>
              <fo:table-cell>
                <fo:block />
              </fo:table-cell>
              <fo:table-cell>
                <x:call-template name="table">
                  <x:with-param name="column-count" select="2" />
                  <x:with-param name="value" select="РасчНалВДАдр/@КолДнейМес1" />
                  <x:with-param name="ch" select="'-'" />
                </x:call-template>
              </fo:table-cell>
              <fo:table-cell>
                <fo:block />
              </fo:table-cell>
              <fo:table-cell>
                <x:call-template name="table">
                  <x:with-param name="column-count" select="10" />
                  <x:with-param name="value" select="РасчНалВДАдр/@НалБазаМес1" />
                  <x:with-param name="ch" select="'-'" />
                </x:call-template>
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row height="10mm">
              <fo:table-cell>
                <fo:block>2 месяце квартала</fo:block>
              </fo:table-cell>
              <fo:table-cell>
                <fo:block>080</fo:block>
              </fo:table-cell>
              <fo:table-cell>
                <x:call-template name="table">
                  <x:with-param name="column-count" select="6" />
                  <x:with-param name="value" select="РасчНалВДАдр/@ФизПокМес2" />
                  <x:with-param name="ch" select="'-'" />
                </x:call-template>
              </fo:table-cell>
              <fo:table-cell>
                <fo:block />
              </fo:table-cell>
              <fo:table-cell>
                <x:call-template name="table">
                  <x:with-param name="column-count" select="2" />
                  <x:with-param name="value" select="РасчНалВДАдр/@КолДнейМес2" />
                  <x:with-param name="ch" select="'-'" />
                </x:call-template>
              </fo:table-cell>
              <fo:table-cell>
                <fo:block />
              </fo:table-cell>
              <fo:table-cell>
                <x:call-template name="table">
                  <x:with-param name="column-count" select="10" />
                  <x:with-param name="value" select="РасчНалВДАдр/@НалБазаМес2" />
                  <x:with-param name="ch" select="'-'" />
                </x:call-template>
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row height="10mm">
              <fo:table-cell>
                <fo:block>3 месяце квартала</fo:block>
              </fo:table-cell>
              <fo:table-cell>
                <fo:block>090</fo:block>
              </fo:table-cell>
              <fo:table-cell>
                <x:call-template name="table">
                  <x:with-param name="column-count" select="6" />
                  <x:with-param name="value" select="РасчНалВДАдр/@ФизПокМес3" />
                  <x:with-param name="ch" select="'-'" />
                </x:call-template>
              </fo:table-cell>
              <fo:table-cell>
                <fo:block />
              </fo:table-cell>
              <fo:table-cell>
                <x:call-template name="table">
                  <x:with-param name="column-count" select="2" />
                  <x:with-param name="value" select="РасчНалВДАдр/@КолДнейМес3" />
                  <x:with-param name="ch" select="'-'" />
                </x:call-template>
              </fo:table-cell>
              <fo:table-cell>
                <fo:block />
              </fo:table-cell>
              <fo:table-cell>
                <x:call-template name="table">
                  <x:with-param name="column-count" select="10" />
                  <x:with-param name="value" select="РасчНалВДАдр/@НалБазаМес3" />
                  <x:with-param name="ch" select="'-'" />
                </x:call-template>
              </fo:table-cell>
            </fo:table-row>
          </fo:table-body>
        </fo:table>
        <fo:block space-after="2mm" />
        <x:call-template name="НаимНомСтр2">
          <x:with-param name="Наименование" select="'Налоговая база всего (руб.)&#xD;&#xA;(сумма строк (070-090) гр. 4)'" />
          <x:with-param name="НомерСтроки" select="'100'" />
          <x:with-param name="КолЯчеек" select="10" />
          <x:with-param name="Значение" select="РасчНалВДАдр/@НалБаза" />
        </x:call-template>
        <fo:block space-after="2mm" />
        <fo:table table-layout="fixed" width="100%">
          <fo:table-column column-width="61.5%" />
          <fo:table-column column-width="11%" />
          <fo:table-column column-width="5%" />
          <fo:table-column column-width="2.5%" />
          <fo:table-column column-width="3%" />
          <fo:table-column column-width="17%" />
          <fo:table-body>
            <fo:table-row height="10mm">
              <fo:table-cell text-align="left">
                <fo:block>Ставка налога (%)</fo:block>
              </fo:table-cell>
              <fo:table-cell>
                <fo:block>105</fo:block>
              </fo:table-cell>
              <fo:table-cell>
                <x:choose>
                  <x:when test="substring-before(number(РасчНалВДАдр/@Ставка), '.')=''">
                    <x:call-template name="table">
                      <x:with-param name="value" select="substring(РасчНалВДАдр/@Ставка, 1, 2)" />
                      <x:with-param name="display-align" select="'after'" />
                      <x:with-param name="column-count" select="2" />
                    </x:call-template>
                  </x:when>
                  <x:otherwise>
                    <x:call-template name="table">
                      <x:with-param name="value" select="substring-before(number(РасчНалВДАдр/@Ставка), '.')" />
                      <x:with-param name="display-align" select="'after'" />
                      <x:with-param name="column-count" select="2" />
                    </x:call-template>
                  </x:otherwise>
                </x:choose>
              </fo:table-cell>
              <fo:table-cell text-align="center" display-align="center">
                <fo:block font-weight="bold">.</fo:block>
              </fo:table-cell>
              <fo:table-cell>
                <x:call-template name="table">
                  <x:with-param name="value" select="substring-after(number(РасчНалВДАдр/@Ставка), '.')" />
                  <x:with-param name="display-align" select="'after'" />
                  <x:with-param name="column-count" select="1" />
                </x:call-template>
              </fo:table-cell>
              <fo:table-cell>
                <fo:block />
              </fo:table-cell>
            </fo:table-row>
          </fo:table-body>
        </fo:table>
        <fo:block space-after="2mm" />
        <x:call-template name="НаимНомСтр2">
          <x:with-param name="Наименование" select="'Сумма исчисленного единого налога на вмененный доход&#xD;&#xA;за налоговый период (руб.)&#xD;&#xA;(стр. 100 х стр. 105/100)'" />
          <x:with-param name="НомерСтроки" select="'110'" />
          <x:with-param name="КолЯчеек" select="10" />
          <x:with-param name="Значение" select="РасчНалВДАдр/@СумНалИсчисл" />
        </x:call-template>
      </fo:flow>
    </fo:page-sequence>
  </x:template>
  <x:template match="ЕНВД/СумНалПУ">
    <x:param name="СвНП" />
    <fo:page-sequence master-reference="Portrait" format="001">
      <fo:static-content flow-name="xsl-region-before" font-size="11pt" font-family="Arial">
        <x:call-template name="Рамка_Portrait-title" />
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
          <x:with-param name="код" select="'-0291-eaeg-'" />
        </x:call-template>
        <fo:block space-after="20mm" />
        <fo:block font-weight="bold" font-size="10pt" text-align="center" linefeed-treatment="preserve">
          Раздел 3. Расчет суммы единого налога на вмененный доход за налоговый период
        </fo:block>
      </fo:static-content>
      <fo:flow flow-name="xsl-region-body" font-size="9pt" font-family="Arial">
        <fo:block text-align="right" font-style="italic" font-size="9pt" margin-right="15mm">(в рублях)</fo:block>
        <fo:block space-after="2mm" />
        <x:call-template name="НаимКолонок2" />
        <fo:block space-after="3mm" />
        <fo:block text-align="left">Признак налогоплательщика:</fo:block>
        <fo:block space-after="4mm" />
        <fo:table table-layout="fixed" width="100%" font-size="8.5pt">
          <fo:table-column column-width="66%" background-color="aqua" />
          <fo:table-column column-width="0.1%" />
          <fo:table-column column-width="3%" />
          <fo:table-column column-width="4%" />
          <fo:table-column column-width="25%" />
          <fo:table-body>
            <fo:table-row height="10mm">
              <fo:table-cell>
                <fo:block text-align="left">1 – налогоплательщик, производящий выплаты и иные вознаграждения физическим лицам;</fo:block>
                <fo:block text-align="left">2 – индивидуальный предприниматель, не производящий выплаты и иные вознаграждения</fo:block>
                <fo:block text-align="left" margin-left="4mm">физическим лицам</fo:block>
              </fo:table-cell>
              <fo:table-cell>
                <fo:block />
              </fo:table-cell>
              <fo:table-cell>
                <fo:block>005</fo:block>
              </fo:table-cell>
              <fo:table-cell>
                <fo:block />
              </fo:table-cell>
              <fo:table-cell>
                <fo:block display-align="center">
                  <x:call-template name="table">
                    <x:with-param name="column-count" select="1" />
                    <x:with-param name="value" select="@ПризнакНП" />
                    <x:with-param name="ch" select="'-'" />
                  </x:call-template>
                </fo:block>
              </fo:table-cell>
            </fo:table-row>
          </fo:table-body>
        </fo:table>
        <fo:block space-after="4mm" />
        <x:call-template name="НаимНомСтр2">
          <x:with-param name="Наименование" select="'Сумма исчисленного за налоговый период единого налога на вмененный доход&#xD;&#xA;(сумма значений стр.110 всех заполненных разделов 2 декларации)'" />
          <x:with-param name="НомерСтроки" select="'010'" />
          <x:with-param name="КолЯчеек" select="10" />
          <x:with-param name="Значение" select="@СумНалИсчислОбщ" />
        </x:call-template>
        <fo:block space-after="4mm" />
        <x:call-template name="НаимНомСтр2">
          <x:with-param name="Наименование" select="'Сумма страховых взносов, платежей и расходов, предусмотренных пунктом 2&#xD;&#xA;статьи 346.32 Налогового кодекса Российской Федерации, на которые может быть&#xD;&#xA;уменьшена сумма исчисленного за налоговый период единого налога на&#xD;&#xA;вмененный доход налогоплательщиком, производящим выплаты работникам,&#xD;&#xA;занятым в тех сферах деятельности налогоплательщика, по которым&#xD;&#xA;уплачивается единый налог'" />
          <x:with-param name="НомерСтроки" select="'020'" />
          <x:with-param name="КолЯчеек" select="10" />
          <x:with-param name="Значение" select="@СумСВУм346.32.2" />
        </x:call-template>
        <fo:block space-after="4mm" />
        <x:call-template name="НаимНомСтр2">
          <x:with-param name="Наименование" select="'Сумма страховых взносов, уплаченных индивидуальным предпринимателем в&#xD;&#xA;фиксированном размере на обязательное пенсионное страхование и на&#xD;&#xA;обязательное медицинское страхование'" />
          <x:with-param name="НомерСтроки" select="'030'" />
          <x:with-param name="КолЯчеек" select="10" />
          <x:with-param name="Значение" select="@СумСВ_ИП" />
        </x:call-template>
        <fo:block space-after="4mm" />
        <x:call-template name="НаимНомСтр2">
          <x:with-param name="Наименование" select="'Общая сумма единого налога на вмененный доход, подлежащая уплате в бюджет&#xD;&#xA;за налоговый период&#xD;&#xA;для стр. 005 = «1»: стр. 040 = стр. 010 – (стр. 020 + стр.030) &gt;= 50% стр.010&#xD;&#xA;для стр. 005 = «2»: стр. 040 = стр. 010 – стр. 030 &gt;= 0'" />
          <x:with-param name="НомерСтроки" select="'040'" />
          <x:with-param name="КолЯчеек" select="10" />
          <x:with-param name="Значение" select="@НалПУРасч" />
        </x:call-template>
      </fo:flow>
    </fo:page-sequence>
  </x:template>
  <!--Показатели Код строки Значения показателей-->
  <x:template name="НаимКолонок">
    <fo:table table-layout="fixed" width="100%" font-size="9pt">
      <fo:table-column column-width="20%" />
      <fo:table-column column-width="10%" />
      <fo:table-column column-width="25%" />
      <fo:table-column column-width="15%" />
      <fo:table-column column-width="5%" />
      <fo:table-column column-width="20%" />
      <fo:table-column column-width="5%" />
      <fo:table-body>
        <fo:table-row height="4mm">
          <fo:table-cell>
            <fo:block />
          </fo:table-cell>
          <fo:table-cell text-align="center">
            <fo:block font-style="italic">Показатели</fo:block>
          </fo:table-cell>
          <fo:table-cell>
            <fo:block />
          </fo:table-cell>
          <fo:table-cell text-align="center">
            <fo:block font-style="italic" linefeed-treatment="preserve">Код
строки</fo:block>
          </fo:table-cell>
          <fo:table-cell>
            <fo:block />
          </fo:table-cell>
          <fo:table-cell>
            <fo:block linefeed-treatment="preserve" font-style="italic">Значения показателей</fo:block>
          </fo:table-cell>
          <fo:table-cell>
            <fo:block />
          </fo:table-cell>
        </fo:table-row>
        <fo:table-row height="5mm">
          <fo:table-cell>
            <fo:block />
          </fo:table-cell>
          <fo:table-cell text-align="center">
            <fo:block font-style="italic">1</fo:block>
          </fo:table-cell>
          <fo:table-cell>
            <fo:block />
          </fo:table-cell>
          <fo:table-cell text-align="center">
            <fo:block font-style="italic">2</fo:block>
          </fo:table-cell>
          <fo:table-cell>
            <fo:block />
          </fo:table-cell>
          <fo:table-cell>
            <fo:block font-style="italic">3</fo:block>
          </fo:table-cell>
          <fo:table-cell>
            <fo:block />
          </fo:table-cell>
        </fo:table-row>
      </fo:table-body>
    </fo:table>
  </x:template>
  <x:template name="НаимКолонок2">
    <fo:table table-layout="fixed" width="100%" font-size="9pt">
      <fo:table-column column-width="25%" />
      <fo:table-column column-width="10%" />
      <fo:table-column column-width="25%" />
      <fo:table-column column-width="15%" />
      <fo:table-column column-width="3%" />
      <fo:table-column column-width="19%" />
      <fo:table-column column-width="3%" />
      <fo:table-body>
        <fo:table-row height="4mm">
          <fo:table-cell>
            <fo:block />
          </fo:table-cell>
          <fo:table-cell text-align="center">
            <fo:block font-style="italic">Показатели</fo:block>
          </fo:table-cell>
          <fo:table-cell>
            <fo:block />
          </fo:table-cell>
          <fo:table-cell text-align="center">
            <fo:block font-style="italic" linefeed-treatment="preserve">Код
строки</fo:block>
          </fo:table-cell>
          <fo:table-cell>
            <fo:block />
          </fo:table-cell>
          <fo:table-cell>
            <fo:block linefeed-treatment="preserve" font-style="italic">Значения показателей</fo:block>
          </fo:table-cell>
          <fo:table-cell>
            <fo:block />
          </fo:table-cell>
        </fo:table-row>
        <fo:table-row height="5mm">
          <fo:table-cell>
            <fo:block />
          </fo:table-cell>
          <fo:table-cell text-align="center">
            <fo:block font-style="italic">1</fo:block>
          </fo:table-cell>
          <fo:table-cell>
            <fo:block />
          </fo:table-cell>
          <fo:table-cell text-align="center">
            <fo:block font-style="italic">2</fo:block>
          </fo:table-cell>
          <fo:table-cell>
            <fo:block />
          </fo:table-cell>
          <fo:table-cell>
            <fo:block font-style="italic">3</fo:block>
          </fo:table-cell>
          <fo:table-cell>
            <fo:block />
          </fo:table-cell>
        </fo:table-row>
      </fo:table-body>
    </fo:table>
  </x:template>
  <!--Строка вида название, номер строки, и какое-то количество ячеек-->
  <x:template name="НаимНомСтр">
    <x:param name="Наименование" />
    <x:param name="Сноска" />
    <x:param name="НомерСтроки" />
    <x:param name="КолЯчеек" />
    <x:param name="Значение" />
    <fo:table table-layout="fixed" width="100%">
      <fo:table-column column-width="57%" />
      <fo:table-column column-width="3%" />
      <fo:table-column column-width="3%" />
      <fo:table-column column-width="3%" />
      <fo:table-column column-width="36%" />
      <fo:table-body>
        <fo:table-row height="10mm">
          <fo:table-cell>
            <fo:block text-align="left">
              <x:value-of select="$Наименование" />
              <fo:inline font-size="65%" vertical-align="text-top">
                <x:value-of select="$Сноска" />
              </fo:inline>
            </fo:block>
          </fo:table-cell>
          <fo:table-cell>
            <fo:block />
          </fo:table-cell>
          <fo:table-cell>
            <fo:block>
              <x:value-of select="$НомерСтроки" />
            </fo:block>
          </fo:table-cell>
          <fo:table-cell>
            <fo:block />
          </fo:table-cell>
          <fo:table-cell>
            <fo:block display-align="center">
              <x:call-template name="table_left">
                <x:with-param name="column-count" select="$КолЯчеек" />
                <x:with-param name="value" select="$Значение" />
                <x:with-param name="ch" select="'-'" />
              </x:call-template>
            </fo:block>
          </fo:table-cell>
        </fo:table-row>
      </fo:table-body>
    </fo:table>
  </x:template>
  <x:template name="НаимНомСтр3">
    <x:param name="Наименование" />
    <x:param name="Сноска" />
    <x:param name="НомерСтроки" />
    <x:param name="КолЯчеек" />
    <x:param name="Значение" />
    <fo:table table-layout="fixed" width="100%">
      <fo:table-column column-width="57%" />
      <fo:table-column column-width="3%" />
      <fo:table-column column-width="3%" />
      <fo:table-column column-width="3%" />
      <fo:table-column column-width="36%" />
      <fo:table-body>
        <fo:table-row height="10mm">
          <fo:table-cell>
            <fo:block text-align="left">
              <x:value-of select="$Наименование" />
              <fo:inline font-size="65%" vertical-align="text-top">
                <x:value-of select="$Сноска" />
              </fo:inline>
            </fo:block>
          </fo:table-cell>
          <fo:table-cell>
            <fo:block />
          </fo:table-cell>
          <fo:table-cell>
            <fo:block>
              <x:value-of select="$НомерСтроки" />
            </fo:block>
          </fo:table-cell>
          <fo:table-cell>
            <fo:block />
          </fo:table-cell>
          <fo:table-cell>
            <fo:block display-align="center">
              <x:call-template name="table">
                <x:with-param name="column-count" select="$КолЯчеек" />
                <x:with-param name="value" select="$Значение" />
                <x:with-param name="ch" select="'-'" />
              </x:call-template>
            </fo:block>
          </fo:table-cell>
        </fo:table-row>
      </fo:table-body>
    </fo:table>
  </x:template>
  <x:template name="НаимНомСтр2">
    <x:param name="Наименование" />
    <x:param name="НомерСтроки" />
    <x:param name="КолЯчеек" />
    <x:param name="Значение" />
    <fo:table table-layout="fixed" width="100%" font-size="8.5pt">
      <fo:table-column column-width="62.5%" />
      <fo:table-column column-width="3%" />
      <fo:table-column column-width="3%" />
      <fo:table-column column-width="4%" />
      <fo:table-column column-width="25%" />
      <fo:table-body>
        <fo:table-row height="10mm">
          <fo:table-cell>
            <fo:block text-align="left" linefeed-treatment="preserve">
              <x:value-of select="$Наименование" />
            </fo:block>
          </fo:table-cell>
          <fo:table-cell>
            <fo:block />
          </fo:table-cell>
          <fo:table-cell>
            <fo:block>
              <x:value-of select="$НомерСтроки" />
            </fo:block>
          </fo:table-cell>
          <fo:table-cell>
            <fo:block />
          </fo:table-cell>
          <fo:table-cell>
            <fo:block display-align="center">
              <x:call-template name="table">
                <x:with-param name="column-count" select="$КолЯчеек" />
                <x:with-param name="value" select="$Значение" />
                <x:with-param name="ch" select="'-'" />
              </x:call-template>
            </fo:block>
          </fo:table-cell>
        </fo:table-row>
      </fo:table-body>
    </fo:table>
  </x:template>
  <!--Адрес-->
  <x:template name="Адрес">
    <x:param name="path" />
    <x:param name="адрес" />
    <fo:table table-layout="fixed" width="100%" font-size="9pt">
      <fo:table-column column-width="100% - 170mm" />
      <fo:table-column column-width="40mm" />
      <fo:table-column column-width="55mm" />
      <fo:table-column column-width="62mm" />
      <fo:table-column column-width="15mm" />
      <fo:table-body>
        <fo:table-row height="9mm" display-align="center">
          <fo:table-cell text-align="left">
            <fo:block margin-right="2mm">Почтовый индекс</fo:block>
          </fo:table-cell>
          <fo:table-cell display-align="center">
            <x:call-template name="table">
              <x:with-param name="column-count" select="'6'" />
              <x:with-param name="value" select="$path/@Индекс" />
            </x:call-template>
          </fo:table-cell>
          <fo:table-cell>
            <fo:block />
          </fo:table-cell>
          <fo:table-cell text-align="center">
            <fo:block margin-right="2mm">Субъект Российской Федерации (код)</fo:block>
          </fo:table-cell>
          <fo:table-cell display-align="center">
            <x:call-template name="table">
              <x:with-param name="column-count" select="'2'" />
              <x:with-param name="value" select="$path/@КодРегион" />
            </x:call-template>
          </fo:table-cell>
        </fo:table-row>
      </fo:table-body>
    </fo:table>
    <fo:table table-layout="fixed" width="100%" font-size="9pt">
      <fo:table-column column-width="100%-170mm" />
      <fo:table-column column-width="170mm" />
      <fo:table-body>
        <fo:table-row height="9mm" display-align="center">
          <fo:table-cell>
            <fo:block text-align="left">Район</fo:block>
          </fo:table-cell>
          <fo:table-cell>
            <x:call-template name="table_left">
              <x:with-param name="column-count" select="'34'" />
              <x:with-param name="value" select="$path/@Район" />
            </x:call-template>
          </fo:table-cell>
        </fo:table-row>
        <fo:table-row height="9mm" display-align="center">
          <fo:table-cell>
            <fo:block text-align="left">Город</fo:block>
          </fo:table-cell>
          <fo:table-cell>
            <x:call-template name="table_left">
              <x:with-param name="column-count" select="'34'" />
              <x:with-param name="value" select="$path/@Город" />
            </x:call-template>
          </fo:table-cell>
        </fo:table-row>
        <fo:table-row height="8mm" display-align="center">
          <fo:table-cell>
            <fo:block text-align="left" linefeed-treatment="preserve">Населенный пункт
<fo:inline font-size="8pt">(село, поселок и т.п.)</fo:inline></fo:block>
          </fo:table-cell>
          <fo:table-cell>
            <x:call-template name="table_left">
              <x:with-param name="column-count" select="'34'" />
              <x:with-param name="value" select="$path/@НаселПункт" />
            </x:call-template>
          </fo:table-cell>
        </fo:table-row>
        <fo:table-row height="9mm" display-align="center">
          <fo:table-cell>
            <fo:block text-align="left">Улица</fo:block>
            <fo:block text-align="left">
              <fo:inline font-size="7.5pt">(проспект, переулок и т.п.)</fo:inline>
            </fo:block>
          </fo:table-cell>
          <fo:table-cell>
            <x:call-template name="table_left">
              <x:with-param name="column-count" select="'34'" />
              <x:with-param name="value" select="$path/@Улица" />
            </x:call-template>
          </fo:table-cell>
        </fo:table-row>
      </fo:table-body>
    </fo:table>
    <fo:table table-layout="fixed" width="100%" font-size="9pt">
      <fo:table-column column-width="100%-170mm" />
      <fo:table-column column-width="40mm" />
      <fo:table-column column-width="25mm" />
      <fo:table-column column-width="40mm" />
      <fo:table-column column-width="25mm" />
      <fo:table-column column-width="40mm" />
      <fo:table-body>
        <fo:table-row height="9mm" display-align="center">
          <fo:table-cell text-align="left">
            <fo:block>Номер дома</fo:block>
            <fo:block>(владения)</fo:block>
          </fo:table-cell>
          <fo:table-cell display-align="center">
            <x:call-template name="table_left">
              <x:with-param name="column-count" select="'8'" />
              <x:with-param name="value" select="$path/@Дом" />
            </x:call-template>
          </fo:table-cell>
          <fo:table-cell text-align="left">
            <fo:block font-size="7pt" margin-left="3mm">Номер корпуса</fo:block>
            <fo:block font-size="7pt" margin-left="3mm">(строения)</fo:block>
          </fo:table-cell>
          <fo:table-cell display-align="center">
            <x:call-template name="table_left">
              <x:with-param name="column-count" select="'8'" />
              <x:with-param name="value" select="$path/@Корпус" />
            </x:call-template>
          </fo:table-cell>
          <fo:table-cell text-align="left">
            <fo:block font-size="7pt" margin-left="3mm">Номер офиса</fo:block>
            <fo:block font-size="7pt" margin-left="3mm">(квартиры)</fo:block>
          </fo:table-cell>
          <fo:table-cell display-align="center">
            <x:call-template name="table_left">
              <x:with-param name="column-count" select="'8'" />
              <x:with-param name="value" select="$path/@Кварт" />
            </x:call-template>
          </fo:table-cell>
        </fo:table-row>
      </fo:table-body>
    </fo:table>
  </x:template>
  <x:template name="СвРукОрг_СвПред_Инспектор">
    <x:param name="СвНП" />
    <x:param name="Дата" />
    <x:param name="Подписант" />
    <fo:static-content flow-name="xsl-region-after" font-size="9pt" font-family="Arial">
      <fo:block-container width="200mm" top="-165mm" position="absolute" display-align="after">
        <fo:table table-layout="fixed" width="100%" border-top="1pt black solid">
          <fo:table-column column-width="103mm" border-right="1pt black solid" />
          <fo:table-column column-width="97mm" />
          <fo:table-body>
            <fo:table-row height="155mm">
              <fo:table-cell display-align="before">
                <fo:block font-weight="bold" text-align="center" linefeed-treatment="preserve" font-size="10pt" margin-top="2mm">Достоверность и полноту сведений, указанных
в настоящей декларации, подтверждаю:</fo:block>
                <fo:block space-after="3mm" />
                <fo:table table-layout="fixed" width="100%">
                  <fo:table-column column-width="15mm" />
                  <fo:table-column column-width="5mm" />
                  <fo:table-column column-width="100%-20mm" />
                  <fo:table-body>
                    <fo:table-row>
                      <fo:table-cell>
                        <fo:block />
                      </fo:table-cell>
                      <fo:table-cell text-align="center" display-align="center">
                        <x:call-template name="table">
                          <x:with-param name="column-count" select="1" />
                          <x:with-param name="value" select="$Подписант/@ПрПодп" />
                          <x:with-param name="ch" select="'-'" />
                        </x:call-template>
                      </fo:table-cell>
                      <fo:table-cell text-align="left" display-align="center">
                        <fo:block margin-left="5mm">1 - налогоплательщик</fo:block>
                        <fo:block margin-left="5mm">2 - представитель налогоплательщика</fo:block>
                      </fo:table-cell>
                    </fo:table-row>
                  </fo:table-body>
                </fo:table>
                <fo:block space-after="3mm" />
                <fo:block>
                  <x:call-template name="table_left">
                    <x:with-param name="column-count" select="'20'" />
                    <x:with-param name="value" select="$Подписант/ФИО/@Фамилия" />
                  </x:call-template>
                </fo:block>
                <fo:block space-after="2mm" />
                <fo:block>
                  <x:call-template name="table_left">
                    <x:with-param name="column-count" select="'20'" />
                    <x:with-param name="value" select="$Подписант/ФИО/@Имя" />
                  </x:call-template>
                </fo:block>
                <fo:block space-after="2mm" />
                <fo:block>
                  <x:call-template name="table_left">
                    <x:with-param name="column-count" select="'20'" />
                    <x:with-param name="value" select="$Подписант/ФИО/@Отчество" />
                  </x:call-template>
                </fo:block>
                <fo:block margin-top="1mm" text-align="center" font-size="7.5pt" linefeed-treatment="preserve">(фамилия, имя, отчество* полностью)</fo:block>
                <fo:block space-after="2mm" />
                <x:call-template name="table_left">
                  <x:with-param name="column-count" select="'20'" />
                  <x:with-param name="value" select="substring(Подписант/СвПред/@НаимОрг,1,20)" />
                </x:call-template>
                <fo:block space-after="1.5mm" />
                <x:call-template name="table_left">
                  <x:with-param name="column-count" select="'20'" />
                  <x:with-param name="value" select="substring(Подписант/СвПред/@НаимОрг,21,40)" />
                </x:call-template>
                <fo:block space-after="1.5mm" />
                <x:call-template name="table_left">
                  <x:with-param name="column-count" select="'20'" />
                  <x:with-param name="value" select="substring(Подписант/СвПред/@НаимОрг,41,60)" />
                </x:call-template>
                <fo:block space-after="1.5mm" />
                <x:call-template name="table_left">
                  <x:with-param name="column-count" select="'20'" />
                  <x:with-param name="value" select="substring(Подписант/СвПред/@НаимОрг,61,80)" />
                </x:call-template>
                <fo:block space-after="1.5mm" />
                <x:call-template name="table_left">
                  <x:with-param name="column-count" select="'20'" />
                  <x:with-param name="value" select="substring(Подписант/СвПред/@НаимОрг,81,100)" />
                </x:call-template>
                <fo:block space-after="1.5mm" />
                <x:call-template name="table_left">
                  <x:with-param name="column-count" select="'20'" />
                  <x:with-param name="value" select="substring(Подписант/СвПред/@НаимОрг,101,120)" />
                </x:call-template>
                <fo:block space-after="1.5mm" />
                <x:call-template name="table_left">
                  <x:with-param name="column-count" select="'20'" />
                  <x:with-param name="value" select="substring(Подписант/СвПред/@НаимОрг,121,140)" />
                </x:call-template>
                <fo:block space-after="1.5mm" />
                <x:call-template name="table_left">
                  <x:with-param name="column-count" select="'20'" />
                  <x:with-param name="value" select="substring(Подписант/СвПред/@НаимОрг,141,160)" />
                </x:call-template>
                <fo:block space-after="1.5mm" />
                <fo:block text-align="center" font-size="7.5pt">(наименование организации - представителя налогоплательщика)</fo:block>
                <fo:block space-after="1.5mm" />
                <fo:table table-layout="fixed" width="100%">
                  <fo:table-column column-width="15mm" />
                  <fo:table-column column-width="29mm" />
                  <fo:table-column column-width="10mm" />
                  <fo:table-column column-width="41mm" />
                  <fo:table-body>
                    <fo:table-row>
                      <fo:table-cell>
                        <fo:block font-size="9pt" margin-top="2mm">Подпись</fo:block>
                      </fo:table-cell>
                      <fo:table-cell border-bottom="solid black 1pt">
                        <fo:block />
                      </fo:table-cell>
                      <fo:table-cell>
                        <fo:block font-size="9pt" margin-top="2mm" display-align="center">Дата</fo:block>
                      </fo:table-cell>
                      <fo:table-cell>
                        <x:call-template name="Дата">
                          <x:with-param name="Дата" select="$Дата" />
                        </x:call-template>
                      </fo:table-cell>
                    </fo:table-row>
                  </fo:table-body>
                </fo:table>
                <fo:block space-after="1mm" />
                <fo:block text-align="center" linefeed-treatment="preserve" font-size="9pt">Наименование документа,
подтверждающего полномочия представителя</fo:block>
                <fo:block space-after="1mm" />
                <fo:block>
                  <x:call-template name="table_left">
                    <x:with-param name="column-count" select="'20'" />
                    <x:with-param name="value" select="substring($Подписант/СвПред/@НаимДок, 1, 20)" />
                  </x:call-template>
                </fo:block>
                <fo:block space-after="1.5mm" />
                <fo:block>
                  <x:call-template name="table_left">
                    <x:with-param name="column-count" select="'20'" />
                    <x:with-param name="value" select="substring($Подписант/СвПред/@НаимДок, 21, 20)" />
                  </x:call-template>
                </fo:block>
                <fo:block space-after="2mm" />
                <fo:block text-align="left" margin-left="2mm"> * отчество при наличии.</fo:block>
              </fo:table-cell>
              <fo:table-cell display-align="before">
                <x:call-template name="Инспектор" />
              </fo:table-cell>
            </fo:table-row>
          </fo:table-body>
        </fo:table>
        <fo:block space-after="1mm" />
      </fo:block-container>
    </fo:static-content>
  </x:template>
  <x:template name="Инспектор">
    <fo:block space-after="2mm" />
    <fo:block font-weight="bold" text-align="center" font-size="9pt">Заполняется работником налогового органа</fo:block>
    <fo:block space-after="2mm" />
    <fo:block text-align="center" font-size="9pt">Сведения о представлении декларации</fo:block>
    <fo:block space-after="3mm" />
    <fo:table table-layout="fixed" width="100%">
      <fo:table-column column-width="65mm" />
      <fo:table-column column-width="16mm" />
      <fo:table-body>
        <fo:table-cell text-align="left" display-align="center" font-size="9pt">
          <fo:block margin-left="2mm">Данная декларация представлена (код)</fo:block>
        </fo:table-cell>
        <fo:table-cell>
          <x:call-template name="table">
            <x:with-param name="column-count" select="'2'" />
          </x:call-template>
        </fo:table-cell>
      </fo:table-body>
    </fo:table>
    <fo:block space-after="3mm" />
    <fo:table table-layout="fixed" width="100%" font-size="9pt">
      <fo:table-column column-width="10mm" />
      <fo:table-column column-width="15mm" />
      <fo:table-column column-width="100%-50mm" />
      <fo:table-body>
        <fo:table-cell text-align="left" display-align="center" font-size="9pt">
          <fo:block margin-left="2mm" linefeed-treatment="preserve">на </fo:block>
        </fo:table-cell>
        <fo:table-cell display-align="center">
          <x:call-template name="table">
            <x:with-param name="column-count" select="'3'" />
          </x:call-template>
        </fo:table-cell>
        <fo:table-cell text-align="left" display-align="center" font-size="9pt">
          <fo:block margin-left="2mm">страницах</fo:block>
        </fo:table-cell>
      </fo:table-body>
    </fo:table>
    <fo:block space-after="2mm" />
    <fo:table table-layout="fixed" width="100%" font-size="9pt">
      <fo:table-column column-width="25mm" />
      <fo:table-column column-width="3mm" />
      <fo:table-column column-width="15mm" />
      <fo:table-column column-width="100%-45mm" />
      <fo:table-body>
        <fo:table-row height="8mm">
          <fo:table-cell number-columns-spanned="4">
            <fo:block margin-left="2mm" linefeed-treatment="preserve" text-align="left">с приложением подтверждающих документов</fo:block>
          </fo:table-cell>
        </fo:table-row>
        <fo:table-row>
          <fo:table-cell text-align="left" display-align="center" font-size="9pt">
            <fo:block margin-left="2mm" linefeed-treatment="preserve" text-align="left">или их копий на</fo:block>
          </fo:table-cell>
          <fo:table-cell>
            <fo:block />
          </fo:table-cell>
          <fo:table-cell display-align="center">
            <x:call-template name="table">
              <x:with-param name="column-count" select="'3'" />
            </x:call-template>
          </fo:table-cell>
          <fo:table-cell text-align="left" display-align="center" font-size="9pt">
            <fo:block margin-left="2mm">листах</fo:block>
          </fo:table-cell>
        </fo:table-row>
      </fo:table-body>
    </fo:table>
    <fo:block space-after="4mm" />
    <fo:table table-layout="fixed" width="100%" font-size="9pt">
      <fo:table-column column-width="45mm" />
      <fo:table-column column-width="53mm" />
      <fo:table-body>
        <fo:table-cell text-align="left" display-align="center">
          <fo:block margin-left="2mm" linefeed-treatment="preserve">Дата представления
декларации </fo:block>
        </fo:table-cell>
        <fo:table-cell display-align="center">
          <x:call-template name="Дата"></x:call-template>
        </fo:table-cell>
      </fo:table-body>
    </fo:table>
    <fo:block space-after="4mm" />
    <fo:table table-layout="fixed" width="100%" font-size="9pt">
      <fo:table-column column-width="100%-65mm" />
      <fo:table-column column-width="65mm" />
      <fo:table-body>
        <fo:table-cell text-align="center" display-align="after">
          <fo:block linefeed-treatment="preserve" margin-left="2mm" text-align="left">Зарегистрирован
за №</fo:block>
        </fo:table-cell>
        <fo:table-cell display-align="center">
          <x:call-template name="table">
            <x:with-param name="column-count" select="'13'" />
          </x:call-template>
        </fo:table-cell>
      </fo:table-body>
    </fo:table>
    <fo:block space-after="75mm" />
    <fo:table table-layout="fixed" width="88mm">
      <fo:table-column column-width="10mm" />
      <fo:table-column column-width="40mm" />
      <fo:table-column column-width="10mm" />
      <fo:table-column column-width="28mm" />
      <fo:table-body>
        <fo:table-row>
          <fo:table-cell>
            <fo:block />
          </fo:table-cell>
          <fo:table-cell border-top="1pt black solid">
            <fo:block font-size="7.5pt" margin-top="1mm">
              Фамилия, И. О.*
            </fo:block>
          </fo:table-cell>
          <fo:table-cell>
            <fo:block />
          </fo:table-cell>
          <fo:table-cell border-top="1pt black solid">
            <fo:block margin-top="1mm" font-size="7.5pt">Подпись</fo:block>
          </fo:table-cell>
        </fo:table-row>
      </fo:table-body>
    </fo:table>
  </x:template>
  <x:template name="Дата">
    <x:param name="Дата" />
    <fo:table table-layout="fixed" width="46mm">
      <fo:table-column column-width="10mm" />
      <fo:table-column column-width="3mm" />
      <fo:table-column column-width="10mm" />
      <fo:table-column column-width="3mm" />
      <fo:table-column column-width="20mm" />
      <fo:table-body>
        <fo:table-row>
          <fo:table-cell>
            <x:call-template name="table">
              <x:with-param name="value" select="substring($Дата, 1, 2)" />
              <x:with-param name="display-align" select="'after'" />
              <x:with-param name="column-count" select="2" />
            </x:call-template>
          </fo:table-cell>
          <fo:table-cell text-align="center" display-align="center">
            <fo:block font-weight="bold">.</fo:block>
          </fo:table-cell>
          <fo:table-cell>
            <x:call-template name="table">
              <x:with-param name="value" select="substring($Дата, 4, 2)" />
              <x:with-param name="display-align" select="'after'" />
              <x:with-param name="column-count" select="2" />
            </x:call-template>
          </fo:table-cell>
          <fo:table-cell text-align="center" display-align="center">
            <fo:block font-weight="bold">.</fo:block>
          </fo:table-cell>
          <fo:table-cell>
            <x:call-template name="table">
              <x:with-param name="value" select="substring($Дата, 7, 4)" />
              <x:with-param name="display-align" select="'after'" />
              <x:with-param name="column-count" select="4" />
            </x:call-template>
          </fo:table-cell>
        </fo:table-row>
      </fo:table-body>
    </fo:table>
  </x:template>
  <x:template name="table">
    <x:param name="value" />
    <x:param name="column-count" />
    <x:param name="column-width" />
    <x:param name="row-height" />
    <x:param name="border" />
    <x:param name="width" />
    <x:param name="font-size" />
    <x:param name="display-align" />
    <fo:table table-layout="fixed" width="100%">
      <x:if test="$width">
        <x:attribute name="width">
          <x:value-of select="$width" />
        </x:attribute>
      </x:if>
      <x:if test="$font-size">
        <x:attribute name="font-size">
          <x:value-of select="$font-size" />
        </x:attribute>
      </x:if>
      <x:call-template name="column">
        <x:with-param name="index" select="1" />
        <x:with-param name="column-count" select="$column-count" />
        <x:with-param name="column-width" select="$column-width" />
        <x:with-param name="border" select="$border" />
      </x:call-template>
      <fo:table-body>
        <fo:table-row height="5.5mm">
          <x:if test="$row-height">
            <x:attribute name="height">
              <x:value-of select="$row-height" />
            </x:attribute>
          </x:if>
          <x:call-template name="cell">
            <x:with-param name="index" select="1" />
            <x:with-param name="index1" select="string-length($value)" />
            <x:with-param name="column-count" select="$column-count" />
            <x:with-param name="display-align" select="$display-align" />
            <x:with-param name="value" select="$value" />
          </x:call-template>
        </fo:table-row>
      </fo:table-body>
    </fo:table>
  </x:template>
  <x:template name="table_left">
    <x:param name="value" />
    <x:param name="column-count" />
    <x:param name="column-width" />
    <x:param name="row-height" />
    <x:param name="border" />
    <x:param name="width" />
    <x:param name="font-size" />
    <x:param name="display-align" />
    <x:param name="ch" />
    <fo:table table-layout="fixed" width="100%">
      <x:if test="$width">
        <x:attribute name="width">
          <x:value-of select="$width" />
        </x:attribute>
      </x:if>
      <x:if test="$font-size">
        <x:attribute name="font-size">
          <x:value-of select="$font-size" />
        </x:attribute>
      </x:if>
      <x:call-template name="column">
        <x:with-param name="index" select="1" />
        <x:with-param name="column-count" select="$column-count" />
        <x:with-param name="column-width" select="$column-width" />
        <x:with-param name="border" select="$border" />
      </x:call-template>
      <fo:table-body>
        <fo:table-row height="5.5mm">
          <x:if test="$row-height">
            <x:attribute name="height">
              <x:value-of select="$row-height" />
            </x:attribute>
          </x:if>
          <x:call-template name="cell_left">
            <x:with-param name="index" select="1" />
            <x:with-param name="column-count" select="$column-count" />
            <x:with-param name="display-align" select="$display-align" />
            <x:with-param name="value" select="$value" />
            <x:with-param name="ch" select="$ch" />
          </x:call-template>
        </fo:table-row>
      </fo:table-body>
    </fo:table>
  </x:template>
  <x:template name="column">
    <x:param name="index" />
    <x:param name="column-count" />
    <x:param name="column-width" />
    <x:param name="border" />
    <fo:table-column column-width="5mm" border="1pt black dotted">
      <x:if test="$column-width">
        <x:attribute name="column-width">
          <x:value-of select="$column-width" />
        </x:attribute>
      </x:if>
      <x:if test="$border">
        <x:attribute name="border">
          <x:value-of select="$border" />
        </x:attribute>
      </x:if>
    </fo:table-column>
    <x:if test="$index &lt; $column-count">
      <x:call-template name="column">
        <x:with-param name="index" select="$index + 1" />
        <x:with-param name="column-count" select="$column-count" />
        <x:with-param name="column-width" select="$column-width" />
        <x:with-param name="border" select="$border" />
      </x:call-template>
    </x:if>
  </x:template>
  <x:template name="cell">
    <x:param name="index" />
    <x:param name="index1" />
    <x:param name="column-count" />
    <x:param name="display-align" />
    <x:param name="value" />
    <x:param name="ch" />
    <x:if test="$index &lt; $column-count">
      <x:call-template name="cell">
        <x:with-param name="index" select="$index + 1" />
        <x:with-param name="index1" select="$index1 - 1" />
        <x:with-param name="column-count" select="$column-count" />
        <x:with-param name="display-align" select="$display-align" />
        <x:with-param name="value" select="$value" />
      </x:call-template>
    </x:if>
    <fo:table-cell text-align="center" display-align="after">
      <x:if test="$display-align">
        <x:attribute name="display-align">
          <x:value-of select="$display-align" />
        </x:attribute>
      </x:if>
      <fo:block font-size="12pt" font-family="Cour">
        <x:if test="$value">
          <x:value-of select="translate(substring($value, $index1, 1),'абвгдеёжзийклмнопрстуфхцчшщъыьэюяabcdefghijklmnopqrstuvwxyz','АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯABCDEFGHIJKLMNOPQRSTUVWXYZ')" />
        </x:if>
        <x:if test="$index &gt; string-length($value)">
          <x:value-of select="''" />
        </x:if>
      </fo:block>
    </fo:table-cell>
  </x:template>
  <x:template name="cell_left">
    <x:param name="index" />
    <x:param name="column-count" />
    <x:param name="display-align" />
    <x:param name="value" />
    <x:param name="ch" />
    <fo:table-cell text-align="center" display-align="after">
      <x:if test="$display-align">
        <x:attribute name="display-align">
          <x:value-of select="$display-align" />
        </x:attribute>
      </x:if>
      <fo:block font-size="12pt" font-family="Cour">
        <x:if test="$value">
          <x:value-of select="translate(substring($value, $index, 1),'абвгдеёжзийклмнопрстуфхцчшщъыьэюяabcdefghijklmnopqrstuvwxyz','АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯABCDEFGHIJKLMNOPQRSTUVWXYZ')" />
        </x:if>
        <x:if test="$index &gt; string-length($value)">
          <x:value-of select="$ch" />
        </x:if>
      </fo:block>
    </fo:table-cell>
    <x:if test="$index &lt; $column-count">
      <x:call-template name="cell_left">
        <x:with-param name="index" select="$index + 1" />
        <x:with-param name="column-count" select="$column-count" />
        <x:with-param name="display-align" select="$display-align" />
        <x:with-param name="value" select="$value" />
        <x:with-param name="ch" select="$ch" />
      </x:call-template>
    </x:if>
  </x:template>
</x:stylesheet>