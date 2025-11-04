Profile: CarePlanRelazioneTA
Parent: CarePlan
Id: CarePlanRelazioneTA
Description: "Profilo del CarePlan utilizzato nel contesto della Relazione di Teleassistenza."
* ^status = #draft
* identifier 1..
* identifier ^short = "Codice identificativo del Piano"

* category from tipologia-piano (required)
* category ^short = "Tipologia di Piano"

* subject only Reference(PatientTeleassistenza)
* subject ^short = "Soggetto destinatario del piano."

* period ^short = "Durata prevista del piano delle attività"

* author only Reference(PractitionerRoleTeleassistenza)
* author ^short = "Autore del piano di cura"

* activity ^short = "Azione da attuare come parte del piano"

