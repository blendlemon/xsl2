<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:media="http://search.yahoo.com/mrss/">

    <xsl:output method="html" indent="yes"/>

    <xsl:template match="/">
        <div class="posts">
            <xsl:for-each select="//item">
                <div class="post">
                    <h3>
                        <a href="{link}" target="_blank">
                            <xsl:value-of select="title"/>
                        </a>
                    </h3>
                    <xsl:if test="media:content/@url">
                        <img>
                            <xsl:attribute name="src">
                                <xsl:value-of select="media:content/@url"/>
                            </xsl:attribute>
                            <xsl:attribute name="alt">
                                <xsl:value-of select="title"/>
                            </xsl:attribute>
                            <xsl:attribute name="class">post-img</xsl:attribute>
                        </img>
                    </xsl:if>
                    <div class="descripcion">
                        <xsl:value-of select="description" disable-output-escaping="yes"/>
                    </div>
                    <small>
                        <xsl:value-of select="pubDate"/>
                    </small>
                </div>
            </xsl:for-each>
        </div>
    </xsl:template>

</xsl:stylesheet>