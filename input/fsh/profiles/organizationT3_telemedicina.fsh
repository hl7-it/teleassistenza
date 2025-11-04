Alias: $minsan-fls = https://terminology.agenas.gov.it/ValueSet/minsan-fls
Alias: $uri-idAslRegione = https://www.hl7.it/fhir/terminology/ValueSet/uri-idAslRegione

Profile: OrganizationT3
Parent: Organization
Id: OrganizationT3
Description: "Profilo base generico per Organization di tipo 3 (es. Reparto, ambulatorio)."

* identifier ^short = "Identificativo dell'organizzazione."
* identifier ^definition = "Identificativi di Organization usati per identificare l'Organization su diversi sistemi"
* identifier 1..*

* type ^short = "Tipo di organizzazione"

* name ^short = "Nome dell'organizzazione."

* address.city ^short = "Comune"
* address.district ^short = "Nome della provincia"
* address.state ^short = "Sotto-unità dello stato (Regione)."

* partOf ^short = "L'Organization di cui questa Organization è parte"
* partOf only Reference(OrganizationT2)

* identifier ^short = "Codice dell'unità operativa"