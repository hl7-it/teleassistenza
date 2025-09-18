
// Profile: OrganizationTelemedicina
// Parent: Organization
// Id: OrganizationTelemedicina
// Description: "Profilo base della Organization condiviso in tutti i documenti di Telemedicina"
// * ^version = "0.1.0"
// * ^status = #draft

// * identifier ^short = "Identificativo dell'organizzazione."
// * identifier ^definition = "Identificativi di Organization usati per identificare l'Organization su diversi sistemi"

// * type ^short = "Tipo di organizzazione"
// * type ^definition = "Il tipo di organizzazione di cui si tratta"
// * type ^comment = "Le organizzazioni possono essere di diversi tipi"

// * name ^short = "Nome dell'organizzazione."
// * name ^definition = "Descrizione della Organization"

// * address.city ^short = "Comune"
// * address.district ^short = "Nome della provincia"
// * address.state ^short = "Sotto-unità dello stato (Regione)."

// * partOf ^short = "L'Organization di cui questa Organization è parte"
// * partOf ^definition = "L'Organization di cui questa Organization è parte"
// * partOf ^comment = "Tale reference assume rilevanza in caso di Organization di tipo poliambulatorio, che è parte di una Organization di tipo asl: in questo caso si può ricorerre ad una reference di tipo logico"
