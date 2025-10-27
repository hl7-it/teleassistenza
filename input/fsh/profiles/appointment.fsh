Alias: $serviceRequest_tm = http://hl7.it/fhir/StructureDefinition/ServiceRequestTeleassistenza

Profile: AppointmentTeleassistenza
Parent: Appointment
Id: AppointmentTeleassistenza
Description: "Profilo del Appointment utilizzato nel contesto della Teleassistenza."
* ^status = #draft
* identifier 1..
* identifier ^short = "Codice della prenotazione"

* serviceCategory ^short = "Categorizzazione del servizio erogato durante l'appuntamento."

* reasonCode ^short = "Motivo dell'appuntamento."

* start ^short = "Data e ora di inizio dell'appuntamento."
* end ^short = "Data e ora di fine dell'appuntamento"

* created ^short = "Data di creazione dell'appuntamento."

* basedOn only Reference(ServiceRequestTeleassistenza)
* basedOn ^short = "La richiesta di servizio per la quale viene assegnato questo appuntamento"

* participant ^short = "Partecipanti coinvolti nell'appuntamento."
* participant.actor ^short = "Partecipanti all'appuntamento per la richiesta di televisita."
