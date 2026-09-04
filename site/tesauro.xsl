<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="/">
    <html lang="it">
      <head>
        <meta charset="UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title>Tesauro bilingue sulla governance dell'IA</title>
        <link rel="stylesheet" href="style.css"/>
        <script src="filtri.js" defer="defer"></script>
      </head>
      <body>
        <header class="intestazione">
          <div class="contenitore">
            <p class="sopratitolo">Editoria Digitale</p>
            <h1>Tesauro bilingue sulla governance dell'IA</h1>
            <p class="introduzione">
              Termini inglesi, traduzioni italiane, definizioni e relazioni
              terminologiche ricavati dal sorgente XML.
            </p>
            <p class="azione-feedback">
              <a class="pulsante" href="https://github.com/Simone-impelliccieri/Editoria-Progetto/issues/new?template=proposta-modifica.yml">
                Proponi una modifica
              </a>
            </p>
          </div>
        </header>

        <main class="contenitore">
          <section class="filtri" aria-labelledby="titolo-filtri">
            <h2 id="titolo-filtri">Filtra le voci</h2>

            <div class="campi-filtri">
              <label>
                Lingua visualizzata
                <select id="filtro-lingua">
                  <option value="entrambe">Inglese e italiano</option>
                  <option value="en">Inglese</option>
                  <option value="it">Italiano</option>
                </select>
              </label>

              <label>
                Relazione
                <select id="filtro-relazione">
                  <option value="">Tutte</option>
                  <option value="bt">BT</option>
                  <option value="nt">NT</option>
                  <option value="rt">RT</option>
                  <option value="uf">UF</option>
                </select>
              </label>

              <label>
                Fonte o standard
                <select id="filtro-fonte">
                  <option value="">Tutti</option>
                  <option value="ai act">AI Act</option>
                  <option value="nist">NIST</option>
                </select>
              </label>
            </div>
          </section>

          <xsl:apply-templates select="tesauro/voce">
            <xsl:sort select="@id" data-type="number"/>
          </xsl:apply-templates>
        </main>

        <footer class="pie-di-pagina">
          <div class="contenitore">
            <p>Pagina generata automaticamente da XML mediante XSLT.</p>
          </div>
        </footer>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="voce">
    <article class="voce">
      <p class="identificatore">ID <xsl:value-of select="@id"/></p>
      <p class="etichetta-campo lingua-en">EN</p>
      <h2 class="lingua-en" lang="en"><xsl:value-of select="termineEN"/></h2>
      <p class="traduzione lingua-it" lang="it">
        <span>IT (traduzione)</span><xsl:text>: </xsl:text>
        <xsl:value-of select="traduzioneIT"/>
      </p>

      <section class="lingua-en">
        <h3>Definizione (EN)</h3>
        <p lang="en"><xsl:value-of select="definizioneEN"/></p>
      </section>

      <section>
        <h3>Relazioni terminologiche</h3>

        <xsl:if test="bt">
          <div class="gruppo-relazioni relazione-bt">
            <p class="etichetta">BT (broader term)</p>
            <ul>
              <xsl:for-each select="bt">
                <li><xsl:value-of select="."/></li>
              </xsl:for-each>
            </ul>
          </div>
        </xsl:if>

        <xsl:if test="nt">
          <div class="gruppo-relazioni relazione-nt">
            <p class="etichetta">NT (narrower term)</p>
            <ul>
              <xsl:for-each select="nt">
                <li><xsl:value-of select="."/></li>
              </xsl:for-each>
            </ul>
          </div>
        </xsl:if>

        <xsl:if test="rt">
          <div class="gruppo-relazioni relazione-rt">
            <p class="etichetta">RT (related term)</p>
            <ul>
              <xsl:for-each select="rt">
                <li><xsl:value-of select="."/></li>
              </xsl:for-each>
            </ul>
          </div>
        </xsl:if>

        <xsl:if test="uf">
          <div class="gruppo-relazioni relazione-uf">
            <p class="etichetta">UF (use for)</p>
            <ul>
              <xsl:for-each select="uf">
                <li><xsl:value-of select="."/></li>
              </xsl:for-each>
            </ul>
          </div>
        </xsl:if>
      </section>

      <section class="fonti">
        <h3>Source</h3>
        <ul>
          <xsl:for-each select="fonte">
            <li><xsl:value-of select="."/></li>
          </xsl:for-each>
        </ul>
      </section>
    </article>
  </xsl:template>

</xsl:stylesheet>
