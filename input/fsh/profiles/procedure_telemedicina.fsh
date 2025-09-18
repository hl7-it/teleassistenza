Profile: ProcedureTeleassistenza
Parent: Procedure
Id: ProcedureTeleassistenza
Description:  "Profilo base della Procedure utilizzata nel contesto della Teleassistenza."

* ^status = #draft
* extension contains http://hl7.org/fhir/StructureDefinition/procedure-method|5.2.0 named ModalitaEsecuzioneProcedura 0..1
* extension[ModalitaEsecuzioneProcedura] ^short = "Modalità esecuzione procedura operativa."

* basedOn ^short = "Richiesta su cui si basa questa procedura."

* partOf only Reference(Procedure or ObservationTeleassistenza)

* status ^short = "Stato della procedura."

* code 1..
* code MS
* code.coding.display MS
* code.coding.code MS
* code ^short = "Codice della prestazione eseguita"
* code from VsCatalogoNazionalePrestazioni (required)

* subject only Reference(PatientTeleassistenza)
* subject ^short = "Paziente coinvolto nella procedura."

* performed[x] MS
* performed[x] 1..
* performed[x] only Period
* performed[x] ^short = "Data e ora di esecuzione della procedura."

* recorder ^short = "Chi ha registrato la procedura."

* performer ^short = "Persone che hanno eseguito la procedura."
* performer.actor only Reference(PractitionerTeleassistenza or PractitionerRoleTeleassistenza or OrganizationT1 or Patient)

* outcome ^short = "Parametri rilevanti al fine di caratterizzare la procedura."

* outcome.text ^short = "Testo libero per la relazione alla fine della procedura."

// * usedReference ^short = "Strumentazione utilizzata nel corso della procedura."
//* usedReference only Reference(DeviceTelemedicinaTesserino)

* category ^short = "Procedura operativa eseguita."
* category MS
* category.coding.display MS
* category.coding.code MS

* note ^short = "Note"