Alias: $serviceRequest_tm = http://hl7.it/fhir/StructureDefinition/ServiceRequestTeleassistenza

Profile: AppointmentTeleassistenza
Parent: Appointment
Id: AppointmentTeleassistenza
Description: "Profilo base del Appointment condiviso in tutti i documenti di Telemedicina"
* ^status = #draft
* identifier 1..
* identifier ^short = "Codice della prenotazione"
* identifier ^definition = "Elemento di tipo identifier contenente gli identificativi univoci della risorsa."

* serviceCategory ^short = "Categorizzazione del servizio erogato durante l'appuntamento."
* serviceCategory ^definition = "Categorizzazione del servizio erogato durante l'appuntamento."

* reasonCode ^short = "Motivo dell'appuntamento."
* reasonCode ^definition = "Elemento di tipo CodableConcept che contiene l'informazione per cui nasce l'Appointment."

* start ^short = "Data e ora di inizio dell'appuntamento."
* start ^definition = "Contiene la data dell'appuntamento."
* start ^comment = "Nota: questa opzione è destinata ai casi in cui è necessario osservare con precisione gli orari, tipicamente i log di sistema e così via, e non gli orari riferiti dall'uomo; per questi ultimi, vedere date e dateTime (che può essere preciso come un istante, ma non è necessario che lo sia). Il fuso orario è sempre richiesto"

* end ^short = "Data e ora di fine dell'appuntamento"
* end ^definition = "Data/ora in cui l'appuntamento si conclude.  Le date possono essere omesse in caso di status proposed o cancelled."
* end ^comment = "Nota: questa opzione è destinata ai casi in cui è necessario osservare con precisione gli orari, tipicamente i log di sistema e così via, e non gli orari riferiti dall'uomo; per questi ultimi, vedere date e dateTime (che può essere preciso come un istante, ma non è necessario che lo sia). Il fuso orario è sempre richiesto"

* created ^short = "Data di creazione dell'appuntamento."
* created ^definition = "Elemento di tipo dateTime che contiene la data di creazione iniziale dell'appuntamento"
* created ^comment = "Questa proprietà è necessaria per molti casi d'uso in cui l'età di un appuntamento viene considerata nell'elaborazione dei flussi di lavoro per la programmazione e la fatturazione degli appuntamenti."

* basedOn only Reference(ServiceRequestTeleassistenza)
* basedOn ^short = "La richiesta di servizio per la quale viene assegnato questo appuntamento"
* basedOn ^definition = "La richiesta di servizio per la quale è stato assegnato l'appuntamento (ad es. richiesta di referto o di procedura in arrivo)."
* basedOn ^comment = "I riferimenti DEVONO essere un riferimento a una risorsa FHIR effettiva e DEVONO essere risolvibili (consentendo il controllo dell'accesso, la temporanea indisponibilità, ecc.) La risoluzione può avvenire tramite recupero dall'URL o, se applicabile per tipo di risorsa, trattando un riferimento assoluto come un URL canonico e cercandolo in un registro/repository locale."

* participant ^short = "Partecipanti coinvolti nell'appuntamento."
* participant ^definition = "BackboneElement contenente la lista dei coinvolti nella visita (Patient e PractitionerRole)."

* participant.actor ^short = "Partecipanti all'appuntamento per la richiesta di televisita."
* participant.actor ^definition = "Contiene il riferimento ai Practitioner che prendono in carico la visita e al Patient oggetto della visita."
* participant.actor ^comment = "I riferimenti DEVONO essere un riferimento a una risorsa FHIR effettiva e DEVONO essere risolvibili (consentendo il controllo dell'accesso, la non disponibilità temporanea, ecc.) La risoluzione può avvenire tramite recupero dall'URL o, se applicabile per tipo di risorsa, trattando un riferimento assoluto come un URL canonico e cercandolo in un registro/repository locale."

* participant.status ^definition = "Stato di partecipazione."
* participant.status ^comment = "Si noti che le stringhe FHIR NON devono superare la dimensione di 1MB."