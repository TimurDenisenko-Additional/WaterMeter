<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        	<html>
                <head>
                    <link rel="stylesheet" href="style.css" />
                    <title>Vee näidud</title>
                </head>
                <body>
                    <div class="search-wrapper">
                        <h2 class="search-title">Otsida</h2>
                        <form method="get" id="search-form">
                            <div class="button-container">
                                <button type="button" class="toggle-input" data-target="email">E-posti järgi</button>
                                <button type="button" class="toggle-input" data-target="aadress">Aadressi järgi</button>
                                <button type="button" class="toggle-input" data-target="korterinumber">Korterinumbri järgi</button>
                                <button type="button" class="toggle-input" data-target="kuupaev">Kuupäeva järgi</button>
                            </div>
                            <div class="input-container" id="email-container">
                                <label for="email">Sisesta e-post:</label>
                                <input type="text" id="email" name="email" placeholder="Näiteks: kasutaja@example.com" />
                            </div>
                            <div class="input-container" id="aadress-container">
                                <label for="aadress">Sisesta aadress:</label>
                                <input type="text" id="aadress" name="aadress" placeholder="Näiteks: Tallinn, Vabaduse väljak 1" />
                            </div>
                            <div class="input-container" id="korterinumber-container">
                                <label for="korterinumber">Sisesta korterinumber:</label>
                                <input type="number" id="korterinumber" name="korterinumber" placeholder="Näiteks: 123" />
                            </div>
                            <div class="input-container" id="kuupaev-container">
                                <label for="kuupaev">Sisesta kuupäev:</label>
                                <input type="date" id="kuupaev" name="kuupaev" />
                            </div>
                            <div id="submit-button-container"></div>
                        </form>
                    </div>
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
                    <script src="script.js"></script>
                </body>
                <footer>
                    Timur Denisenko 2024
                </footer>
            </html>
    </xsl:template>
</xsl:stylesheet>