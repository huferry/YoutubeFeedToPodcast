<?xml version="1.0"?>
<xsl:stylesheet version="1.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:itunes="http://www.itunes.com/DTDs/Podcast-1.0.dtd" 
    xmlns:media="http://search.yahoo.com/mrss/"
    xmlns:atom="http://www.w3.org/2005/Atom">

    <xsl:output indent="yes" method="xml" omit-xml-declaration="yes"/>
    <xsl:template match="atom:feed">
        <xsl:element name="rss">
            <xsl:attribute name="version">2.0</xsl:attribute>
            <xsl:element name="channel">
                
                <xsl:element name="title">
                    <xsl:value-of select="atom:title"/>
                </xsl:element>

                <xsl:element name="description">
                    <xsl:value-of select="concat('Youtube Channel: ', atom:title, ' (', atom:link/@href, ')')"/>
                </xsl:element>

                <xsl:element name="itunes:author">
                    <xsl:value-of select="atom:author/atom:name"/>
                </xsl:element>

                <xsl:element name="itunes:image">
                    <xsl:attribute name="href">
                        <xsl:value-of select="atom:entry[1]/media:group/media:thumbnail/@url"/>
                    </xsl:attribute>
                </xsl:element>

                <xsl:element name="link">
                    <xsl:value-of select="atom:link/@href"/>
                </xsl:element>

                <xsl:element name="pubDate">
                    <xsl:value-of select="atom:published"/>
                </xsl:element>

                <xsl:apply-templates select="atom:entry"/>

            </xsl:element>
        </xsl:element>
    </xsl:template>

    <xsl:template match="atom:entry">
        <xsl:element name="item">
            <xsl:element name="title">
                <xsl:value-of select="atom:title"/>                
            </xsl:element>
            <xsl:element name="description">
                <xsl:value-of select="media:group/media:description"/>                
            </xsl:element>
            <xsl:element name="itunes:author">
                <xsl:value-of select="atom:author/atom:name"/>                
            </xsl:element>
            <xsl:element name="itunes:image">
                <xsl:attribute name="href">
                    <xsl:value-of select="media:group/media:thumbnail/@url"/>                
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="guid">
                <xsl:value-of select="atom:id"/>
            </xsl:element>
            <xsl:element name="pubDate">
                <xsl:value-of select="atom:published"/>
            </xsl:element>
            <xsl:element name="enclosure">
                <xsl:attribute name="url">
                    <xsl:value-of select="media:group/media:content/@url"/>
                </xsl:attribute>
                <xsl:attribute name="type">
                    <xsl:value-of select="media:group/media:content/@type"/>
                </xsl:attribute>
            </xsl:element>
        </xsl:element>
    </xsl:template>

</xsl:stylesheet>
