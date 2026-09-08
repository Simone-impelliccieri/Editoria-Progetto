# Tesauro bilingue sulla governance dell'intelligenza artificiale

Progetto d'esame di Editoria Digitale.

## Sito pubblicato

Il tesauro è consultabile su [GitHub Pages](https://simone-impelliccieri.github.io/Editoria-Progetto/).

## Struttura della repository

```text
data/        Dati sorgente del tesauro
schema/      Regole di validazione del formato dati
scripts/     Script di validazione e generazione
site/        Sorgenti e configurazione del sito web
relazione/   Relazione del progetto d'esame
```

## Consegne dell'Esercizio d'Esame

1. **Formato Sorgente.** XML, con struttura vincolata da uno schema XSD. Il
   formato è stato scelto perché rappresenta bene dati gerarchici e permettere di ripetere elementi. Rispetto a JSON offre in
   più l'integrazione diretta con XSD per la validazione e con XSLT per la
   trasformazione.
   [`data/tesauro.xml`](data/tesauro.xml),
   [`schema/tesauro.xsd`](schema/tesauro.xsd).

2. **Workflow di Pubblicazione.** Pubblicazione automatica su GitHub Pages  a ogni push su `main`. [`.github/workflows/pubblica-sito.yml`](.github/workflows/  pubblica-sito.yml), [`scripts/genera_html.py`](scripts/genera_html.py).

3. **Raccolta Feedback.** Le proposte di aggiornamento arrivano come Issue
   pubbliche compilate attraverso il modulo "Proposta di modifica", che ha
   quattro campi tutti obbligatori: termine, dettagli della voce, motivazione e
   fonti.[`.github/ISSUE_TEMPLATE/`](.github/ISSUE_TEMPLATE/).

4. **Flusso Editoriale.** Il processo distingue due ruoli, l'utente che propone
   e l'editor che gestisce la repository. L'esito
   della valutazione può essere **approvata**, **da rivedere** o
   **rifiutata**  e viene pubblicato come commento pubblico relativo alla issue.

5. **Versionamento e Storico.** Ogni
   proposta approvata è registrata in un commit con il numero dell'Issue e i file modificati.

6. **Visualizzazione.** Il progetto fornisce un interfaccia funzionante. La pagina consente di filtrare
   le voci.
   [`site/tesauro.xsl`](site/tesauro.xsl),
   [`site/style.css`](site/style.css), [`site/filtri.js`](site/filtri.js).

![Vista filtrata per lingua italiana e relazione NT](relazione/sito-filtri.png)

## Istruzioni per la Riproduzione del Flusso

La repository contiene tutti i materiali necessari a riprodurre il flusso di
produzione documentale.

### Prerequisiti

Python 3.13 e Git e `lxml`, dichiarata in
[`requirements.txt`](requirements.txt).

### 1. Ottenere la repository

```text
git clone https://github.com/Simone-impelliccieri/Editoria-Progetto.git
cd Editoria-Progetto
```

### 2. Installare le dipendenze

```text
python -m pip install -r requirements.txt
```

### 3. Validare i dati e generare la pagina

```text
python scripts/genera_html.py
```

Lo script esegue la lettura di `data/tesauro.xml`, lettura di
`schema/tesauro.xsd`, validazione del documento XML, applicazione di
`site/tesauro.xsl` e scrittura di `site/index.html`.

### 4. Riprodurre il ciclo editoriale

1. Aprire una Issue dal pulsante "Proponi una modifica" della pagina pubblicata.
2. Valutare la proposta e pubblicare l'esito come commento sull'Issue,
   spiegandone il motivo.
3. Se l'esito è "da rivedere", chi ha proposto corregge l'Issue e la valutazione
   viene ripetuta.
4. Se la proposta è approvata  aggiungere
   la nuova `<voce>` in `data/tesauro.xml` con il giusto ID. Rilanciare poi lo script di rigenerazione per 
   verificare la validità dei dati prima del push.
5. Registrare la modifica con un commit che richiami il numero dell'Issue ed eseguire il push.
6. Il push avvia il workflow, che rivalida i dati, rigenera l'HTML e aggiorna il
   sito pubblicato.

### 5. Ricostruire la relazione

La relazione è scritta in Markdown e convertita in PDF con Pandoc:

```text
pandoc relazione.md -o relazione.pdf --citeproc -F mermaid-filter
```

Il filtro `mermaid-filter` serve a generare i diagrammi e
`--citeproc` elabora la bibliografia `bibliografia.bib` seguendo lo
stile `IEEE.csl`.
