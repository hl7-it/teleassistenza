Profile: BundlePianoTeleassistenza
Parent: Bundle
Id: BundlePianoTeleassistenza
Description: "Profilo del Bundle utilizzato nel contesto del Piano di Teleassistenza. Contiene il documento completo del piano di cura, incluse la Composition, il CarePlan, le risorse cliniche e amministrative associate."
* ^status = #draft

* identifier 1..1
* identifier ^short = "Identificativo univoco del piano di teleassistenza."

* timestamp 1..1
* timestamp ^short = "Data e ora di creazione del Bundle documentale."

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
    encounter 0..1 and
    serviceRequest 0..1 and
    observation 0..* and 
    appintment 0..1 
* entry[appintment].resource only AppointmentTeleassistenza
* entry.resource 1..1
* entry[composition].resource only CompositionPianoTA
* entry[carePlan].resource only CarePlanPianoDiCuraTeleassistenza
* entry[patient].resource only PatientTeleassistenza
* entry[practitionerRole].resource only PractitionerRoleTeleassistenza
* entry[organization].resource only OrganizationT1 or OrganizationT2 or OrganizationT3
* entry[practitioner].resource only PractitionerTeleassistenza
* entry[encounter].resource only EncounterTeleassistenza
* entry[serviceRequest].resource only ServiceRequestTeleassistenza
* entry[observation].resource only ObservationTeleassistenza