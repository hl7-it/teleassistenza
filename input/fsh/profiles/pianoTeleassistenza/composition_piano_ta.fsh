Alias: $loinc = http://loinc.org
Alias: $CarePlan_PianoDiCura_TM = https://agenas.gov.it/fhir/StructureDefinition/CarePlan_PianoDiCura_TM
Alias: $Observation = https://agenas.gov.it/fhir/StructureDefinition/Observation

Profile: CompositionPianoTA
Parent: Composition
Id: CompositionPianoTA
Description: "Profilo della Composition utilizzata nel contesto della Piano di Teleassistenza"
* ^status = #draft

* subject only Reference(PatientTeleassistenza)
* encounter only Reference(EncounterTeleassistenza)
* encounter ^short = "Contesto in cui è stato generato il documento."
* date ^short = "Data di modifica della risorsa."

* author only Reference(PractitionerRoleTeleassistenza)
* author ^short = "Autore del Piano di Teleassistenza."

* attester ^slicing.discriminator.type = #value
* attester ^slicing.discriminator.path = "mode"
* attester ^slicing.rules = #open
* attester ^short = "Professionisti che attestano la validità del documento."
* attester contains legalAuthenticator 1..1
* attester[legalAuthenticator].mode = #legal (exactly)
* attester[legalAuthenticator].time 1..
* attester[legalAuthenticator].party 1..
* attester[legalAuthenticator].party only Reference(PractitionerRoleTeleassistenza)


* title ^short = "Titolo del documento"
* title = "Piano di Teleassistenza" (exactly)

//Section
* section
* section ^slicing.discriminator.type = #value
* section ^slicing.discriminator.path = "code"
* section ^slicing.rules = #open
* section ^slicing.ordered = false

* section contains
    pianoDiCura 0..1 and
    diagnosi 0..1

* section[pianoDiCura] ^sliceName = "pianoDiCura"
* section[pianoDiCura].code = $loinc#18776-5 (exactly)
* section[pianoDiCura].entry only Reference(CarePlanPianoDiCuraTeleassistenza)
* section[diagnosi] ^sliceName = "diagnosi"
* section[diagnosi].code = $loinc#29548-5 (exactly)
* section[diagnosi].entry only Reference(ObservationTeleassistenza)