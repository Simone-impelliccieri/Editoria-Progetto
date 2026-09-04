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
      <p class="etichetta-campo">EN</p>
      <h2 lang="en"><xsl:value-of select="termineEN"/></h2>
      <p class="traduzione" lang="it">
        <span>IT (traduzione)</span><xsl:text>: </xsl:text>
        <xsl:value-of select="traduzioneIT"/>
      </p>

      <section>
        <h3>Definizione (EN)</h3>
        <p lang="en"><xsl:value-of select="definizioneEN"/></p>
      </section>

      <section>
        <h3>Relazioni terminologiche</h3>

        <xsl:if test="bt">
          <div class="gruppo-relazioni">
            <p class="etichetta">BT (broader term)</p>
            <ul>
              <xsl:for-each select="bt">
                <li><xsl:value-of select="."/></li>
              </xsl:for-each>
            </ul>
          </div>
        </xsl:if>

        <xsl:if test="nt">
          <div class="gruppo-relazioni">
            <p class="etichetta">NT (narrower term)</p>
            <ul>
              <xsl:for-each select="nt">
                <li><xsl:value-of select="."/></li>
              </xsl:for-each>
            </ul>
          </div>
        </xsl:if>

        <xsl:if test="rt">
          <div class="gruppo-relazioni">
            <p class="etichetta">RT (related term)</p>
            <ul>
              <xsl:for-each select="rt">
                <li><xsl:value-of select="."/></li>
              </xsl:for-each>
            </ul>
          </div>
        </xsl:if>

        <xsl:if test="uf">
          <div class="gruppo-relazioni">
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
