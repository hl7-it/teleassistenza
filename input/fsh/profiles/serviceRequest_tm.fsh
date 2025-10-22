Alias: $brancaPrestazione = https://terminology.agenas.gov.it/ValueSet/brancaPrestazione

Profile: ServiceRequestTeleassistenza
Parent: ServiceRequest
Id: ServiceRequestTeleassistenza
Description: "Profilo base della ServiceRequest condiviso in tutti i documenti di Telemedicina"
* ^version = "1.0.0"
* ^status = #draft
* identifier ^short = "Identifiicativi associati alle singole istanze della richiesta (Numero ricetta medica)."

* requisition ^short = "Identificativo univoco della richiesta composita."
* requisition ^definition = "Un identificativo condiviso comune a tutte le singole istanze della richiesta, generate contemporaneamente da un singolo autore: rappresenta l'identificativo composito o di gruppo.\n\nPer i casi di richieste di prescrizione rappresenterà l'NRE oppure il numero di ricetta cartacea."
* requisition.type ^short = "Tipologia di identificativo."
* requisition.type ^definition = "Codice che specifica come l'identificativo può essere usato."
* requisition.type.coding ^slicing.discriminator.type = #value
* requisition.type.coding ^slicing.discriminator.path = "system"
* requisition.type.coding ^slicing.rules = #open
* requisition.type.coding ^short = "Codice che identifica la tipologia di identificativo"
* requisition.type.coding ^definition = "Codice che identifica la tipologia di identificativo, all'interno del sistema terminologico di riferimento"
* requisition.type.coding contains tipoRicetta 0..1
* requisition.type.coding[tipoRicetta] ^short = "Codice che identifica la tipologia di identificativo, nel caso di prescrizioni."
* requisition.type.coding[tipoRicetta] ^definition = "Codice che identifica la tipologia di identificativo, nel caso di una prescrizione per soggetti stranieri o naviganti"
* requisition.type.coding[tipoRicetta].code 1..
* requisition.type.coding[tipoRicetta].code from vs-tipo-ricetta (required)
* requisition.system obeys requisition-system

* status ^definition = "Stato della richiesta."
* status ^comment = "Lo stato è in genere completamente sotto il controllo del richiedente, che determina se l'ordine è in bozza o attivo e, dopo che è stato attivato, in gara, annullato o sospeso. Gli stati relativi alle attività dell'esecutore si riflettono nell'evento corrispondente (si veda [Event Pattern](event.html) per una discussione generale) o utilizzando la risorsa [Task](task.html)."

* intent ^definition = "Intento della richiesta."
* intent ^comment = "Questo elemento è etichettato come modificatore perché l'intento altera quando e come la risorsa è effettivamente applicabile."

// * category ^slicing.discriminator.type = #value
// * category ^slicing.discriminator.path = "code"
// * category ^slicing.rules = #open

* category ^short = "Classificazione del servizio."
* category ^definition = "Un codice che classifica il servizio."
* category from specialita-mediche (preferred)

// * category contains brancaPrestazione 0..*
// * category[brancaPrestazione] ..1
// * category[brancaPrestazione] from specialita-mediche (preferred)
// * category[brancaPrestazione] ^short = "Codice definito da un sistema terminologico"
// * category[brancaPrestazione] ^definition = "Un riferimento a un codice definito da un sistema terminologico"
* priority ^short = "Priorità della richiesta."
* priority ^definition = "Indica la priorità della richiesta."
* priority ^comment = "Si noti che le stringhe FHIR NON devono superare la dimensione di 1MB."

* code ^short = "Cosa viene richiesto/ordinato."
* code ^definition = "Indica cosa è stato richiesto, ovvero il codice della prestazione quando prevista"
* code ^comment = "Molti codici di procedure di laboratorio e radiologiche incorporano il sistema campione/organo nel nome dell'ordine del test, ad esempio il glucosio da siero o da siero/plasma, o una radiografia del torace. Il campione potrebbe non essere registrato separatamente dal codice dell'esame."
// * code.coding ^short = "Codice definito da un sistema terminologico"
// * code.coding ^definition = "Un riferimento a un codice definito da un sistema terminologico."
// * code.coding ^comment = "I codici possono essere definiti in modo molto casuale in enumerazioni o elenchi di codici, fino a definizioni molto formali come SNOMED CT - si vedano i Core Principles di HL7 v3 per maggiori informazioni.  L'ordine dei codici non è definito e NON DEVE essere utilizzato per dedurre il significato. In generale, al massimo uno solo dei valori di codifica sarà etichettato come UserSelected = true."

* orderDetail ^short = "Informazioni aggiuntive sulla richiesta."
* orderDetail ^definition = "Ulteriori dettagli e istruzioni sulla servizi da erogare."
* quantity[x] ^short = "Quantità prestazione."
* quantity[x] ^definition = "Contiene la molteplicità della prestazione."

