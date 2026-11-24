Profile: CompositionPianoTA
Parent: Composition
Id: CompositionPianoTA
Description: "Profilo della Composition utilizzata nel contesto del Piano di Teleassistenza. Struttura il documento clinico che raccoglie e organizza le informazioni del piano di cura per il paziente in teleassistenza."
* ^status = #draft

* identifier 1..
* identifier ^short = "Identificatore indipendente dalla versione."

* type from vsTipologiaDocumentale (required)
* type ^short = "Tipo di Composition."

* date ^short = "Data di modifica del documento."

* status ^short = "Stato di completezza della risorsa Composition. Lo stato della risorsa rappresenta anche lo stato del documento."
* status ^definition = "Lo stato della Composition si sviluppa generalmente solo attraverso questo elenco: passa da preliminary a final e poi può passare a amended (ovvero modificato)."

* author only Reference(PractitionerRoleTeleassistenza)
* author ^short = "Autore del Piano di Teleassistenza."

* title ^short = "Titolo del documento"
* title = "Piano di Teleassistenza" (exactly)

* subject only Reference(PatientTeleassistenza)
* encounter only Reference(EncounterTeleassistenza)
* encounter ^short = "Contesto in cui è stato generato il documento."
* date ^short = "Data di modifica della risorsa."

* attester ^slicing.discriminator.type = #value
* attester ^slicing.discriminator.path = "mode"
* attester ^slicing.rules = #open
* attester ^short = "Professionisti che attestano la validità del documento."
* attester contains legalAuthenticator 1..1
* attester[legalAuthenticator].mode = #legal (exactly)
* attester[legalAuthenticator].time 1..
* attester[legalAuthenticator].party 1..
* attester[legalAuthenticator].party only Reference(PractitionerRoleTeleassistenza)

//Section
* section
* section ^slicing.discriminator.type = #value
* section ^slicing.discriminator.path = "code"
* section ^slicing.rules = #open
* section ^slicing.ordered = false

* section contains
    pianoDiCura 0..1 and
    diagnosi 0..1

* section.entry 1..

* section[pianoDiCura] ^sliceName = "pianoDiCura"
* section[pianoDiCura].code = $loinc#18776-5 (exactly)
* section[pianoDiCura].entry only Reference(CarePlanPianoDiCuraTeleassistenza)
* section[diagnosi] ^sliceName = "diagnosi"
* section[diagnosi].code = $loinc#29548-5 (exactly) //TODO: verificare che i codici tra le varie sezini siano gli stessi
* section[diagnosi].entry only Reference(ObservationTeleassistenza)