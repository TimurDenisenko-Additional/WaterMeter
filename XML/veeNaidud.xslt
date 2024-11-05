<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        	<html>
                <head>
                    <link rel="stylesheet" href="style.css" />
                    <title>Vee näidud</title>
                </head>
                <body>
                    <table>
                        <thead>
                            <tr>
                                <th>Email</th>
                                <th>Aadress</th>
                                <th>Korterinumber</th>
                                <th>Kuupäev</th>
                                <th>Külm vesi</th>
                                <th>Soe vesi</th>
                                <th>Makstud</th>
                            </tr>
                        </thead>
                        <tbody>
                        <xsl:for-each select="veeNaidud/veeNaide">
                            <tr>
                                <td>
                                    <xsl:value-of select="@email" />
                                </td>
                                <td>
                                    <xsl:value-of select="aadress" />
                                </td>
                                <td>
                                    <xsl:value-of select="korterinumber" />
                                </td>
                                <td>
                                    <xsl:value-of select="kuupaev" />
                                </td>
                                <td>
                                    <xsl:value-of select="vesi/kulmVesi" />
                                </td>
                                <td>
                                    <xsl:value-of select="vesi/soeVesi" />
                                </td>
                                    <xsl:choose >
                                        <xsl:when test="makstud=1">
                                            <td style="color: green">
                                                Jah
                                            </td>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <td style="color: red">
                                                Ei
                                            </td>
                                        </xsl:otherwise>
                                    </xsl:choose>
                            </tr>
                        </xsl:for-each>
                        </tbody>
                    </table>
                </body>
                <footer>
                    Timur Denisenko 2024
                </footer>
            </html>
    </xsl:template>
</xsl:stylesheet>