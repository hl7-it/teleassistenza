Alias: $loinc = http://loinc.org

Profile: CompositionRelazioneTeleassistenza
Parent: Composition
Id: CompositionRelazioneTeleassistenza
Description: "Profilo della Composition utilizzata nel contesto della Relazione Finale di Teleassistenza."
* ^status = #draft
* title = "Relazione di Teleassistenza" (exactly)

* subject only Reference(PatientTeleassistenza)
* encounter only Reference(EncounterTeleassistenza)
* encounter ^short = "Contesto in cui è stato generato il documento."
* date ^short = "Data di modifica della risorsa."

* attester ^slicing.discriminator.type = #value
* attester ^slicing.discriminator.path = "mode"
* attester ^slicing.rules = #open
* attester ^short = "Professionisti che attestano la validità del documento."
* attester contains legalAuthenticator 1..1
* attester[legalAuthenticator].mode = #legal (exactly)
* attester[legalAuthenticator].time ^short = "Data di firma della relazione"
* attester[legalAuthenticator].time 1..
* attester[legalAuthenticator].party 1..
* attester[legalAuthenticator].party only Reference(PractitionerRoleTeleassistenza)

* author only Reference(PractitionerRoleTeleassistenza or OrganizationT1)
* author ^short = "Autore del Piano di Teleassistenza."

* title ^short = "Titolo del documento"
* title = "Relazione di Teleassistenza" (exactly)

* type = $loinc#91531-4 (exactly)
* section ^slicing.discriminator.type = #value
* section ^slicing.discriminator.path = "code"
* section ^slicing.rules = #open

* section contains
    pianoDiCura 1..1 and
    questitoDiagnostico 1..1 and
    InquadramentoClinicoIniziale 0..1 and
    //allergie 0..1 and 
    prestazioni 0..1 and
    confrontoPrecedentiEsamiEseguiti 0..1 and
    referto 0..1 and
    diagnosi 0..1 and
    suggerimentiPerMedicoPrescrittore 0..1 and
    accertamentiControlliConsigliati 0..1 and
    terapiaFarmacologicaConsigliata 0..1 and
    precedentiEsamiEseguiti 0..1 and 
    allegati 0..1
    
* section[pianoDiCura] ^sliceName = "pianoDiCura"
* section[pianoDiCura].code = $loinc#18776-5 (exactly)
* section[pianoDiCura].entry only Reference(CarePlanRelazioneTA)
* section[questitoDiagnostico] ^sliceName = "questitoDiagnostico"
* section[questitoDiagnostico].entry only Reference(ObservationTeleassistenza)
* section[questitoDiagnostico].code = $loinc#29299-5 (exactly)
* section[InquadramentoClinicoIniziale] ^sliceName = "InquadramentoClinicoIniziale"
* section[InquadramentoClinicoIniziale].code = $loinc#47039-3 (exactly)
* section[InquadramentoClinicoIniziale].section ^slicing.discriminator.type = #value
* section[InquadramentoClinicoIniziale].section ^slicing.discriminator.path = "code"
* section[InquadramentoClinicoIniziale].section ^slicing.rules = #open
* section[InquadramentoClinicoIniziale].section contains
    anamnesi 0..1 and
    allergie 0..* and
    terapiaFarmacologicaInAtto 0..* and
    esameObiettivo 0..1
* section[InquadramentoClinicoIniziale].section[anamnesi] ^sliceName = "anamnesi"
* section[InquadramentoClinicoIniziale].section[anamnesi].code = $loinc#11329-0  
* section[InquadramentoClinicoIniziale].section[anamnesi].entry only Reference(ObservationTeleassistenza)
//* section[InquadramentoClinicoIniziale].section[anamnesi] obeys sec-obs-code-match
* section[InquadramentoClinicoIniziale].section[allergie] ^sliceName = "allergie"
* section[InquadramentoClinicoIniziale].section[allergie].code = $loinc#48765-2 (exactly)
* section[InquadramentoClinicoIniziale].section[allergie].entry only Reference(AllergyIntoleranceTeleassistenza)
* section[InquadramentoClinicoIniziale].section[terapiaFarmacologicaInAtto] ^sliceName = "terapiaFarmacologicaInAtto"
* section[InquadramentoClinicoIniziale].section[terapiaFarmacologicaInAtto].code = $loinc#10160-0 (exactly)
* section[InquadramentoClinicoIniziale].section[terapiaFarmacologicaInAtto].entry only Reference(MedicationStatementTeleassistenza)
* section[InquadramentoClinicoIniziale].section[esameObiettivo] ^sliceName = "esameObiettivo"
* section[InquadramentoClinicoIniziale].section[esameObiettivo].code = $loinc#29545-1 (exactly)
* section[InquadramentoClinicoIniziale].section[esameObiettivo].entry only Reference(ObservationTeleassistenzaNarrative)

* section[terapiaFarmacologicaConsigliata] ^sliceName = "terapiaFarmacologicaConsigliata"
* section[terapiaFarmacologicaConsigliata].entry only Reference(MedicationRequestTeleassistenza)
* section[terapiaFarmacologicaConsigliata].code = $loinc#93341-6  
* section[precedentiEsamiEseguiti] ^sliceName = "precedentiEsamiEseguiti"
* section[precedentiEsamiEseguiti].code = $loinc#30954-2 (exactly)
* section[precedentiEsamiEseguiti].entry only Reference(ObservationTeleassistenza)
* section[prestazioni] ^sliceName = "prestazioni"
* section[prestazioni].code = $loinc#62387-6 (exactly)
* section[prestazioni].entry only Reference(EncounterTeleassistenza)
* section[confrontoPrecedentiEsamiEseguiti] ^sliceName = "confrontoPrecedentiEsamiEseguiti"
* section[confrontoPrecedentiEsamiEseguiti].code = $loinc#93126-1 (exactly)
* section[confrontoPrecedentiEsamiEseguiti].entry only Reference(ObservationTeleassistenza)
* section[diagnosi] ^sliceName = "diagnosi"
* section[diagnosi].code = $loinc#29548-5 (exactly)
* section[diagnosi].entry only Reference(ObservationTeleassistenza)
* section[suggerimentiPerMedicoPrescrittore] ^sliceName = "suggerimentiPerMedicoPrescrittore"
* section[suggerimentiPerMedicoPrescrittore].code = $loinc#62385-0 (exactly)
* section[suggerimentiPerMedicoPrescrittore].entry only Reference(ObservationTeleassistenza)
* section[accertamentiControlliConsigliati] ^sliceName = "accertamentiControlliConsigliati"
* section[accertamentiControlliConsigliati].code = $loinc#80615-8 (exactly)
* section[accertamentiControlliConsigliati].entry only Reference(ObservationTeleassistenzaNarrative)
* section[referto] ^sliceName = "referto"
* section[referto].entry only Reference(ObservationTeleassistenza)
* section[referto].code = $loinc#47045-0  
* section[allegati] ^sliceName = "allegati"
* section[allegati].entry only Reference(DocumentReference or Binary or Media)
* section[allegati].code = $loinc#77599-9  