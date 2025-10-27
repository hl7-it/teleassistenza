Profile: Deviceteleassistenza
Parent: Device
Id: Deviceteleassistenza
Title: "Device"
Description: "Profilo base del Device condiviso in tutti i documenti di Telemedicina"
* ^status = #draft
* ^experimental = false
* ^date = "2024-04-29T16:08:42+02:00"
* identifier ^short = "Identificativo business del Device"
* identifier ^definition = "Descrive identificativi business per la risorsa"
* udiCarrier ^short = "Unique Device Identifier (UDI)"
* udiCarrier ^definition = "Unique device identifier (UDI) assegnato all'etichetta o al pacchetto del dispositivo."
* manufacturer ^short = "Nome del fabbricante"
* manufacturer ^definition = "Nome del fabbricante"
* manufactureDate ^short = "Data di fabbricazione"
* manufactureDate ^definition = "Data di fabbricazione"
* expirationDate ^short = "Data di scadenza (se applicabile)"
* expirationDate ^definition = "Data di scadenza"
* lotNumber ^short = "Numero di lotto"
* lotNumber ^definition = "Numero di lotto"
* serialNumber ^short = "Numero seriale"
* serialNumber ^definition = "Numero seriale assegnato al device"
* deviceName ^short = "Il nome del dispositivo fornito dal produttore"
* deviceName ^definition = "Rappresenta il nome del produttore del dispositivo fornito dal dispositivo, da un'etichetta UDI o da una persona che descrive il dispositivo."
* deviceName.name ^short = "Nome del device"
* deviceName.name ^definition = "Nome del device"
* deviceName.type ^definition = "Tipologia del deviceName"
* type ^short = "Tipologia del device"
* type ^definition = "Tipologia device associati al piano (es. monitor multiparametrico)."