* subject only Reference(PatientTeleassistenza)
* subject ^short = "Persona fisica o giuridica per cui è stato ordinato il servizio."
* subject ^definition = "Elemento di tipo Reference che contiene il riferimento alla risorsa Patient oggetto della richiesta."
* subject ^comment = "I riferimenti DEVONO essere un riferimento a una risorsa FHIR effettiva e DEVONO essere risolvibili (consentendo il controllo dell'accesso, la non disponibilità temporanea, ecc.) La risoluzione può avvenire tramite recupero dall'URL o, se applicabile per tipo di risorsa, trattando un riferimento assoluto come un URL canonico e cercandolo in un registro/repository locale."

* encounter ^short = "Incontro in cui è stata generata la richiesta."
* encounter ^definition = "Elemento di tipo Reference che contiene il riferimento alla risorsa Encounter."
* encounter ^comment = "I riferimenti DEVONO essere un riferimento a una risorsa FHIR effettiva e DEVONO essere risolvibili (consentendo il controllo dell'accesso, la non disponibilità temporanea, ecc.) La risoluzione può avvenire tramite recupero dall'URL o, se applicabile per tipo di risorsa, trattando un riferimento assoluto come un URL canonico e cercandolo in un registro/repository locale."

* occurrence[x] ^short = "Data e ora di inizio e fine erogazione."

* authoredOn ^short = "Data di invio della richiesta."

* requester only Reference(PractitionerRoleTeleassistenza)
* requester ^short = "Medico prescrittore."

* performer ^short = "Esecutori della richiesta."

* reasonCode ^short = "Codice diagnosi/Quesito diagnostico."

// * reasonReference only Reference(DiagnosticReportTelemedicina)
* insurance ^short = "Copertura assicurativa associata."

//* specimen ^short = "Campione della procedura."

* note ^short = "Note."

// * code.coding ^slicing.discriminator.type = #value
// * code.coding ^slicing.discriminator.path = "extension.value"
// * code.coding ^slicing.rules = #open
// * code.coding contains
//     codiceNomenclatoreTariffario 0..1 and
//     codiceCatalogoRegionalePrestazione 0..1
// * code.coding[codiceNomenclatoreTariffario] from $catalogoNazionalePrestazioni (preferred)
// * code.coding[codiceNomenclatoreTariffario].extension 1..
// * code.coding[codiceNomenclatoreTariffario].extension contains $extension_serviceRequest_codeCodingType named tipologiaCodificaServizio 1..1
// * code.coding[codiceNomenclatoreTariffario].extension[tipologiaCodificaServizio] ^isModifier = false
// * code.coding[codiceNomenclatoreTariffario].extension[tipologiaCodificaServizio].value[x] = "codiceNomenclatoreTariffario" (exactly)
// * code.coding[codiceNomenclatoreTariffario].system ^short = "Identifica il sistema di terminologia"
// * code.coding[codiceNomenclatoreTariffario].system ^definition = "Identificazione del sistema terminologico che definisce il significato del codice. https://terminology.agenas.gov.it/CodeSystem/catalogoNazionalePrestazioni"
// * code.coding[codiceNomenclatoreTariffario].code ^short = "Codice valido per il sistema terminologico di riferimento"
// * code.coding[codiceNomenclatoreTariffario].code ^definition = "Un codice valido per il sistema terminologico di riferimento, i cui valori sono definiti nel CodeSystem dedicato"
// * code.coding[codiceCatalogoRegionalePrestazione] from $catalogoRegionalePrestazioni (preferred)
// * code.coding[codiceCatalogoRegionalePrestazione].extension 1..
// * code.coding[codiceCatalogoRegionalePrestazione].extension contains $extension_serviceRequest_codeCodingType named tipologiaCodificaServizio 1..1
// * code.coding[codiceCatalogoRegionalePrestazione].extension[tipologiaCodificaServizio] ^isModifier = false
// * code.coding[codiceCatalogoRegionalePrestazione].extension[tipologiaCodificaServizio].value[x] = "codiceCatalogoRegionalePrestazione" (exactly)
// * code.coding[codiceCatalogoRegionalePrestazione].system ^short = "Identifica il sistema di terminologia"
// * code.coding[codiceCatalogoRegionalePrestazione].system ^definition = "Identificazione del sistema terminologico che definisce il significato del codice. https://terminology.agenas.gov.it/CodeSystem/catalogoRegionalePrestazioni"
// * code.coding[codiceCatalogoRegionalePrestazione].code ^short = "Codice valido per il sistema terminologico di riferimento"
// * code.coding[codiceCatalogoRegionalePrestazione].code ^definition = "Un codice valido per il sistema terminologico di riferimento, i cui valori sono definiti nel CodeSystem dedicato"


Invariant: requisition-system
Description: "il system deve seguire questa struttura: \"http://www.[nome prodotto o fornitore].it/identifiers/requisition\""
* severity = #error
* expression = "startsWith('http://www') and endsWith('.it/identifiers/requisition')"