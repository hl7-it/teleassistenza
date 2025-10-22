Profile: EncounterTeleassistenza
Parent: Encounter
Id: EncounterTeleassistenza
Description: "Profilo base dell'Encounter nel contesto della Teleassistenza"
* ^status = #draft

* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier contains codiceNosologico 1..1
* identifier[codiceNosologico].system = "http://hl7.it/fhir/televisita/sid/codiceNosologico" (exactly)

* status ^short = "Stato attuale dell'incontro."

* class ^short = "Provenienza."

* type ^short = "Disciplina specialistica ambulatoriale"
* type from ValueSet_specialita_PractitionerRole (required) 
* type MS

* priority ^short = "Priorità della richiesta."

* subject ^short = "Paziente coinvolto nell'incontro"
* subject only Reference(PatientTeleassistenza)

* basedOn only Reference(ServiceRequestTeleassistenza) 
* basedOn ^short = "Richiesta che ha avviato la teleassistenza."

* participant ^short = "Altre figura tecnica coinvolte."
* participant.individual only Reference(PractitionerTeleassistenza)

* appointment only Reference(AppointmentTeleassistenza)
* appointment ^short = "Appuntamento da cui è partita l'incontro."

* period ^short = "Data e Ora di inizio e di fine dell'incontro."

* reasonReference ^short = "Motivo scatenante l'incontro."
* reasonReference only Reference(ProcedureTeleassistenza)

* serviceProvider ^short = "Organizzazione che eroga il il servizio"
* serviceProvider only Reference(OrganizationT1)
