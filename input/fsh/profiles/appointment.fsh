Profile: AppointmentTeleassistenza
Parent: Appointment
Id: AppointmentTeleassistenza
Description: "Profilo dell'Appointment utilizzato nel contesto della Teleassistenza. Rappresenta la prenotazione di una prestazione di teleassistenza (es. televisita, telemonitoraggio, teleconsulto) collegata alla ServiceRequest corrispondente."
* ^status = #draft
* identifier 1..
* identifier ^short = "Codice della prenotazione"

* serviceCategory ^short = "Categorizzazione del servizio erogato durante l'appuntamento."

* reasonCode ^short = "Motivo dell'appuntamento."

* start 1..
* start ^short = "Data e ora di inizio dell'appuntamento."
* end ^short = "Data e ora di fine dell'appuntamento"

* created ^short = "Data di creazione dell'appuntamento."

* basedOn 1..
* basedOn only Reference(ServiceRequestTeleassistenza)
* basedOn ^short = "La richiesta di servizio per la quale viene assegnato questo appuntamento"

* participant ^short = "Partecipanti coinvolti nell'appuntamento."
* participant.actor ^short = "Partecipanti all'appuntamento per la richiesta di televisita."

* participant ^short = "Partecipanti coinvolti nell'appuntamento"
* participant.actor ^short = "Reference a partecipante coinvolto nell'appuntamento"
* participant.type ^short = "Ruolo del partecipante nell'appuntamento"
* participant.actor only Reference(PractitionerTeleassistenza or PractitionerRoleTeleassistenza or PatientTeleassistenza)
