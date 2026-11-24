Extension: OscuramentoDati
Id: oscuramento-dati
Title: "Oscuramento dati"
Description: "Indica la volontà del paziente di oscurare i propri dati relativi alla richiesta di teleassistenza."
Context: ServiceRequest

* ^status = #active
* extension 0..0
* value[x] 1..1
* value[x] only boolean
* valueBoolean ^short = "Oscuramento dei dati richiesto dal paziente"


Extension: MedicoTitolare
Id: medico-titolare
Title: "Medico titolare"
Description: "Identifica il medico titolare della richiesta di teleassistenza."
Context: ServiceRequest

* ^status = #active
* extension 0..0
* value[x] 1..1
* value[x] only Reference(PractitionerTeleassistenza or PractitionerRoleTeleassistenza)
* valueReference ^short = "Medico titolare della richiesta"
