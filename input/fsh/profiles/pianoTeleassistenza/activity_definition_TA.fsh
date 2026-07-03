Profile: ActivityDefinitionTeleassistenza
Parent: ActivityDefinition
Id: ActivityDefinitionTeleassistenza
Description: "Profilo dell'ActivityDefinition utilizzato nel contesto del Piano di Teleassistenza. Definisce le singole prestazioni o attività di monitoraggio pianificate per il paziente (es. telemonitoraggio, televisita, teleconsulto)."

* code ^short = "Codice della prestazione pianificata."
* timing[x] only Timing
* timingTiming.repeat.count ^short = "Numero di cicli di attività previsti durante la durata del piano."
* timingTiming.repeat.duration ^short = "Durata del singolo ciclo."
* timingTiming.repeat.frequency ^short = "Numero di attività per Ciclo."