Profile: PractitionerTeleassistenza
Parent: Practitioner
Id: PractitionerTeleassistenza
Description: "Profilo base del Practitioner condiviso in tutti i documenti di Telemedicina"
* ^version = "0.1.0"
* ^status = #active

* identifier 1..
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.description = "Slice based on the identifier pattern"
* identifier ^slicing.rules = #open
* identifier ^short = "Identificativo dell'operatore sanitario"
* identifier ^definition = "Un identificatore che si applica a questa persona in questo ruolo."
* identifier contains codiceFiscale 0..1
* identifier[codiceFiscale] ^short = "Codice Fiscale"
* identifier[codiceFiscale] ^definition = "Codice Fiscale"
* identifier[codiceFiscale].system = "http://hl7.it/sid/codiceFiscale" (exactly)

* name ^short = "Nome dell'operatore sanitario."
* name ^definition = "Il nome o i nomi associati al professionista."
* name ^comment = "La selezione della proprietà use deve garantire che sia specificato un unico nome usuale e che gli altri utilizzino il nickname (alias), il vecchio o altri valori, a seconda dei casi.  \n\nIn generale, selezionare il valore da utilizzare in ResourceReference.display in base a quanto segue:\n\n1. C'è più di un nome\n2. Uso = abituale\n3. Il periodo è attuale alla data dell'uso\n4. Uso = ufficiale\n5. Altro ordine deciso dalle regole aziendali interne."