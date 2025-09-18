Profile: EncounterTeleassistenza
Parent: Encounter
Id: EncounterTeleassistenza
Description: "Profilo base dell'Encounter condiviso in tutti i documenti di Telemedicina"
* ^status = #draft

* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier contains codiceNosologico 1..1
* identifier[codiceNosologico].system = "http://hl7.it/fhir/televisita/sid/codiceNosologico" (exactly)

* status ^short = "Stato attuale dell'incontro."
* status ^definition = "Stato attuale dell'incontro. Possibili valori: planned | arrived | triaged | in-progress | onleave | finished | cancelled"

* class ^short = "Classificazione dell'incontro con il paziente."

* type ^short = "Disciplina specialistica ambulatoriale"
* type from ValueSet_specialita_PractitionerRole (required) 
* type MS

* priority ^short = "Priorità della richiesta."
* priority ^definition = "Priorità della richiesta."
* subject ^short = "Paziente coinvolto nell'incontro"
* subject only Reference(PatientTeleassistenza)
// * basedOn only Reference(ServiceRequestTelevisita) 
* basedOn ^short = "Richiesta che ha avviato la visita."
* basedOn ^definition = "La richiesta che questa visita soddisfa."

* participant ^short = "Altre figura tecnica coinvolte."
* participant ^definition = "BackboneElement contenente la lista dei coinvolti nella visita oltre al Patient."
* participant ^comment = "In partecipat.individual può essere inserito il riferimento al Practitioner o al PractitionerRole che prende in carico la visita."
* participant.individual only Reference(PractitionerTeleassistenza)

//* appointment only Reference(AppointmentTelevisita)
* appointment ^short = "Appuntamento da cui è partita l'incontro."
* appointment ^definition = "L'appuntamento da cui è partita l'incontro"

* period ^short = "Data e Ora di inizio e di fine dell'incontro."
* period ^comment = "Se non è (ancora) nota, la fine del Periodo può essere omessa."

* reasonReference ^short = "Motivo scatenante l'incontro."
* reasonReference only Reference(ProcedureTeleassistenza)

* serviceProvider ^short = "Organizzazione che eroga il il servizio"
* serviceProvider ^definition = "Elemento reference che contiene il riferimento alla struttura che eroga la visita, intesa come poliambulatorio"
* serviceProvider only Reference(OrganizationT1)



//Old extension
// * extension contains
//     actual-period named periodoEffettivo 0..1 and
//     planned-start-date named dataInizioPianificata 0..1 and
//     planned-end-date named dataFinePianificata 0..1 
// * extension[periodoEffettivo] ^short = "Periodo effettivo della visita"
// * extension[periodoEffettivo] ^definition = "Periodo temporale che rappresenta l'inizio e la fine effettiva della visita."
// * extension[dataInizioPianificata] ^short = "Data di inizio pianificata"
// * extension[dataInizioPianificata] ^definition = "Data e ora pianificate di inizio visita (es. data di ammissione)."
// * extension[dataFinePianificata] ^short = "Data di fine pianificata"
// * extension[dataFinePianificata] ^definition = "Data e ora pianificate di fine visita (es. data di dimissione)."