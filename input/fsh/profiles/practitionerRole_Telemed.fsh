
Profile: PractitionerRoleTeleassistenza
Parent: PractitionerRole
Id: PractitionerRoleTeleassistenza
Title: "PractitionerRoleTeleassistenza"
Description: "Profilo del PractitionerRole utilizzato nel contesto della Teleassistenza. Descrive il ruolo e la specialità del professionista sanitario (medico refertante, medico richiedente, infermiere) coinvolto nell'erogazione della prestazione di teleassistenza."
* ^version = "0.1.0"
* ^status = #active
* ^jurisdiction = urn:iso:std:iso:3166#IT

* identifier ^short = "Identificativo dell'operatore (e.g. Codice Fiscale, ID Regionale)"

* period ^short = "Periodo durante il quale il professionista è autorizzato a svolgere il ruolo."

* practitioner only Reference(PractitionerTeleassistenza)
* practitioner ^short = "Dettagli dell'operatore"

* organization only Reference(OrganizationT1)
* organization ^short = "Organizzazione di Appartenenza"

* code ^short = "Ruoli che questo professionista può svolgere"

* specialty from vsspecialityPractitionerRole (required)