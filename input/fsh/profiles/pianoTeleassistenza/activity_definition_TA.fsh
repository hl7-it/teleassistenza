Profile: ActivityDefinitionTeleassistenza
Parent: ActivityDefinition
Id: ActivityDefinitionTeleassistenza
Description: "Profilo del ActivityDefinition utilizzato nel contesto della Piano di Teleassistenza"

* code ^short = "Codice della prestazione pianificata."
* timing[x] only Timing
* timingTiming.repeat.count ^short = "Numero di cicli di attività previsti durante la durata del piano."
* timingTiming.repeat.duration ^short = "Durata del singolo ciclo."