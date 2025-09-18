
Alias: $Organization_T1 = http://hl7.it/fhir/StructureDefinition/Organization_T1
Alias: $Organization_T2 = http://hl7.it/fhir/StructureDefinition/Organization_T2
Alias: $Organization_T3 = http://hl7.it/fhir/StructureDefinition/Organization_T3
Alias: $specialityPractitionerRole = https://terminology.agenas.gov.it/ValueSet/specialityPractitionerRole

Profile: PractitionerRoleTeleassistenza
Parent: PractitionerRole
Id: PractitionerRoleTeleassistenza
Title: "PractitionerRoleTeleassistenza"
Description: "Profilo base del PractitionerRole utilizzato nel contesto della Teleassistenza."
* ^version = "0.1.0"
* ^status = #active
* ^jurisdiction = urn:iso:std:iso:3166#IT

* identifier ^short = "Identificativo dell'operatore (e.g. Codice Fiscale, ID Regionale)"

* period ^short = "Periodo durante il quale il professionista è autorizzato a svolgere il ruolo."

* practitioner only Reference(PractitionerTeleassistenza)
* practitioner ^short = "Dettagli dell'operatore"

* organization only Reference(OrganizationT1)
* organization ^short = "Organizzazione di Appartenenza"

* code ^short = "Ruoli che questo professionista può svolgere"

* specialty from vsspecialityPractitionerRole (required)