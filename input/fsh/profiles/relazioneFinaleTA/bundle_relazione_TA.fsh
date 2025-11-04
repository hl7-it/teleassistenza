Profile: BundleRelazioneTeleassistenza
Parent: Bundle
Id: BundleRelazioneTeleassistenza
Description: "Profilo del Bundle utilizzato nel contesto della Relazione di Teleassistenza."
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
    patient 1..1 and
    practitionerRole 0..* and
    organization 0..* and
    practitioner 0..* and
    observation 0..* and
    medicationRequest 0..* and
    encounter 0..1 and
    activityDefinition 0..* and
    medicationStatement 0..1 and
    allergyIntolerance 0..* and
    serviceRequest 0..1


* entry[composition].resource only CompositionRelazioneTeleassistenza
* entry[carePlan].resource only CarePlanRelazioneTA
* entry[patient].resource only PatientTeleassistenza
* entry[practitionerRole].resource only PractitionerRoleTeleassistenza
* entry[organization].resource only OrganizationT1
* entry[observation].resource only ObservationTeleassistenza
* entry[medicationRequest].resource only MedicationRequestTeleassistenza
* entry[practitioner].resource only PractitionerTeleassistenza
* entry[activityDefinition].resource only ActivityDefinition
* entry[encounter].resource only EncounterTeleassistenza
* entry[medicationStatement].resource only MedicationStatementTeleassistenza
* entry[allergyIntolerance].resource only AllergyIntoleranceTeleassistenza
* entry[serviceRequest].resource only ServiceRequestTeleassistenza
