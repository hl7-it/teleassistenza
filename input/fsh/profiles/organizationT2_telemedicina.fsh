
Profile: OrganizationT2
Parent: Organization
Id: OrganizationT2
Description: "Profilo per Organization di tipo 2 (es. ospedale, distretto)."
* identifier ^short = "Codice del presidio"

* identifier ^slicing.discriminator[0].type = #pattern
* identifier ^slicing.discriminator[0].path = "value"
* identifier ^slicing.discriminator[1].type = #pattern
* identifier ^slicing.discriminator[1].path = "system"
* identifier ^slicing.rules = #open
* identifier ^slicing.description = "Slice based on the identifier pattern"
* identifier 1..*
* identifier contains 
	struttura 0..1 
	and strutturaInterna 0..1

* identifier[struttura].system = "http://hl7.it/sid/hsp" (exactly) // pattern
* identifier[struttura] ^short = "Identificativo Struttura di Ricovero"
* identifier[struttura].value from https://www.hl7.it/fhir/terminology/ValueSet/minsan-idStrutture (required)

* identifier[strutturaInterna].system = "http://hl7.it/sid/hsp" (exactly) // pattern
* identifier[strutturaInterna].value from $minsan-idStruttureInterne-vs (required)

* type ^short = "Tipo di organizzazione"

* name ^short = "Nome dell'organizzazione."

* address.city ^short = "Comune"
* address.district ^short = "Nome della provincia"
* address.state ^short = "Sotto-unità dello stato (Regione)."

* partOf ^short = "L'Organization di cui questa Organization è parte"
* partOf only Reference(OrganizationT1)

