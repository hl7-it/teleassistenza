Alias: $loinc = http://loinc.org

Profile: CompositionRelazioneTeleassistenza
Parent: CompositionTelemedicina
Id: CompositionRelazioneTeleassistenza
Description: "Profilo della Composition utilizzata nel contesto della Relazione Finale di Telemonitoraggio"
* ^status = #draft
* title = "Relazione di Teleassistenza" (exactly)
* type = $loinc#91531-4 (exactly)
* section ^slicing.discriminator.type = #value
* section ^slicing.discriminator.path = "code"
* section ^slicing.rules = #open
* section contains
    pianoDiCura 1..1 and
    // anamnesi 0..1 and TODO: aggiungi anamnesi
    // allergie 0..1 and TODO: aggiungi anamnesi
    prestazioni 0..1 and
    confrontoPrecedentiEsamiEseguiti 0..1 and
    referto 0..1 and
    diagnosi 0..1 and
    suggerimentiPerMedicoPrescrittore 0..1 and
    accertamentiControlliConsigliati 0..1 and
    terapiaFarmacologicaConsigliata 0..1 and
    precedentiEsamiEseguiti 0..1

    
* section[pianoDiCura] ^sliceName = "pianoDiCura"
* section[pianoDiCura].code = $loinc#18776-5 (exactly)
* section[pianoDiCura].entry only Reference(CarePlanRelazioneTA)
* section[terapiaFarmacologicaConsigliata] ^sliceName = "terapiaFarmacologicaConsigliata"
* section[terapiaFarmacologicaConsigliata].entry only Reference(MedicationRequestTelemedicina)
* section[precedentiEsamiEseguiti] ^sliceName = "precedentiEsamiEseguiti"
* section[precedentiEsamiEseguiti].code = $loinc#30954-2 (exactly)
* section[precedentiEsamiEseguiti].entry only Reference(ObservationTelemedicina)
* section[prestazioni] ^sliceName = "prestazioni"
* section[prestazioni].code = $loinc#62387-6 (exactly)
* section[prestazioni].entry only Reference(EncounterTelemedicina)
* section[confrontoPrecedentiEsamiEseguiti] ^sliceName = "confrontoPrecedentiEsamiEseguiti"
* section[confrontoPrecedentiEsamiEseguiti].code = $loinc#93126-1 (exactly)
* section[confrontoPrecedentiEsamiEseguiti].entry only Reference(ObservationTelemedicina)
* section[diagnosi] ^sliceName = "diagnosi"
* section[diagnosi].code = $loinc#29548-5 (exactly)
* section[diagnosi].entry only Reference(ObservationTelemedicina)
* section[suggerimentiPerMedicoPrescrittore] ^sliceName = "suggerimentiPerMedicoPrescrittore"
* section[suggerimentiPerMedicoPrescrittore].code = $loinc#62385-0 (exactly)
* section[suggerimentiPerMedicoPrescrittore].entry only Reference(ObservationTelemedicina)
* section[accertamentiControlliConsigliati] ^sliceName = "accertamentiControlliConsigliati"
* section[accertamentiControlliConsigliati].code = $loinc#80615-8 (exactly)
* section[accertamentiControlliConsigliati].entry only Reference(ObservationTelemedicina)
* section[referto] ^sliceName = "referto"
* section[referto].entry only Reference(ObservationTelemedicina)
// * section[anamnesi] ^sliceName = "referto"
// * section[anamnesi].code = $loinc#80615-8 (exactly)
// * section[anamnesi].entry only Reference(ObservationTelemedicina)