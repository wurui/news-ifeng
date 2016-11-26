<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:import href="mod.xsl" />
  <xsl:output method="html" doctype-public="" encoding="UTF-8"/>

  <xsl:template match="/root">
    <html>
      <head>
        <meta name="viewport" content="initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no"/>
        <title>news-ifeng Demo</title>
        <link rel="stylesheet" type="text/css" href="https://1.openxsl.com/js/require.js" />
        <link rel="stylesheet" type="text/css" href="https://1.openxsl.com/css/ea.css" />
        <link rel="stylesheet" type="text/css" href="asset/index.css" />
        <script src="https://1.openxsl.com/js/require.js"></script>

      </head>
      <body>
        <div class="layout">
          <xsl:call-template name="news-ifeng" />
        </div>
        <script><![CDATA[
          require.config({
          paths: {
          zepto: 'https://1.openxsl.com/js/zepto.min',
          mustache: 'https://1.openxsl.com/js/mustache',
          oxm:'http://oss.openxsl.com/oxm'
          }
          });
          require(['zepto','asset/index'],function(undefine,Mod){
          Mod && Mod.init && Mod.init($('.J_OXMod'));

          })
        ]]></script>
      </body>

    </html>
  </xsl:template>

</xsl:stylesheet>
