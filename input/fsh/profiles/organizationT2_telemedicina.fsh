
Profile: OrganizationT2
Parent: Organization
Id: OrganizationT2
Description: "Profilo per Organization di tipo 2 (es. ospedale, distretto)"
* identifier ^short = "Codice del presidio"
* identifier 1..*

* type ^short = "Tipo di organizzazione"

* name ^short = "Nome dell'organizzazione."

* address.city ^short = "Comune"
* address.district ^short = "Nome della provincia"
* address.state ^short = "Sotto-unità dello stato (Regione)."

* partOf ^short = "L'Organization di cui questa Organization è parte"
* partOf only Reference(OrganizationT1)

