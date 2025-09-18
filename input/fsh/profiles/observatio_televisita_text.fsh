Profile: ObservationTeleassistenzaNarrative
Parent: Observation
Id: ObservationTeleassistenzaNarrative
Description: "Profilo base di Observation narrrativa utilizzato nel contesto della Teleassistenza."
* ^version = "1.0.0"
* ^status = #draft
* ^experimental = true

* effective[x] ^short = "Data di rilevazione del parametro."
* value[x] 1..
* value[x] only string