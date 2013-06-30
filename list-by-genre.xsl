<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" />

    <xsl:key name="genres" match="genre" use="." />

    <xsl:template match="/music">
        <html>
            <head>
                <title>List by genre</title>
                <style type="text/css">
                html { font: 12px sans-serif; color: #333; }
                body { max-width: 700px; margin: 2em auto; }
                h1 { font-size: 2em; margin: 1.2em 0; }
                h2 { font-size: 1.6em; margin: 1.2em 0 0.5em; color: #444; }
                h3 { font-size: 1.3em; margin: 0.5em 0; color: #444; }
                h4 { font-size: 1em; margin: 0.5em 0; color: #444; }
                p, ul { font-size: 1em; margin: 0.5em 0; }
                ul { padding-left: 1.8em; }
                .album { width: 100%; background: #fafafa; border-top: 1px dotted #aaa; padding: .5em 1.5em; margin-left: -1.5em; }
                .album:last-child { border-bottom: 1px dotted #aaa; }
                </style>
            </head>
            <body>
                <h1>List by genre</h1>
                <xsl:apply-templates select="compilation/genre[generate-id() = generate-id(key('genres', .)[1])]">
                    <xsl:sort select="." />
                </xsl:apply-templates>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="genre">
        <xsl:variable name="current-genre" select="." />
        <div class="genre">
            <h2><xsl:value-of select="$current-genre" /></h2>
            <xsl:for-each select="key('genres', $current-genre)">
                <xsl:sort select="../artist" />
                <xsl:sort select="../year" data-type="number" order="descending" />
                <div class="album">
                    <h3><xsl:value-of select="../artist" /> - <xsl:value-of select="../name" /></h3>
                    <p>Genre: <xsl:value-of select="../genre" /></p>
                    <p>Released: <xsl:value-of select="../year" /></p>
                    <p>Tracks: <xsl:value-of select="count(../tracks/track)" /></p>
                    <h4>Copies</h4>
                    <xsl:choose>
                        <xsl:when test="../copies/copy">
                            <ul>
                                <xsl:for-each select="../copies/copy">
                                    <li><xsl:value-of select="." /> @ <xsl:value-of select="@date" /></li>
                                </xsl:for-each>
                            </ul>
                        </xsl:when>
                        <xsl:otherwise>
                            <p>No copies made</p>
                        </xsl:otherwise>
                    </xsl:choose>
                </div>
            </xsl:for-each>
        </div>
    </xsl:template>

</xsl:stylesheet>
