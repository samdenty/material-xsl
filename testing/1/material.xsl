<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="Heading">
    <h1 component="{name()}">
      <xsl:apply-templates select="@*" />
      <div>
        <xsl:apply-templates />
      </div>
    </h1>
    <script>component('<xsl:value-of select="name()" />', document.currentScript)</script>
  </xsl:template>

  <xsl:template match="html">
    <html github.com="" samdenty99="">
      <xsl:apply-templates select="@*|node()" />
    </html>
  </xsl:template>

  <!-- Components -->
  <xsl:include href="./components/md-button.xsl" />

  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()" />
    </xsl:copy>
  </xsl:template>
</xsl:stylesheet>
