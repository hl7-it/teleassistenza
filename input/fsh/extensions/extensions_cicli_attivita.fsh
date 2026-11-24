Extension: ActivityType
Id: activity-type
Title: "Tipologia di attività"
Description: "Tipologia dell'attività da eseguire nell'ambito del piano assistenziale, ad esempio teleassistenza, teleriabilitazione neurologica o telemonitoraggio cardiologico."
Context: CarePlan.activity.detail
* ^status = #active
* extension 0..0
* value[x] 1..1
* value[x] only CodeableConcept
* valueCodeableConcept ^short = "Tipologia di attività"
* valueCodeableConcept ^definition = "Classificazione della tipologia di attività assistenziale pianificata."



Extension: ActivityNumberOfCycles
Id: activity-number-of-cycles
Title: "Numero di cicli"
Description: "Numero di cicli di attività previsti durante la durata del piano assistenziale."
Context: CarePlan.activity.detail
* ^status = #active
* extension 0..0
* value[x] 1..1
* value[x] only positiveInt
* valuePositiveInt ^short = "Numero di cicli previsti"
* valuePositiveInt ^definition = "Numero complessivo di cicli pianificati per la specifica attività assistenziale."


Extension: ActivityCycleDuration
Id: activity-cycle-duration
Title: "Durata del ciclo"
Description: "Durata temporale prevista per il singolo ciclo di attività."
Context: CarePlan.activity.detail

* ^status = #active
* extension 0..0
* value[x] 1..1
* value[x] only Duration
* valueDuration ^short = "Durata del singolo ciclo"
* valueDuration ^definition = "Intervallo temporale previsto per lo svolgimento di un singolo ciclo di attività."
* valueDuration.value 1..1
* valueDuration.unit 1..1
* valueDuration.system 1..1
* valueDuration.system = "http://unitsofmeasure.org" (exactly)
* valueDuration.code 1..1
* valueDuration.comparator 0..0
* valueDuration obeys activity-cycle-duration-1

Invariant: activity-cycle-duration-1
Description: "La durata del ciclo deve essere maggiore di zero."
Severity: #error
Expression: "value > 0"


Extension: ActivityNumberPerCycle
Id: activity-number-per-cycle
Title: "Numero di attività per ciclo"
Description: "Numero di attività o prestazioni pianificate all'interno di ciascun ciclo."
Context: CarePlan.activity.detail

* ^status = #active
* extension 0..0
* value[x] 1..1
* value[x] only positiveInt
* valuePositiveInt ^short = "Numero di attività per ciclo"
* valuePositiveInt ^definition = "Numero complessivo di esecuzioni della specifica attività previste per ciascun ciclo."