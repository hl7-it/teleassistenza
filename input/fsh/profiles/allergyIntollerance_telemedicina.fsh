Profile: AllergyIntoleranceTeleassistenza
Parent: AllergyIntolerance
Id: AllergyIntoleranceTeleassistenza
Title: "AllergyIntolerance teleassistenza"
Description: "Profilo di AllergyIntolerance utilizzato nel contesto della Teleassistenza."
* code 1..1
* code ^short = "Codice dell'allergia o intolleranza"
* code ^definition = "Codice dell'allergia o intolleranza"
* criticality ^short = "Criticità"
* patient only Reference(PatientTeleassistenza)
* reaction.severity ^short = "Gravità della reazione"