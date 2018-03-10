<html xsl:version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" class="no-js">

<xsl:variable name="shadow.medium" select="'0px 1px 5px 0px rgba(0, 0, 0, 0.2), 0px 2px 2px 0px rgba(0, 0, 0, 0.14), 0px 3px 1px -2px rgba(0, 0, 0, 0.12)'" />
<xsl:variable name="shadow.large" select="'0px 5px 5px -3px rgba(0, 0, 0, 0.2), 0px 8px 10px 1px rgba(0, 0, 0, 0.14), 0px 3px 14px 2px rgba(0, 0, 0, 0.12)'" />
<xsl:variable name="transitions.ease" select="'250ms cubic-bezier(0.4, 0, 0.2, 1) 0ms'" />

<head>
  <script>
    document.head.removeChild(document.currentScript)
    document.documentElement.classList.remove('no-js')
    document.documentElement.classList.add('js')
  </script>

  <xsl:comment> Initial meta tags </xsl:comment>
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <meta property="og:locale" content="en_US" />

  <xsl:if test="root/html">
    <xsl:comment> Page config </xsl:comment>
    <xsl:if test="root/page">
      <xsl:if test="root/page/title">
        <title><xsl:value-of select="root/page/title" /></title>
        <meta property="og:title"><xsl:attribute name="content"><xsl:value-of select="root/page/title" /></xsl:attribute></meta>
      </xsl:if>
      <xsl:if test="root/page/favicon">
        <link rel="shortcut icon"><xsl:attribute name="href"><xsl:value-of select="root/page/favicon" /></xsl:attribute></link>
      </xsl:if>
      <xsl:if test="root/page/description">
        <script type="application/ld+json">{"description":"<xsl:value-of select="root/page/description" />","@type":"WebPage"}</script>
        <meta name="description"><xsl:attribute name="content"><xsl:value-of select="root/page/description" /></xsl:attribute></meta>
        <meta property="og:description"><xsl:attribute name="content"><xsl:value-of select="root/page/description" /></xsl:attribute></meta>
      </xsl:if>
    </xsl:if>

    <xsl:comment> Head root </xsl:comment>
    <xsl:if test="root/html/head">
      <xsl:copy-of select="root/html/head" />
    </xsl:if>

    <xsl:comment> Styled components </xsl:comment>
    <style component="button">
      <xsl:variable name="inset" select="'inset 0 0 0 99999px rgba'" />
      md-button {
        position: relative;
        display: inline-block;
        padding: 8px 16px;
        min-width: 88px;
        font-size: 0.875rem;
        box-sizing: border-box;
        min-height: 36px;
        transition: background-color <xsl:value-of select="$transitions.ease" />, box-shadow <xsl:value-of select="$transitions.ease" />;
        line-height: 1.4em;
        text-align: center;
        font-family: "Roboto", "Helvetica", "Arial", sans-serif;
        font-weight: 500;
        border-radius: 2px;
        text-transform: uppercase;
        color: rgba(0, 0, 0, 0.87);
        border: 0;
        cursor: pointer;
        outline: none;
        margin: 5px;
        user-select: none;
      }

      /**
       * Sizes
       */
      md-button[size^="small"] {
        padding: 7px 8px;
        min-width: 64px;
        font-size: 0.8125rem;
        min-height: 32px;
      }

      md-button[size^="large"] {
        padding: 8px 24px;
        min-width: 112px;
        font-size: 0.9375rem;
        min-height: 24px;
      }

      /**
       * Raised
       */
      md-button[variant^="raised"] {
        box-shadow: <xsl:value-of select="$inset" />(0,0,0,0), <xsl:value-of select="$shadow.medium" />;
        color: rgba(0, 0, 0, 0.87);
      }

      md-button[variant^="raised"]:hover {
        box-shadow: <xsl:value-of select="$inset" />(0,0,0,0.2), <xsl:value-of select="$shadow.medium" />;
      }

      md-button[variant^="raised"]:active {
        box-shadow: <xsl:value-of select="$inset" />(0,0,0,0.3), <xsl:value-of select="$shadow.large" />
      }

      /**
       * Non-raised
       */
      md-button:not([variant^="raised"]) {
        color: rgba(0, 0, 0, 0.87)
      }

      md-button:not([variant^="raised"]):before {
        content: '';
        display: block;
        top: 0;
        left: 0;
        position: absolute;
        transition: background-color <xsl:value-of select="$transitions.ease" />;
        height: 100%;
        border-radius: 2px;
        opacity: 0.15;
        width: 100%;
        z-index: -1;
      }

      md-button:not([variant^="raised"]):active:before {
        opacity: 0.2;
      }

      md-button:not([variant^="raised"]) {
        color: rgba(0, 0, 0, 0.87)
      }

      /**
       * Colors
       */
      md-button[variant^="raised"] {
        background-color: <xsl:choose><xsl:when test="root/colors/default"><xsl:value-of select="root/colors/default" /></xsl:when><xsl:otherwise>#E0E0E0</xsl:otherwise></xsl:choose>;
      }

      md-button:not([variant^="raised"]):hover:before {
        background-color: #000
      }

      md-button[variant^="raised"][color^="primary"],
      md-button:not([variant^="raised"])[color^="primary"]:hover:before {
        color: #fff;
        background-color: <xsl:choose><xsl:when test="root/colors/primary"><xsl:value-of select="root/colors/primary" /></xsl:when><xsl:otherwise>#2196F3</xsl:otherwise></xsl:choose>
      }

      md-button[variant^="raised"][color^="secondary"],
      md-button:not([variant^="raised"])[color^="secondary"]:hover:before {
        color: #fff;
        background-color: <xsl:choose><xsl:when test="root/colors/secondary"><xsl:value-of select="root/colors/secondary" /></xsl:when><xsl:otherwise>#E10050</xsl:otherwise></xsl:choose>
      }

      md-button:not([variant^="raised"])[color^="primary"] {
        color: <xsl:choose><xsl:when test="root/colors/primary"><xsl:value-of select="root/colors/primary" /></xsl:when><xsl:otherwise>#2196F3</xsl:otherwise></xsl:choose>
      }

      md-button:not([variant^="raised"])[color^="secondary"] {
        color: <xsl:choose><xsl:when test="root/colors/secondary"><xsl:value-of select="root/colors/secondary" /></xsl:when><xsl:otherwise>#E10050</xsl:otherwise></xsl:choose>
      }

      /**
       * Overrides
       */
      md-button[disabled] {
        background-color: rgba(0, 0, 0, 0.12) !important;
        color: rgba(0, 0, 0, 0.26) !important;
        pointer-events: none !important;
        box-shadow: none !important;
      }

    </style>
  </xsl:if>
</head>

<body>
  <xsl:choose>
    <xsl:when test="root/html/body">
      <xsl:copy-of select="root/html/body" />
    </xsl:when>
    <xsl:otherwise test="root/html">
      <xsl:copy-of select="root/html" />
    </xsl:otherwise>
  </xsl:choose>
</body>

</html>
