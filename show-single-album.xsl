<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" />

    <xsl:key name="artists" match="artist" use="." />

    <xsl:template match="/music">
        <html>
            <head>
                <title>Single album</title>
                <style type="text/css">
                html { font: 12px sans-serif; color: #333; }
                body { max-width: 700px; margin: 2em auto; }
                h1 { font-size: 2em; margin: 1.2em 0; }
                h2 { font-size: 1.6em; margin: 1.2em 0 0.5em; color: #444; }
                h3 { font-size: 1.3em; margin: 0.5em 0; color: #444; }
                h4 { font-size: 1em; margin: 0.5em 0; color: #444; }
                p, ul { font-size: 1em; margin: 0.5em 0; }
                ul { padding-left: 1.8em; }
                .tracks li { margin: 0.8em 0; }
                </style>
            </head>
            <body>
                <xsl:apply-templates select="compilation[@id = 'album0002']" />
            </body>
        </html>
    </xsl:template>

    <xsl:template match="compilation">
        <h1><xsl:value-of select="artist" /> - <xsl:value-of select="name" /></h1>
        <p>Media: <xsl:value-of select="@media" /></p>
        <p>Genre: <xsl:value-of select="genre" /></p>
        <p>Released: <xsl:value-of select="year" /></p>
        <p>Format: <xsl:value-of select="format" /></p>
        <p>Purchased: <xsl:value-of select="purchased" /> (<xsl:value-of select="purchased/@place" />)</p>
        <h2>Tracks</h2>
        <ul class="tracks">
            <xsl:for-each select="tracks/track">
                <li>
                    <p><xsl:value-of select="." /></p>
                    <xsl:if test="@artist">
                        <p>by <strong><xsl:value-of select="@artist" /></strong></p>
                    </xsl:if>
                </li>
            </xsl:for-each>
        </ul>
        <h2>Copies</h2>
        <xsl:choose>
            <xsl:when test="copies/copy">
                <ul class="copies">
                    <xsl:for-each select="copies/copy">
                        <li><p><xsl:value-of select="." /> (<xsl:value-of select="@media" />) @ <xsl:value-of select="@date" /></p></li>
                    </xsl:for-each>
                </ul>
            </xsl:when>
            <xsl:otherwise>
                <p>No copies made</p>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

</xsl:stylesheet>
