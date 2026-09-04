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

## Raccolta del feedback

Dal sito è possibile selezionare **Proponi una modifica** e aprire una Issue su GitHub. Il modulo richiede obbligatoriamente:

- il termine da aggiungere;
- i dettagli della nuova voce;
- la motivazione;
- le fonti di supporto.

La richiesta viene registrata pubblicamente senza modificare direttamente il tesauro. L'utente non deve scegliere l'ID: per la prima nuova voce approvata l'editor assegnerà l'ID `22`, proseguendo poi in ordine crescente. Il modulo è definito in `.github/ISSUE_TEMPLATE/proposta-modifica.yml`.

## Flusso editoriale

I ruoli previsti sono due:

- il **proponente**, che apre la Issue e fornisce motivazione e fonti;
- l'**editor**, che controlla la proposta e decide se accettarla.

L'editor verifica che la richiesta sia completa, che le fonti siano attendibili e che la modifica sia coerente con la struttura del tesauro. Pubblica poi nella Issue una delle seguenti decisioni, accompagnata dalla motivazione:

- **Approvata**: la modifica può essere inserita nel tesauro;
- **Da rivedere**: servono correzioni, chiarimenti o altre fonti e la Issue rimane aperta;
- **Rifiutata**: la proposta non viene inserita e la Issue viene chiusa.

Per una proposta approvata viene creato un branch, viene modificato `data/tesauro.xml` e viene aperta una Pull Request che cita la Issue. Il modello `.github/PULL_REQUEST_TEMPLATE.md` ricorda i controlli da eseguire. Dopo l'approvazione della Pull Request, l'integrazione nel ramo `main` avvia la pubblicazione automatica del sito; a pubblicazione conclusa, la Issue viene chiusa.
