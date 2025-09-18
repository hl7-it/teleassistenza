Profile: ProcedureTeleassistenza
Parent: Procedure
Id: ProcedureTeleassistenza
Description:  "Profilo base della Procedure condiviso in tutti i documenti di Telemedicina"

* ^status = #draft
* extension contains http://hl7.org/fhir/StructureDefinition/procedure-method|5.2.0 named ModalitaEsecuzioneProcedura 0..1
* extension[ModalitaEsecuzioneProcedura] ^short = "Modalità esecuzione procedura operativa"

* basedOn ^short = "Richiesta su cui si basa questa procedura."
* basedOn ^definition = "Riferimento alla risorsa ServiceRequest che contiene i dettagli della richiesta su cui si basa questa procedura di erogazione."
* basedOn ^comment = "I riferimenti DEVONO essere un riferimento a una risorsa FHIR effettiva e DEVONO essere risolvibili (consentendo il controllo dell'accesso, la temporanea indisponibilità, ecc.) La risoluzione può avvenire tramite recupero dall'URL o, se applicabile per tipo di risorsa, trattando un riferimento assoluto come un URL canonico e cercandolo in un registro/repository locale."

* partOf only Reference(Procedure or ObservationTeleassistenza)

* status ^definition = "Stato della procedura."
* status ^comment = "Il codice \"unknown\" non deve essere utilizzato per comunicare altri stati.  Il codice \"unknown\" deve essere usato quando si applica uno degli stati, ma il sistema autore non conosce lo stato attuale della procedura.\n\nQuesto elemento è etichettato come modificatore perché lo stato contiene codici che contrassegnano la risorsa come non valida al momento."

* code 1..
* code MS
* code.coding.display MS
* code.coding.code MS
* code ^short = "Codice della prestazione eseguita"
* code ^definition = "CodeableConcept che contiene i codici identificativi delle tipologie di interventi, come ad esempio i codici ICD9 supportati dallo standard FHIR"
* code from VsCatalogoNazionalePrestazioni (required)

* subject only Reference(PatientTeleassistenza)
* subject ^short = "Paziente coinvolto nella procedura."
* subject ^definition = "Su chi è stata eseguita la procedura."

* performed[x] MS
* performed[x] 1..
* performed[x] only Period
* performed[x] ^short = "Data e ora di esecuzione della procedura."
* performed[x] ^definition = "Contiene la data di esecuzione dell'intervento"

* recorder ^short = "Chi ha registrato la procedura."
* recorder ^definition = "Persona che ha registrato la registrazione e si assume la responsabilità del suo contenuto."

* performer ^short = "Persone che hanno eseguito la procedura."
* performer ^definition = "Elemento ripetibile contenente i riferimenti a chi prende parte alla procedura di intervento e alle tipologie di performance offerte durante la procedure."
* performer.actor only Reference(PractitionerTeleassistenza or PractitionerRoleTeleassistenza or OrganizationT1 or Patient)

* outcome ^short = "Parametri rilevanti al fine di caratterizzare la procedura."
* outcome ^definition = "Elemento utilizzato per gestire la relazione del professionista generata al termine dell'erogazione"
* outcome ^comment = "Se il risultato contiene solo testo narrativo, può essere catturato usando il CodeableConcept.text."

* outcome.text ^short = "Testo libero per la relazione alla fine della procedura."
* outcome.text ^definition = "Una rappresentazione in linguaggio umano del concetto visto/selezionato/pronunciato dall'utente che ha inserito i dati e/o che rappresenta il significato inteso dall'utente.\nCampo disponibile per la relazione nel caso di Teleconsulto oppure Teleassistenza."

* usedReference ^short = "Strumentazione utilizzata nel corso della procedura."
//* usedReference only Reference(DeviceTelemedicinaTesserino)

* category ^short = "Procedura operativa eseguita."
* category MS
* category.coding.display MS
* category.coding.code MS

* note ^short = "Note"