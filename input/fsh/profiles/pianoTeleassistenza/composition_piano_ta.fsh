Alias: $loinc = http://loinc.org
Alias: $CarePlan_PianoDiCura_TM = https://agenas.gov.it/fhir/StructureDefinition/CarePlan_PianoDiCura_TM
Alias: $Observation = https://agenas.gov.it/fhir/StructureDefinition/Observation

Profile: CompositionPianoTA
Parent: Composition
Id: CompositionPianoTA
Description: "Profilo della Composition utilizzata nel contesto della Piano di Teleassistenza"
* ^status = #draft
* type ^definition = "Tipo di Composition."

* subject only Reference(PatientTeleassistenza)
* encounter only Reference(EncounterTeleassistenza)
* encounter ^short = "Contesto in cui è stato generato il documento."
* date ^short = "Data di modifica della risorsa."

* author only Reference(PractitionerRoleTeleassistenza or OrganizationT1)
* author ^short = "Autore del Piano di Teleassistenza."

* title ^short = "Titolo del documento"
* title = "Piano di Teleassistenza" (exactly)

//Section
* section
  * ^slicing.discriminator[+].type = #exists
  * ^slicing.discriminator[=].path = "$this.section"
  * ^slicing.discriminator[+].type = #exists
  * ^slicing.discriminator[=].path = "$this.entry"
  * ^slicing.ordered = false
  * ^slicing.rules = #open

* section contains
    pianoDiCura 0..1 and
    diagnosi 0..1

* section[pianoDiCura] ^sliceName = "pianoDiCura"
* section[pianoDiCura].code = $loinc#18776-5 (exactly)
* section[pianoDiCura].entry only Reference(CarePlanPianoDiCuraTeleassistenza)
* section[diagnosi] ^sliceName = "diagnosi"
* section[diagnosi].code = $loinc#29548-5 (exactly)
* section[diagnosi].entry only Reference(ObservationTeleassistenza)