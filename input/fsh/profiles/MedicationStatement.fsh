// Profile for MedicationStatement in Telemedicina context
Profile: MedicationStatementTeleassistenza
Parent: MedicationStatement
Id: MedicationStatementTeleassistenza
Title: "MedicationStatement Telemedicina"
Description: "Profilo della MedicationStatement utilizzato nel contesto della Teleassistenza."
* ^status = #draft

// Limit medication to CodeableConcept
* medication[x] only CodeableConcept
* medication[x] ^short = "Definizione farmaco"
* medication[x] from https://www.hl7.it/fhir/terminology/ValueSet/aifa-aic (required)
* medication[x] ^binding.strength = #preferred

// Subject must be Telemedicina patient
* subject only Reference(PatientTeleassistenza)

// Optional metadata
* effective[x] 0..1
* note 0..1
* dosage 0..*