Profile: MedicationRequestTeleassistenza
Parent: MedicationRequest
Id: MedicationRequestTeleassistenza
Description: "Profilo della MedicationRequest nel contesto della Teleassistenza" 
* ^status = #draft
* status ^definition = "Stato della richiesta."

* intent = #proposal
* intent ^definition = "Scopo della richiesta."

* medication[x] ^short = "Definizione farmaco"
* medication[x] ^definition = "Identifica il farmaco oggetto delle medication request."

* subject only Reference(PatientTeleassistenza)
* subject ^short = "Soggetto per cui è ricchiesta la medication."

* requester 1..1

* dosageInstruction ^short = "Instuzioni di dosaggio e somministrazione."
* dosageInstruction.timing ^short = "Tempistiche di somministrazione del farmaco."
* dosageInstruction.timing.repeat.bounds[x] only Period
* dosageInstruction.timing.repeat.bounds[x] ^short = "Range temporale nel quale è valida la posologia."
* dosageInstruction.site ^short = "Sito di somministrazione."
* dosageInstruction.route ^short = "Via di somministrazione."
* dosageInstruction.doseAndRate ^short = "Dosaggio e frequenza del farmaco."
