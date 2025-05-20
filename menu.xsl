<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" indent="yes"/>

    <xsl:template match="/">
        <nav>
            <ul>
                <xsl:for-each select="categorias/categoria">
                    <li>
                        <span>
                            <xsl:value-of select="@nombre"/>
                        </span>
                        <ul>
                            <xsl:for-each select="blog">
                                <li>
                                    <a href="{@url}">
                                        <xsl:value-of select="@nombre"/>
                                    </a>
                                </li>
                            </xsl:for-each>
                        </ul>
                    </li>
                </xsl:for-each>
            </ul>
        </nav>
    </xsl:template>

</xsl:stylesheet>