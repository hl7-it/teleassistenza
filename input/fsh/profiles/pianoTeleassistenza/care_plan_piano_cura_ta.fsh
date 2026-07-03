Profile: CarePlanPianoDiCuraTeleassistenza
Parent: CarePlan
Id: CarePlanPianoDiCuraTeleassistenza
Description: "Profilo del CarePlan utilizzato nel contesto del Piano di Teleassistenza. Descrive il piano di cura programmato per il paziente nell'ambito del percorso di teleassistenza, includendo le attività, gli obiettivi e i professionisti coinvolti."
* ^status = #draft
* identifier 1..
* identifier ^short = "Codice identificativo del Piano."

* category from tipologia-piano (required)
* category ^short = "Tipologia di Piano"

* subject only Reference(PatientTeleassistenza)
* subject ^short = "Soggetto destinatario del piano di Teleassistenza."

* period ^short = "Durata prevista del piano di Teleassistenza."

* author only Reference(PractitionerRoleTeleassistenza)
* author ^short = "Autore del piano di Teleassistenza."

* activity ^short = "Azione da attuare come parte del piano di Teleassistenza"

* activity.outcomeReference only Reference(ObservationTeleassistenza)
* activity.outcomeReference ^short = "Parametro rilevato"
* activity.reference only Reference(ServiceRequest)
* activity.detail.instantiatesCanonical only Canonical(ActivityDefinitionTeleassistenza)
