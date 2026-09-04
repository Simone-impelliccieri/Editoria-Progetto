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

## Generazione del sito

Per installare le dipendenze e generare la pagina HTML:

```text
python -m pip install -r requirements.txt
python scripts/genera_html.py
```

## Relazione

La relazione del progetto si trova in [`relazione/relazione.md`](relazione/relazione.md).
