
Profile: OrganizationT3
Parent: Organization
Id: OrganizationT3
Description: "Profilo per Organization di tipo 3 (es. reparto, ambulatorio, unità operativa) utilizzato nel contesto della Teleassistenza. Rappresenta l'unità organizzativa interna che eroga direttamente la prestazione di teleassistenza al paziente."

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