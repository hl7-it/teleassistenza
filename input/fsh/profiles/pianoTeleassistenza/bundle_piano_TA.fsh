Profile: BundlePianoTeleassistenza
Parent: Bundle
Id: BundlePianoTeleassistenza
Description: "Profilo del Bundle utilizzato nel contesto della Piano di Teleassistenza"
* ^status = #draft
* type = #document (exactly)
* entry ^slicing.discriminator[0].type = #type
* entry ^slicing.discriminator[0].path = "resource"
* entry ^slicing.discriminator[1].type = #profile
* entry ^slicing.discriminator[1].path = "resource"
* entry ^slicing.ordered = false
* entry ^slicing.rules = #open
* entry contains
    composition 1..1 and
    carePlan 0..* and
    patient 0..1 and
    practitionerRole 0..* and
    organization 0..* and
    practitioner 0..* and
    encounter 0..1 and
    activityDefinition 0..*
* entry[composition].resource only CompositionPianoTA
* entry[carePlan].resource only CarePlanPianoDiCuraTeleassistenza
* entry[patient].resource only PatientTeleassistenza
* entry[practitionerRole].resource only PractitionerRoleTeleassistenza
* entry[organization].resource only OrganizationT1
* entry[practitioner].resource only PractitionerTeleassistenza
* entry[encounter].resource only EncounterTeleassistenza
* entry[activityDefinition].resource only ActivityDefinition