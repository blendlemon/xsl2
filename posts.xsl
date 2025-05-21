<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:media="http://search.yahoo.com/mrss/"
    xmlns:content="http://purl.org/rss/1.0/modules/content/">

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
                    <xsl:choose>
                        <xsl:when test="media:content/@url">
                            <img src="{media:content/@url}" alt="{title}" class="post-img"/>
                        </xsl:when>
                        <xsl:when test="enclosure[@type='image/jpeg' or @type='image/png' or @type='image/gif']/@url">
                            <img src="{enclosure/@url}" alt="{title}" class="post-img"/>
                        </xsl:when>
                        <xsl:when test="content:encoded and contains(content:encoded, '&lt;img')">
                            <xsl:variable name="imgTag" select="substring-after(content:encoded, '&lt;img')"/>
                            <xsl:variable name="srcAttr" select="substring-after($imgTag, 'src=&quot;')"/>
                            <xsl:variable name="srcUrl" select="substring-before($srcAttr, '&quot;')"/>
                            <img src="{$srcUrl}" alt="{title}" class="post-img"/>
                        </xsl:when>
                        <xsl:when test="description and contains(description, '&lt;img')">
                            <xsl:variable name="imgTag" select="substring-after(description, '&lt;img')"/>
                            <xsl:variable name="srcAttr" select="substring-after($imgTag, 'src=&quot;')"/>
                            <xsl:variable name="srcUrl" select="substring-before($srcAttr, '&quot;')"/>
                            <img src="{$srcUrl}" alt="{title}" class="post-img"/>
                        </xsl:when>
                    </xsl:choose>
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