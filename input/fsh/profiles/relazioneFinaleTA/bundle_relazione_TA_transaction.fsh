Profile: BundleRelazioneTeleassistenzaTransaction
Parent: Bundle
Id: BundleRelazioneTeleassistenzaTransaction
Title: "Bundle Relazione di Teleassistenza - Transaction"
Description: "Bundle FHIR di tipo transaction per la Relazione di Teleassistenza. Le risorse amministrative usano PUT con identificatore, quelle cliniche POST."
* ^status = #draft

// Il bundle dev'essere una transazione
* type = #transaction (exactly)

// Slicing delle entry (per tipo e profilo, come nel document)
* entry ^slicing.discriminator[0].type = #type
* entry ^slicing.discriminator[0].path = "resource"
* entry ^slicing.discriminator[1].type = #profile
* entry ^slicing.discriminator[1].path = "resource"
* entry ^slicing.ordered = false
* entry ^slicing.rules = #open

// Tipologie di entry incluse nella Relazione di Teleassistenza
* entry contains
    composition         1..1 and
    carePlan            0..* and
    patient             1..1 and
    practitionerRole    0..* and
    organization        0..* and
    practitioner        0..* and
    observation         0..* and
    medicationRequest   0..* and
    encounter           0..1 and
    activityDefinition  0..*

// Vincoli di profilo sulle risorse
* entry[composition].resource only CompositionRelazioneTeleassistenza
* entry[carePlan].resource only CarePlanRelazioneTA
* entry[patient].resource only PatientTeleassistenza
* entry[practitionerRole].resource only PractitionerRoleTeleassistenza
* entry[organization].resource only OrganizationT1
* entry[practitioner].resource only PractitionerTeleassistenza
* entry[observation].resource only ObservationTeleassistenza
* entry[medicationRequest].resource only MedicationRequestTeleassistenza
* entry[encounter].resource only EncounterTeleassistenza
* entry[activityDefinition].resource only ActivityDefinition

// ---------------------------
// Metodi REST per la transaction
// ---------------------------

// Risorse amministrative (PUT)
* entry[patient].request.method = #PUT
* entry[practitionerRole].request.method = #PUT
* entry[organization].request.method = #PUT
* entry[practitioner].request.method = #PUT

// Risorse cliniche (POST)
* entry[composition].request.method = #POST
* entry[carePlan].request.method = #POST
* entry[observation].request.method = #POST
* entry[medicationRequest].request.method = #POST
* entry[encounter].request.method = #POST
* entry[activityDefinition].request.method = #POST
