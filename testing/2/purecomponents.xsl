<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template name="Component">
    <xsl:param name="content" />
    <xsl:param name="children" />
    <xsl:copy-of select="$content" />
    <children-ref><xsl:copy-of select="$children" /></children-ref>
    <script>var s = document.currentScript, p = s.parentElement, x = p.getElementsByTagName('children-ref')[0]; for (var c of p.getElementsByTagName('children')) c.outerHTML = x.innerHTML; p.removeChild(s); p.removeChild(x)</script>
  </xsl:template>

  <!-- Components -->
  <xsl:template match="md-button|Heading">
    <xsl:variable name="node" select="node()" />
    <xsl:variable name="name" select="name()" />
    <xsl:variable name="props" select="@*" />
    <xsl:for-each select="//components/*">
      <xsl:choose>
        <xsl:when test="$name = name()">
          <xsl:copy>
            <xsl:apply-templates select="$props" />
            <xsl:call-template name="Component">
              <xsl:with-param name="content" select="node()" />
              <xsl:with-param name="children" select="$node" />
            </xsl:call-template>
          </xsl:copy>
        </xsl:when>
      </xsl:choose>
    </xsl:for-each>
  </xsl:template>

  <xsl:template match="components" />
  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()" />
    </xsl:copy>
  </xsl:template>
</xsl:stylesheet>
