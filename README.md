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

## Pubblicazione automatica

Il workflow [.github/workflows/pubblica-sito.yml](.github/workflows/pubblica-sito.yml) completa la fase di pubblicazione. A ogni aggiornamento del ramo `main`:

1. installa la dipendenza indicata in `requirements.txt`;
2. valida il file XML e rigenera la pagina HTML;
3. pubblica la cartella `site` tramite GitHub Pages.

Prima della prima pubblicazione occorre selezionare una sola volta **Settings > Pages > Source > GitHub Actions** nelle impostazioni della repository su GitHub.

