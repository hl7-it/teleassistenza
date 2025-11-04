Alias: $brancaPrestazione = https://terminology.agenas.gov.it/ValueSet/brancaPrestazione

Profile: ServiceRequestTeleassistenza
Parent: ServiceRequest
Id: ServiceRequestTeleassistenza
Description: "Profilo della ServiceRequest utilizzato nel contesto della Teleassistenza."
* ^version = "1.0.0"
* ^status = #draft
* identifier ^short = "Identifiicativi associati alle singole istanze della richiesta (Numero ricetta medica)."

* requisition ^short = "Identificativo univoco della richiesta composita."
* requisition.type ^short = "Tipologia di identificativo."
* requisition.type from vs-tipo-ricetta (required)
// * requisition.type.coding ^slicing.discriminator.type = #value
// * requisition.type.coding ^slicing.discriminator.path = "code"
// * requisition.type.coding ^slicing.rules = #open
// * requisition.type.coding ^short = "Codice che identifica la tipologia di identificativo"
// * requisition.type.coding contains tipoRicetta 0..1
// * requisition.type.coding[tipoRicetta] ^short = "Codice che identifica la tipologia di identificativo, nel caso di prescrizioni."
// * requisition.type.coding[tipoRicetta].code 1..
// * requisition.type.coding[tipoRicetta].code from vs-tipo-ricetta (required)
// * requisition.system obeys requisition-system

* intent ^short = "Intento della richiesta."

* category ^short = "Classificazione del servizio."
* category ^definition = "Un codice che classifica il servizio."
* category from specialita-mediche (preferred)

* priority ^short = "Priorità della richiesta."
* code ^short = "Cosa viene richiesto/ordinato."
* orderDetail ^short = "Informazioni aggiuntive sulla richiesta."
* quantity[x] ^short = "Quantità prestazione."
* subject only Reference(PatientTeleassistenza)
* subject ^short = "Persona fisica o giuridica per cui è stato ordinato il servizio."
* encounter ^short = "Incontro in cui è stata generata la richiesta."
* occurrence[x] ^short = "Data e ora di inizio e fine erogazione."
* authoredOn ^short = "Data di invio della richiesta."
* requester only Reference(PractitionerRoleTeleassistenza)
* requester ^short = "Medico prescrittore."
* performer ^short = "Esecutori della richiesta."
* performer only Reference(PractitionerRoleTeleassistenza)
* reasonCode ^short = "Codice diagnosi/Quesito diagnostico."
* insurance ^short = "Copertura assicurativa associata."
* note ^short = "Note."

// Invariant: requisition-system
// Description: "il system deve seguire questa struttura: \"http://www.[nome prodotto o fornitore].it/identifiers/requisition\""
// * severity = #error
// * expression = "startsWith('http://www') and endsWith('.it/identifiers/requisition')"