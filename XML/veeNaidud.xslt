<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <head>
                <link rel="stylesheet" href="style.css" />
                <link rel="stylesheet" href="title.css" />
                <title>Vee näidud</title>
            </head>
            <body>
                <div class="group" id="page-wrap">
                    <div id="inner-wrap">
                        <svg class="waves" xmlns="http://www.w3.org/2000/svg" width="1440" height="321.75" viewBox="0 0 960 214.5" preserveAspectRatio="xMinYMid meet">
                            <defs>
                                <linearGradient id="a">
                                <stop stop-color="#6439FF"/>
                                <stop offset="0.2" stop-color="#4F75FF"/>
                                <stop offset="0.4" stop-color="#00CCDD"/>
                                <stop offset="0.6" stop-color="#7CF5FF"/>
                                </linearGradient>
                                </defs>
                                <path fill="url(#a)" d="M2662.6 1S2532 41.2 2435 40.2c-19.6-.2-37.3-1.3-53.5-2.8 0 0-421.3-59.4-541-28.6-119.8 30.6-206.2 75.7-391 73.3-198.8-2-225.3-15-370.2-50-145-35-218 37-373.3 36-19.6 0-37.5-1-53.7-3 0 0-282.7-36-373.4-38C139 26 75 46-1 46v106c17-1.4 20-2.3 37.6-1.2 130.6 8.4 210 56.3 287 62.4 77 6 262-25 329.3-23.6 67 1.4 107 22.6 193 23.4 155 1.5 249-71 380-62.5 130 8.5 209 56.3 287 62.5 77 6 126-18 188-18 61.4 0 247-38 307.4-46 159.3-20 281.2 29 348.4 30 67 2 132.2 6 217.4 7 39.3 0 87-11 87-11V1z"/><path fill="#F2F5F5" d="M2663.6 73.2S2577 92 2529 89c-130.7-8.5-209.5-56.3-286.7-62.4s-125.7 18-188.3 18c-5 0-10-.4-14.5-.7-52-5-149.2-43-220.7-39-31.7 2-64 14-96.4 30-160.4 80-230.2-5.6-340.4-18-110-12-146.6 20-274 36S820.4 0 605.8 0C450.8 0 356 71 225.2 62.2 128 56 60.7 28-.3 11.2V104c22 7.3 46 14.2 70.4 16.7 110 12.3 147-19.3 275-35.5s350 39.8 369 43c27 4.3 59 8 94 10 13 .5 26 1 39 1 156 2 250-70.3 381-62 130.5 8.2 209.5 56.3 286.7 62 77 6.4 125.8-18 188.3-17.5 5 0 10 .2 14.3.6 52 5 145 49.5 220.7 38.2 32-5 64-15 96.6-31 160.5-79.4 230.3 6 340 18.4 110 12 146.3-20 273.7-36l15.5-2V73l1-.5z"/><g fill="none" stroke="#E2E9E9" stroke-width="1"><path d="M0 51.4c3.4.6 7.7 1.4 11 2.3 133.2 34 224.3 34 308.6 34 110.2 0 116.7 36.6 229.8 26 113-11 128.7-44 222-42.6C865 73 889 38 1002 27c113-10.8 119.6 25.6 229.8 25.6 84.4 0 175.4 0 308.6 34 133 34.2 277-73 379.4-84.3 204-22.5 283.6 128.7 283.6 128.7"/><path d="M0 6C115.7-6 198.3 76.6 308 76.6c109.6 0 131.8-20 223-28.3 114.3-10.2 238.2 0 238.2 0s124 10.2 238.3 0c91-8.2 113.2-28 223-28S1425 103 1541 91c115.8-11.8 153.3-69 269.3-84.6 116-15.5 198.4 71 308 71 109.8 0 131.8-20 223-28 114-10.2 237.7 0 237.7 0s37.4 2.4 82.8 3.7"/></g>
                            <h1 class="text">Vee näidud</h1>
                        </svg>
                    </div>
                </div>
                <div class="main-wrapper">
                    <div class="div-wrapper">
                        <div class="toggle-block">
                            <h2 class="search-title">Otsida</h2>
                        </div>
                        <div class="wrapper">
                            <form method="get" id="search-form">
                                <div class="button-container">
                                    <button type="button" class="toggle-input" data-target="email">E-posti järgi</button>
                                    <button type="button" class="toggle-input" data-target="aadress">Aadressi järgi</button>
                                    <button type="button" class="toggle-input" data-target="korterinumber">Korterinumbri järgi</button>
                                    <button type="button" class="toggle-input" data-target="kuupaev">Kuupäeva järgi</button>
                                </div>
                                <div class="button-container">
                                    <button type="button" class="toggle-input" data-target="kulmVesi">Külma vesi järgi</button>
                                    <button type="button" class="toggle-input" data-target="soeVesi">Soja vesi järgi</button>
                                    <button type="button" class="toggle-input" data-target="makstud">Makstud järgi</button>
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
                                <div class="input-container" id="kulmVesi-container">
                                    <label for="kulmVesi">Sisesta külm vesi:</label>
                                    <input type="number" id="kulmVesi" name="kulmVesi" placeholder="Näiteks: 123"/>
                                </div>
                                <div class="input-container" id="soeVesi-container">
                                    <label for="soeVesi">Sisesta soe vesi:</label>
                                    <input type="number" id="soeVesi" name="soeVesi" placeholder="Näiteks: 123"/>
                                </div>
                                <div class="input-container" id="makstud-container">
                                    <label for="makstud">Kas makstud:</label>
                                    <input type="text" id="makstud" name="makstud" placeholder="Näiteks: jah, trUE, 1, Ei, false"/>
                                </div>
                            <div id="submit-button-container"></div>
                            </form>
                        </div>
                    </div>

                    <div class="div-wrapper">
                        <div class="toggle-block"> 
                            <h2 class="import-title">Import</h2>
                        </div>
                        <div class="wrapper">
                            <form method="post" id="import-form" enctype="multipart/form-data">
                                <div id="importFile-container">
                                    <label for="importFile">Lisa JSON-fail:</label>
                                    <input type="file" id="importFile" name="importFile" accept="application/json"/>
                                    <input type="submit" id="importFileSubmit" name="importFileSubmit" value="Lae üle" />
                                </div>
                                <div id="import-button-container"></div>
                            </form>
                        </div>
                    </div>

                    <div class="div-wrapper">
                        <div class="toggle-block"> 
                            <h2 class="export-title">Eksport</h2>
                        </div>
                        <div class="wrapper">
                            <form method="get" id="export-form">
                                <div id="exportFile-container">
                                    <label for="exportFile">Lae alla andmed:</label>
                                    <input type="submit" id="exportFile" name="exportFile" value="Lae alla" />
                                </div>
                                <div id="export-button-container"></div>
                            </form>
                        </div>
                    </div>
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
                            <xsl:choose>
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
