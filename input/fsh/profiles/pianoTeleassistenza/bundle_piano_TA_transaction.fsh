Profile: BundlePianoTeleassistenzaTransaction
Parent: Bundle
Id: BundlePianoTeleassistenzaTransaction
Title: "Bundle Piano di Teleassistenza - Transaction"
Description: "Bundle FHIR di tipo transaction per il Piano di Teleassistenza. Le risorse amministrative usano PUT con identificatore, quelle cliniche POST."
* ^status = #draft

// Il bundle dev'essere una transazione
* type = #transaction (exactly)

// Slicing delle entry come nel tuo esempio
* entry ^slicing.discriminator[0].type = #type
* entry ^slicing.discriminator[0].path = "resource"
* entry ^slicing.ordered = false
* entry ^slicing.rules = #open

// Tipologie di entry incluse nel Piano di Teleassistenza
* entry contains
    composition 1..1 and
    carePlan 0..* and
    patient 0..1 and
    practitionerRole 0..* and
    organization 0..* and
    practitioner 0..* and
    activityDefinition 0..* and
    encounter 0..* and
    observation 0..*

// ---- Risorse amministrative (PUT)
* entry[patient].resource only PatientTeleassistenza
* entry[patient].request.method = #PUT

* entry[practitioner].resource only PractitionerTeleassistenza
* entry[practitioner].request.method = #PUT

* entry[organization].resource only OrganizationT1
* entry[organization].request.method = #PUT

* entry[practitionerRole].resource only PractitionerRoleTeleassistenza
* entry[practitionerRole].request.method = #PUT

// ---- Risorse cliniche (POST)
* entry[composition].resource only CompositionPianoTA
* entry[composition].request.method = #POST

* entry[carePlan].resource only CarePlanPianoDiCuraTeleassistenza
* entry[carePlan].request.method = #POST

* entry[activityDefinition].resource only ActivityDefinition
* entry[activityDefinition].request.method = #POST

* entry[encounter].resource only EncounterTeleassistenza
* entry[encounter].request.method = #POST

* entry[observation].resource only ObservationTeleassistenza
* entry[observation].request.method = #POST