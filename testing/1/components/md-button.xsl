<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="md-button">
    <button>
      <xsl:apply-templates select="@*|node()" />
    </button>
  </xsl:template>
</xsl:stylesheet>
