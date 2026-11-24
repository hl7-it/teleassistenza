Profile: CarePlanPianoDiCuraTeleassistenza
Parent: CarePlan
Id: CarePlanPianoDiCuraTeleassistenza
Description: "Profilo del CarePlan utilizzato nel contesto del Piano di Teleassistenza. Descrive il piano di cura programmato per il paziente nell'ambito del percorso di teleassistenza, includendo le attività, gli obiettivi e i professionisti coinvolti."
* ^status = #draft

* extension contains
    TipoProgrammazione named tipoProgrammazione 0..1
* extension[tipoProgrammazione] ^short = "Tipologia di programmazione"
* extension[tipoProgrammazione] ^definition = "Indica se il piano delle attività è di prima programmazione o di riprogrammazione."

* identifier 1..
* identifier ^short = "Codice identificativo del Piano."

* category from tipologia-piano (required)
* category ^short = "Tipologia di Piano"

* subject only Reference(PatientTeleassistenza)
* subject ^short = "Soggetto destinatario del piano di Teleassistenza."

* period ^short = "Durata prevista del piano di Teleassistenza."

* author only Reference(PractitionerRoleTeleassistenza)
* author ^short = "Autore del piano di Teleassistenza."

* replaces ^short = "Piano assistenziale precedente sostituito in caso di riprogrammazione."
* replaces only Reference(CarePlanPianoDiCuraTeleassistenza)

* activity ^short = "Azione da attuare come parte del piano di Teleassistenza"
* activity.detail.extension contains
    ActivityType named tipologiaAttivita 0..1 and
    ActivityNumberOfCycles named numeroCicli 0..1 and
    ActivityCycleDuration named durataCiclo 0..1 and
    ActivityNumberPerCycle named numeroAttivitaPerCiclo 0..1
* activity.detail.extension[tipologiaAttivita] ^short = "Tipologia di attività"
* activity.detail.extension[numeroCicli] ^short = "Numero di cicli"
* activity.detail.extension[durataCiclo] ^short = "Durata del ciclo"
* activity.detail.extension[numeroAttivitaPerCiclo] ^short = "Numero di attività per ciclo"
* activity.detail.code ^short = "Codice e descrizione dell'attività del piano di Teleassistenza."
* activity.detail.scheduledTiming.repeat ^short = "Ripetizione temporale dell'attività del piano di Teleassistenza."
* activity.detail.scheduledTiming.repeat.timeOfDay ^short = "Orario specifico della ripetizione dell'attività del piano di Teleassistenza."

* activity.outcomeReference only Reference(ObservationTeleassistenza)
* activity.outcomeReference ^short = "Parametro rilevato durante la teleassistenza."
