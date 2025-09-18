Profile: PractitionerTeleassistenza
Parent: Practitioner
Id: PractitionerTeleassistenza
Description: "Profilo base del Practitioner utilizzato nel contesto della Teleassistenza."
* ^version = "0.1.0"
* ^status = #active

* identifier 1..
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.description = "Slice based on the identifier pattern"
* identifier ^slicing.rules = #open
* identifier ^short = "Identificativo dell'operatore sanitario"

* identifier contains codiceFiscale 0..1
* identifier[codiceFiscale] ^short = "Codice Fiscale"
* identifier[codiceFiscale] ^definition = "Codice Fiscale"
* identifier[codiceFiscale].system = "http://hl7.it/sid/codiceFiscale" (exactly)

* name ^short = "Nome dell'operatore sanitario."
