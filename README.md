# Tesauro bilingue sulla governance dell'intelligenza artificiale

Progetto d'esame di Editoria Digitale per l'appello dell'11 settembre 2026.

L'obiettivo è progettare e documentare un workflow editoriale digitale riproducibile per la gestione di un tesauro bilingue inglese-italiano sulla governance dell'intelligenza artificiale. Il progetto dovrà consentire la pubblicazione online, la proposta motivata di aggiornamenti, la revisione editoriale e la tracciabilità delle modifiche.

## Struttura della repository

```text
data/        Dati sorgente del tesauro
schema/      Regole di validazione del formato dati
scripts/     Script di validazione e generazione
site/        Sorgenti e configurazione del sito web
relazione/   Relazione del progetto d'esame
```

## Modello dati

Il sorgente del tesauro è [data/tesauro.xml](data/tesauro.xml). È stato scelto XML perché è un formato testuale, portabile e indipendente dalla presentazione. Inoltre può essere validato con XSD e trasformato successivamente in HTML tramite XSLT.

Le 14 voci derivano dal foglio `test per studente` fornito dal docente. Ogni elemento `voce` riproduce direttamente le colonne del foglio: `ID`, `EN`, `IT (traduzione)`, `Definizione (EN)`, `BT (broader term)`, `NT (narrower term)`, `RT (related term)`, `UF (use for)` e `Source`.

Le relazioni seguono la terminologia introdotta nelle lezioni:

- `bt` (*broader term*): termine più generale;
- `nt` (*narrower term*): termine più specifico;
- `rt` (*related term*): termine associato.

L'elemento `uf` (*use for*) contiene una forma alternativa del termine. Quando una cella contiene più valori separati da punto e virgola, questi sono rappresentati con elementi XML ripetuti. Le celle indicate con `—` nel foglio sono omesse.

La struttura è descritta da [schema/tesauro.xsd](schema/tesauro.xsd), che stabilisce l'ordine degli elementi, quali sono obbligatori e quali possono essere ripetuti.

## Trasformazione da XML a HTML

Il foglio di stile [site/tesauro.xsl](site/tesauro.xsl) trasforma le voci XML in una pagina HTML. La trasformazione usa XSLT 1.0 e costrutti affrontati durante il corso: template, percorsi XPath, ordinamento, condizioni, cicli e applicazione dei template.

Lo script [scripts/genera_html.py](scripts/genera_html.py) esegue tre operazioni in sequenza:

1. carica `data/tesauro.xml`;
2. valida il documento con `schema/tesauro.xsd`;
3. applica `site/tesauro.xsl` e genera `site/index.html`.

Per installare la sola dipendenza richiesta ed eseguire la generazione:

```powershell
python -m pip install -r requirements.txt
python scripts/genera_html.py
```

La presentazione grafica è separata dalla struttura dei dati ed è definita in [site/style.css](site/style.css).

## Pubblicazione automatica

Il workflow [.github/workflows/pubblica-sito.yml](.github/workflows/pubblica-sito.yml) completa la fase di pubblicazione. A ogni aggiornamento del ramo `main`:

1. installa la dipendenza indicata in `requirements.txt`;
2. valida il file XML e rigenera la pagina HTML;
3. pubblica la cartella `site` tramite GitHub Pages.

Prima della prima pubblicazione occorre selezionare una sola volta **Settings > Pages > Source > GitHub Actions** nelle impostazioni della repository su GitHub.

## Stato

Il modello XML contiene le 14 voci fornite dal docente. La pagina HTML viene generata automaticamente mediante XSLT e mostra tutte le voci in ordine numerico di `ID`, usando le intestazioni del foglio originale.
