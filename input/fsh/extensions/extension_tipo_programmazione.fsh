Extension: TipoProgrammazione
Id: tipo-programmazione
Title: "Tipologia di programmazione"
Description: "Indica se il piano delle attività rappresenta una prima programmazione oppure una riprogrammazione, intesa come rinnovo o modifica del piano."
Context: CarePlan

* ^status = #active
* extension 0..0
* value[x] 1..1
* value[x] only CodeableConcept
* valueCodeableConcept from VSTipoProgrammazione (example)
* valueCodeableConcept ^short = "Tipologia di programmazione del piano"


//-------------------------------------------------------------------------

CodeSystem: CSTipoProgrammazione
Id: cs-tipo-programmazione
Title: "Tipologia di programmazione"
Description: "Tipologie di programmazione del piano delle attività assistenziali."

* ^status = #active
* ^caseSensitive = true
* ^content = #complete

* #prima-programmazione "Prima programmazione"
    "Prima stesura del piano delle attività."

* #riprogrammazione "Riprogrammazione"
    "Rinnovo o modifica del piano delle attività."


ValueSet: VSTipoProgrammazione
Id: vs-tipo-programmazione
Title: "Tipologia di programmazione"
Description: "Valori ammessi per la tipologia di programmazione del piano delle attività."

* ^status = #active
* include codes from system CSTipoProgrammazione