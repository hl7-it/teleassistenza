Alias: $loinc = http://loinc.org
Alias: $prestazioni = http://hl7.it/fhir/teleassistenza/CodeSystem/CsCatalogoNazionalePrestazioni
Alias: $organization-type = http://terminology.hl7.org/CodeSystem/organization-type
Alias: $v3-ActCode = http://terminology.hl7.org/CodeSystem/v3-ActCode
Alias: $observation-category = http://terminology.hl7.org/CodeSystem/observation-category
Alias: $icd-9-cm = http://hl7.org/fhir/sid/icd-9-cm
Alias: $istat-DUG-CS = https://www.hl7.it/fhir/terminology/CodeSystem/dug

Instance: PianoDiTeleassistenza
InstanceOf: BundlePianoTeleassistenza
Usage: #example
Description: "Esempio di Bundle nel contesto del piano di teleassistenza."
* type = #document
* identifier.system = "urn:ietf:rfc:39861"
* identifier.value = "urn:uuid:bfcf00e2-e2bb-4a7d-adaa-3de9d419d27e"
* timestamp = "2023-02-25T14:30:00+01:00"
* timestamp = "2023-02-25T14:30:00+01:00"
* entry[0].fullUrl = "http://example.org/fhir/Composition/composition-pta-1"
* entry[0].resource = composition-pta-1
* entry[1].fullUrl = "http://example.org/fhir/CarePlan/careplan-tele-1"
* entry[1].resource = careplan-tele-1
* entry[2].fullUrl = "http://example.org/fhir/Patient/patient-mrossi"
* entry[2].resource = patient-mrossi
* entry[3].fullUrl = "http://example.org/fhir/PractitionerRole/practrole-bianchi-gom"
* entry[3].resource = practrole-bianchi-gom
* entry[4].fullUrl = "http://example.org/fhir/Organization/org-assistenza"
* entry[4].resource = org-assistenza
* entry[5].fullUrl = "http://example.org/fhir/Practitioner/pract-bianchi"
* entry[5].resource = pract-bianchi
* entry[6].fullUrl = "http://example.org/fhir/Encounter/enc-tele-1"
* entry[6].resource = enc-tele-1
* entry[7].fullUrl = "http://example.org/fhir/Observation/obs-dx-icd9"
* entry[7].resource = obs-dx-icd9
// * entry[8].fullUrl = "http://example.org/fhir/ActivityDefinition/actdef-tm-card"
// * entry[8].resource = actdef-tm-card
// * entry[9].fullUrl = "http://example.org/fhir/ActivityDefinition/actdef-teleass"
// * entry[9].resource = actdef-teleass

Instance: composition-pta-1
InstanceOf: CompositionPianoTA
Usage: #example
Description: "Esempio di Composition nel contesto del piano di teleassistenza."
* id = "composition-pta-1"
* status = #final
* type = $loinc#75496-0 "Telehealth Note"
* date = "2025-06-16T10:30:00+02:00"
* title = "Piano di Teleassistenza"
* subject = Reference(Patient/patient-mrossi)
* encounter = Reference(Encounter/enc-tele-1)
* author = Reference(PractitionerRole/practrole-bianchi-gom)
//* custodian = Reference(org-assistenza)
* section[pianoDiCura].title = "pianoDiCura"
* section[pianoDiCura].code = $loinc#18776-5
* section[pianoDiCura].entry = Reference(CarePlan/careplan-tele-1)
* section[diagnosi].title = "diagnosi"
* section[diagnosi].code = $loinc#29548-5
* section[diagnosi].entry = Reference(Observation/obs-dx-icd9)

Instance: careplan-tele-1
InstanceOf: CarePlanPianoDiCuraTeleassistenza
Usage: #example
Description: "Esempio di CarePlan nel contesto del piano di teleassistenza."
* id = "careplan-tele-1"
//* identifier.system = "http://hl7.it/identifiers/careplan"
* identifier.value = "TM-2025-000123"
* status = #active
* intent = #plan
* title = "Piano di Teleassistenza per Insufficienza cardiaca"
* subject = Reference(patient-mrossi)
* author = Reference(practrole-bianchi-gom)
* period.start = "2025-09-01"
* period.end = "2026-08-31"
* activity[0].detail.kind = #ServiceRequest
//* activity[=].detail.instantiatesCanonical = Reference(ActivityDefinition/actdef-tm-card)
* activity[=].detail.code = $prestazioni#88.78.4 "ECOGRAFIA OSTETRICA per studio della traslucenza nucale. Incluso: consulenza pre e post test combinato"
* activity[=].detail.status = #scheduled
* activity[=].detail.scheduledTiming.repeat.frequency = 2
* activity[=].detail.scheduledTiming.repeat.period = 1
* activity[=].detail.scheduledTiming.repeat.periodUnit = #d
* activity[=].detail.description = "Rilevazione PA, FC, SpO2 due volte al giorno; fascia 08:00-10:00 e 18:00-20:00."
* activity[=].detail.performer = Reference(org-assistenza)
* activity[+].detail.kind = #ServiceRequest
//* activity[=].detail.instantiatesCanonical = "ActivityDefinition/actdef-teleass"
* activity[=].detail.code = $prestazioni#88.78.4 "ECOGRAFIA OSTETRICA per studio della traslucenza nucale. Incluso: consulenza pre e post test combinato"
* activity[=].detail.status = #scheduled
* activity[=].detail.scheduledTiming.repeat.frequency = 1
* activity[=].detail.scheduledTiming.repeat.period = 1
* activity[=].detail.scheduledTiming.repeat.periodUnit = #wk
* activity[=].detail.description = "Contatto infermieristico settimanale (09:00-12:00)."
* activity[=].detail.performer = Reference(org-assistenza)
* note.text = "Regole: in caso di superamento soglie, contattare numero dedicato; seguire indicazioni terapeutiche."

Instance: patient-mrossi
InstanceOf: PatientTeleassistenza
Description: "Esempio di paziente nel contesto della televisita"
Usage: #example
* id = "patient-mrossi"
* extension[luogoNascita].valueAddress.extension[residenza].valueBoolean = true
* extension[luogoNascita].valueAddress.line[+].extension[odonimo].valueString = "Via della Vittoria"
* extension[luogoNascita].valueAddress.line[=].extension[houseNumber].valueString = "1"
* extension[luogoNascita].valueAddress.line[=] = "Via della Vittoria, 1"
* extension[luogoNascita].valueAddress.city = "Milano"
* extension[luogoNascita].valueAddress.state = "Italia"
* extension[luogoNascita].valueAddress.postalCode = "20100"
* extension[luogoNascita].valueAddress.country = "IT"
* identifier[codiceFiscale].system = "http://hl7.it/sid/codiceFiscale"
* identifier[codiceFiscale].value = "RSSMRA71E01F205E" 
* name.family = "Rossi"
* name.given = "Maria"
* telecom[0].system = #phone
* telecom[0].value = "3331245678"
* telecom[1].system = #email
* telecom[1].value = "maria.rossi@mail.com"
* birthDate = "1971-05-01"
* gender = #female
* address.city = "Milano"
* address.country = "IT"
* address.postalCode = "20100"
* address.line = "Via della Libertà, 52"
* address.use = #home
* address.state = "Italia"
* address.extension[residenza].valueBoolean = true
* address.extension[certificazioneIndirizzo].extension[who].valueCodeableConcept = https://www.hl7.it/fhir/terminology/CodeSystem/it-tipoEntita#gov
* address.line.extension[dugCode].valueCodeableConcept  = $istat-DUG-CS#67 "via"
* contact[0].name.family = "Rossi"
* contact[0].name.given = "Luigi"
* contact[1].name.family = "Bianchi"
* contact[1].name.given = "Maria"
* contact[0].relationship.coding.code = #C
* contact[0].relationship.coding.system = "http://terminology.hl7.org/CodeSystem/v2-0131"
* contact[0].relationship.coding.display = "Emergency Contact"
* contact[1].relationship.coding.code = #C
* contact[1].relationship.coding.system = "http://terminology.hl7.org/CodeSystem/v2-0131"
* contact[1].relationship.coding.display = "Emergency Contact"
* contact[0].telecom.system = #phone
* contact[0].telecom.value = "3312345567"
* contact[1].telecom.system = #phone
* contact[1].telecom.value = "3311234598"
//* generalPractitioner[mmgPlsRole] = Reference(PractitionerRoleTelevisitaExample)

Instance: practrole-bianchi-gom
InstanceOf: PractitionerRoleTeleassistenza
Description: "Esempio di practitionerRole nel contesto della televisita"
Usage: #example
* id = "practrole-bianchi-gom"
* organization = Reference(org-assistenza)
* practitioner = Reference(pract-bianchi)
//* specialty = CodeSystem_specialita_PractitionerRole#01 "Allergologia"

Instance: org-assistenza
InstanceOf: OrganizationT1
Title: "ASL Roma 1"
Description: "Esempio di Azienda Sanitaria Locale (ASL)"
Usage: #example
* id = "org-assistenza"
* name = "ASL Roma 1"
* identifier[asl].system = "http://hl7.it/sid/fls"
* identifier[asl].value = "120201"
* identifier[aslRegione].system = "https://www.hl7.it/fhir/terminology/ValueSet/uri-idAslRegione"
* identifier[aslRegione].value = "http://hl7.it/sid/lazio/asl"
* identifier[partitaIva].system = "http://hl7.it/sid/partitaIva"
* identifier[partitaIva].value = "12345678901"
* identifier[codiceFiscale].system = "http://hl7.it/sid/codiceFiscale"
* identifier[codiceFiscale].value = "01234567890"

Instance: pract-bianchi
InstanceOf: PractitionerTeleassistenza
Description: "Esempio di practitioner nel contesto della televisita"
Usage: #example
* id = "pract-bianchi"
* name.given = "John"
* name.family = "Doe"
* identifier[codiceFiscale].system = "http://hl7.it/sid/codiceFiscale"
* identifier[codiceFiscale].value = "DOEMRA80A01H501Z"

Instance: enc-tele-1
InstanceOf: EncounterTeleassistenza
Title: "Esempio di Encounter per televisita"
Description: "Esempio di incontro conforme al profilo EncounterTelevisitaExample"
Usage: #example
* id = "enc-tele-1"
* status = #finished
* class = http://terminology.hl7.org/CodeSystem/v3-ActCode|3.0.0#VR "Virtual"
* subject = Reference(patient-mrossi)
// * basedOn = Reference(ServiceRequestTelemedicinaExample)
// * appointment = Reference(AppointmentTelevisitaExample)
* period.start = "2025-06-16T09:00:00+02:00"
* period.end = "2025-06-16T09:45:00+02:00"
* identifier[codiceNosologico].system = "http://hl7.it/fhir/televisita/sid/codiceNosologico"
* identifier[codiceNosologico].value = "POD.123e4567-e89b-12d3-a456-426614174000"
* priority.coding[0].system = "http://terminology.hl7.org/CodeSystem/v3-ActPriority"
* priority.coding[0].code = #R
* priority.coding[0].display = "routine"
* participant[0].individual = Reference(pract-bianchi)
* serviceProvider = Reference(org-assistenza)

Instance: obs-dx-icd9
InstanceOf: ObservationTeleassistenza
Usage: #example
Description: "Esempio di Observation nel contesto del piano di teleassistenza."
* id = "obs-dx-icd9"
* status = #final
* category = $observation-category#social-history
* category.text = "Diagnosi"
* code = CodeSystem_DiagnosiICD9CM#428.0 "INSUFFICIENZA CARDIACA CONGESTIZIA NON SPECIFICATA (SCOMPENSO CARDIACO CONGESTIZIO NON SPECIFICATO)"
* code.text = "Diagnosi principale"
* subject = Reference(patient-mrossi)
* effectiveDateTime = "2024-03-15"
* performer = Reference(practrole-bianchi-gom)
* valueCodeableConcept = CodeSystem_DiagnosiICD9CM#428.0 "INSUFFICIENZA CARDIACA CONGESTIZIA NON SPECIFICATA (SCOMPENSO CARDIACO CONGESTIZIO NON SPECIFICATO)"
* valueCodeableConcept.text = "Insufficienza cardiaca congestizia"

Instance: actdef-tm-card
InstanceOf: ActivityDefinition
Usage: #example
* id = "actdef-tm-card"
* status = #active
* name = "TelemonitoraggioCardiologico"
* title = "Telemonitoraggio cardiologico domiciliare"
* kind = #ServiceRequest
* description = "Rilevazione PA, FC, SpO2 con device UDI; revisione parametri su piattaforma; gestione soglie."
* timingTiming.repeat.frequency = 2
* timingTiming.repeat.period = 1
* timingTiming.repeat.periodUnit = #d
* location.display = "Domicilio"
* code = $prestazioni#88.78.4 "ECOGRAFIA OSTETRICA per studio della traslucenza nucale. Incluso: consulenza pre e post test combinato"

Instance: actdef-teleass
InstanceOf: ActivityDefinition
Usage: #example
* id = "actdef-teleass"
* status = #active
* name = "TeleassistenzaInferm"
* title = "Teleassistenza infermieristica programmata"
* kind = #ServiceRequest
* description = "Contatto settimanale via telefono/video per valutazione clinica, educazione terapeutica, triage."
* timingTiming.repeat.frequency = 1
* timingTiming.repeat.period = 1
* timingTiming.repeat.periodUnit = #wk
* code = $prestazioni#88.78.4 "ECOGRAFIA OSTETRICA per studio della traslucenza nucale. Incluso: consulenza pre e post test combinato"


// Relazione di teleassistenza esempio

Instance: RelazioneDiTeleassistenza
InstanceOf: BundleRelazioneTeleassistenza
Usage: #example
Description: "Esempio di Bundle nel contesto della Relazione di Teleassistenza."
* type = #document
* identifier.system = "urn:ietf:rfc:39861"
* identifier.value = "urn:uuid:2e7fd4a4-d5a0-41db-96f9-8e9a45a6b4f2"
* timestamp = "2023-03-20T09:00:00+01:00"

* entry[composition].fullUrl = "http://example.org/fhir/Composition/composition-rel-1"
* entry[composition].resource = composition-rel-1

* entry[carePlan].fullUrl = "http://example.org/fhir/CarePlan/careplan-rel-1"
* entry[carePlan].resource = careplan-rel-1

* entry[patient].fullUrl = "http://example.org/fhir/Patient/patient-mrossi"
* entry[patient].resource = patient-mrossi

* entry[practitionerRole].fullUrl = "http://example.org/fhir/PractitionerRole/practrole-bianchi-gom"
* entry[practitionerRole].resource = practrole-bianchi-gom

* entry[organization].fullUrl = "http://example.org/fhir/Organization/org-assistenza"
* entry[organization].resource = org-assistenza

* entry[practitioner].fullUrl = "http://example.org/fhir/Practitioner/pract-bianchi"
* entry[practitioner].resource = pract-bianchi

* entry[encounter].fullUrl = "http://example.org/fhir/Encounter/enc-tele-1"
* entry[encounter].resource = enc-tele-1

* entry[medicationRequest].fullUrl = "http://example.org/fhir/MedicationRequest/medreq-terapia-1"
* entry[medicationRequest].resource = medreq-terapia-1

* entry[observation][0].fullUrl = "http://example.org/fhir/Observation/obs-anamnesi-1"
* entry[observation][0].resource = obs-anamnesi-1

* entry[observation][1].fullUrl = "http://example.org/fhir/Observation/obs-confronto-1"
* entry[observation][1].resource = obs-confronto-1

* entry[observation][1].fullUrl = "http://example.org/fhir/Observation/obs-referto-1"
* entry[observation][1].resource = obs-referto-1

* entry[observation][2].fullUrl = "http://example.org/fhir/Observation/obs-dx-icd9"
* entry[observation][2].resource = obs-dx-icd9

* entry[observation][3].fullUrl = "http://example.org/fhir/Observation/obs-suggerimenti-1"
* entry[observation][3].resource = obs-suggerimenti-1

* entry[observation][4].fullUrl = "http://example.org/fhir/Observation/obs-accertamenti-1"
* entry[observation][4].resource = obs-accertamenti-1

* entry[observation][5].fullUrl = "http://example.org/fhir/Observation/obs-precedenti-1"
* entry[observation][5].resource = obs-precedenti-1

* entry[observation][6].fullUrl = "http://example.org/fhir/Observation/obs-confronto-1"
* entry[observation][6].resource = obs-confronto-1




// * entry[activityDefinition][0].fullUrl = "http://example.org/fhir/ActivityDefinition/actdef-controllo-pressione"
// * entry[activityDefinition][0].resource = actdef-controllo-pressione


// ======================================================
// 1) CarePlanRelazioneTA
// ======================================================
Instance: careplan-rel-1
InstanceOf: CarePlanRelazioneTA
Usage: #example
Description: "CarePlan per la Relazione di Teleassistenza (follow-up del piano)."
* id = "careplan-rel-1"
* status = #active
* intent = #plan
* identifier.system = "urn:ietf:rfc:39861"
* identifier.value = "urn:uuid:5c8a6df2-5b7a-4f7f-8b2e-1f7f6b1c2d3e"
* category = csTipologiaPiano#02 "Piano di Teleassistenza"
* subject = Reference(Patient/patient-mrossi)
* author = Reference(PractitionerRole/practrole-bianchi-gom)
* period.start = "2023-03-01"
* period.end   = "2023-03-31"

// attività principali ricondotte a ServiceRequest/Task come tipo di attività
* activity[0].detail.kind = #ServiceRequest
* activity[0].detail.status = #completed
* activity[0].detail.description = "Revisione parametri domiciliari ultimi 14 giorni e video-consulto conclusivo."
* activity[1].detail.kind = #Task
* activity[1].detail.status = #in-progress
* activity[1].detail.description = "Educazione sanitaria: aderenza terapeutica e uso corretto saturimetro."

// ======================================================
// 2) CompositionRelazioneTeleassistenza
// ======================================================
Instance: composition-rel-1
InstanceOf: CompositionRelazioneTeleassistenza
Usage: #example
Description: "Relazione di Teleassistenza finale riferita al piano di mrossi."
* id = "composition-rel-1"
* status = #final
* type = $loinc#91531-4
* date = "2023-03-31T10:30:00+01:00"
* title = "Relazione di Teleassistenza"
* subject = Reference(Patient/patient-mrossi)
* encounter = Reference(Encounter/enc-tele-1)
* author[0] = Reference(PractitionerRole/practrole-bianchi-gom)

* section[pianoDiCura].code = $loinc#18776-5
* section[pianoDiCura].title = "Piano di cura"
* section[pianoDiCura].entry[0] = Reference(CarePlan/careplan-rel-1)

* section[anamnesi].code = $loinc#11329-0 
* section[anamnesi].title = "Anamnesi"
* section[anamnesi].entry[0] = Reference(Observation/obs-anamnesi-1)

* section[prestazioni].code = $loinc#62387-6
* section[prestazioni].title = "Prestazioni eseguite"
* section[prestazioni].entry[0] = Reference(Encounter/enc-tele-1)

* section[confrontoPrecedentiEsamiEseguiti].code = $loinc#93126-1
* section[confrontoPrecedentiEsamiEseguiti].title = "Confronto con precedenti esami eseguiti"
* section[confrontoPrecedentiEsamiEseguiti].entry[0] = Reference(Observation/obs-confronto-1)

* section[referto].code = $loinc#47045-0
* section[referto].title = "Referto"
* section[referto].entry[0] = Reference(Observation/obs-referto-1)

* section[diagnosi].code = $loinc#29548-5
* section[diagnosi].title = "Diagnosi"
* section[diagnosi].entry[0] = Reference(Observation/obs-dx-icd9)

* section[suggerimentiPerMedicoPrescrittore].code = $loinc#62385-0
* section[suggerimentiPerMedicoPrescrittore].title = "Suggerimenti per il Medico Prescrittore"
* section[suggerimentiPerMedicoPrescrittore].entry[0] = Reference(Observation/obs-suggerimenti-1)

* section[accertamentiControlliConsigliati].code = $loinc#80615-8
* section[accertamentiControlliConsigliati].title = "Accertamenti e controlli consigliati"
* section[accertamentiControlliConsigliati].entry[0] = Reference(Observation/obs-accertamenti-1)

* section[terapiaFarmacologicaConsigliata].code = $loinc#93341-6
* section[terapiaFarmacologicaConsigliata].title = "Terapia farmacologica consigliata"
* section[terapiaFarmacologicaConsigliata].entry[0] = Reference(MedicationRequest/medreq-terapia-1)

* section[precedentiEsamiEseguiti].code = $loinc#30954-2
* section[precedentiEsamiEseguiti].title = "Precedenti esami eseguiti"
* section[precedentiEsamiEseguiti].entry[0] = Reference(Observation/obs-precedenti-1)



// ======================================================
// 3) RISORSE DI SUPPORTO (Observation / MedicationRequest)
//    — profili: ObservationTeleassistenza, MedicationRequestTeleassistenza
//    — minime per popolare le section della Composition
// ======================================================

// --- ANAMNESI
Instance: obs-anamnesi-1
InstanceOf: ObservationTeleassistenza
Usage: #example
Description: "Anamnesi teleassistenza - mrossi."
* id = "obs-anamnesi-1"
* status = #final
* code.text = "Anamnesi sintetica del percorso di teleassistenza"
* subject = Reference(Patient/patient-mrossi)
* effectiveDateTime = "2023-03-30T09:00:00+01:00"
* valueString = "Paziente con BPCO lieve, nessuna riacutizzazione nell’ultimo mese."
* performer = Reference(practrole-bianchi-gom)

// --- CONFRONTO PRECEDENTI ESAMI
Instance: obs-confronto-1
InstanceOf: ObservationTeleassistenza
Usage: #example
Description: "Confronto con precedenti esami."
* id = "obs-confronto-1"
* status = #final
* code.text = "Confronto andamento SpO2/FC vs mese precedente"
* subject = Reference(Patient/patient-mrossi)
* effectiveDateTime = "2023-03-31T09:30:00+01:00"
* component[0].code.text = "Media SpO2 ultimi 14 giorni"
* component[0].valueQuantity.value = 96
* component[0].valueQuantity.unit = "%"
* component[1].code.text = "Media SpO2 mese precedente"
* component[1].valueQuantity.value = 95
* component[1].valueQuantity.unit = "%"
* performer = Reference(practrole-bianchi-gom)

// --- REFERTO
Instance: obs-referto-1
InstanceOf: ObservationTeleassistenza
Usage: #example
Description: "Referto conclusivo del percorso."
* id = "obs-referto-1"
* status = #final
* code.text = "Referto conclusivo teleassistenza"
* subject = Reference(Patient/patient-mrossi)
* effectiveDateTime = "2023-03-31T10:00:00+01:00"
* valueString = "Parametri nella norma. Non evidenza di desaturazioni notturne significative."
* performer = Reference(practrole-bianchi-gom)

// --- SUGGERIMENTI PER IL MEDICO PRESCRITTORE
Instance: obs-suggerimenti-1
InstanceOf: ObservationTeleassistenza
Usage: #example
Description: "Suggerimenti clinico-gestionali."
* id = "obs-suggerimenti-1"
* status = #final
* code.text = "Suggerimenti per MMG"
* subject = Reference(Patient/patient-mrossi)
* effectiveDateTime = "2023-03-31T10:05:00+01:00"
* valueString = "Rivalutare terapia inalatoria in prossima visita; mantenere telemonitoraggio trimestrale."
* performer = Reference(practrole-bianchi-gom)

// --- ACCERTAMENTI E CONTROLLI CONSIGLIATI
Instance: obs-accertamenti-1
InstanceOf: ObservationTeleassistenza
Usage: #example
Description: "Accertamenti/controlli consigliati."
* id = "obs-accertamenti-1"
* status = #final
* code.text = "Controlli consigliati"
* subject = Reference(Patient/patient-mrossi)
* effectiveDateTime = "2023-03-31T10:10:00+01:00"
* valueString = "Spirometria di controllo tra 6 mesi; valutazione fisioterapica respiratoria."
* performer = Reference(practrole-bianchi-gom)

// --- PRECEDENTI ESAMI ESEGUITI
Instance: obs-precedenti-1
InstanceOf: ObservationTeleassistenzaNarrative
Usage: #example
Description: "Precedenti esami rilevanti."
* id = "obs-precedenti-1"
* status = #final
* code.text = "Esami precedenti"
* subject = Reference(Patient/patient-mrossi)
* effectiveDateTime = "2023-02-15T11:00:00+01:00"
* valueString = "RX torace (negativo), Emogas analisi (nella norma)."
* performer = Reference(practrole-bianchi-gom)

// --- TERAPIA FARMACOLOGICA CONSIGLIATA
Instance: medreq-terapia-1
InstanceOf: MedicationRequestTeleassistenza
Usage: #example
Description: "Terapia farmacologica consigliata nella relazione."
* id = "medreq-terapia-1"
* status = #active
* medicationCodeableConcept.text = "Broncodilatatore a lunga durata + corticosteroide inalatorio"
* subject = Reference(Patient/patient-mrossi)
* authoredOn = "2023-03-31T10:15:00+01:00"
* requester = Reference(PractitionerRole/practrole-bianchi-gom)
* dosageInstruction[0].text = "1 inalazione mattino e sera; istruire su tecnica inalatoria."


//AllergyIntolerance

Instance: AllergyIntoleranceTeleassistenzaExample
InstanceOf: AllergyIntoleranceTeleassistenza
Title: "Esempio AllergyIntolerance per Teleassistenza"
Description: "Esempio di allergia/intolleranza codificata per il contesto Telemedicina"
Usage: #example

* clinicalStatus = http://terminology.hl7.org/CodeSystem/allergyintolerance-clinical#active
* verificationStatus = http://terminology.hl7.org/CodeSystem/allergyintolerance-verification#confirmed
* type = #allergy
* criticality = #high

* code = http://snomed.info/sct#91936005 "Allergy to penicillin"
* code.text = "Allergia alla penicillina"

* patient = Reference(Patient/patient-mrossi) "Mario Rossi"
* recordedDate = "2025-10-02T10:30:00+01:00"
* recorder = Reference(pract-bianchi) "Dr. Bianchi (Telemedicina)"

* reaction[0].manifestation[0] = http://snomed.info/sct#271807003 "Rash"
* reaction[0].manifestation[0].text = "Eruzione cutanea"
* reaction[0].severity = #severe


Instance: PresidioSandroPertini
InstanceOf: OrganizationT2
Title: "Presidio Sandro Pertini"
Description: "Presidio ospedaliero facente parte di ASL Roma 1"
Usage: #example
* id = "osp-pertini"
* name = "Ospedale Sandro Pertini"
* partOf = Reference(Organization/org-assistenza)
* identifier.system = "http://hl7.it/sid/hsp"
* identifier.value = "HSP00123"


Instance: UOCardiologiaPertini
InstanceOf: OrganizationT3
Title: "U.O. Cardiologia - Ospedale Pertini"
Description: "Unità Operativa di Cardiologia afferente all'Ospedale Pertini"
Usage: #example
* id = "uo-cardiologia-pertini"
* name = "U.O. Cardiologia"
* partOf = Reference(Organization/osp-pertini)
* identifier.system = "http://hl7.it/sid/hsp"
* identifier.value = "UO12345"


Instance: ProcedureTeleassistenzaExample
InstanceOf: ProcedureTeleassistenza
Title: "Esempio ProcedureTeleassistenza - Telemonitoraggio"
Description: "Esempio di procedura di teleassistenza: telemonitoraggio parametri vitali"
Usage: #example

* extension[ModalitaEsecuzioneProcedura].url = "http://hl7.org/fhir/StructureDefinition/procedure-method"
* extension[ModalitaEsecuzioneProcedura].valueCodeableConcept = http://snomed.info/sct#73761001 "Colonoscopy"

//* partOf = Reference(Observation/ObservationTeleassistenzaExample)

* status = #completed

* code.coding[0] = CsCatalogoNazionalePrestazioni#25.01 "BIOPSIA [AGOBIOPSIA] DELLA LINGUA"


* subject = Reference(Patient/patient-mrossi)

* performedPeriod.start = "2025-10-02T08:30:00+02:00"
* performedPeriod.end = "2025-10-02T08:45:00+02:00"

* recorder = Reference(pract-bianchi)
* performer[0].actor = Reference(pract-bianchi)
* performer[0].onBehalfOf = Reference(Organization/org-assistenza)

* outcome.text = "Parametri nella norma. Nessun evento avverso."
* note[0].text = "Sessione effettuata in videochiamata; misurazioni guidate."


//==========
// PianoDiTeleassistenzaTransaction
//==========
Instance: PianoDiTeleassistenzaTransaction
InstanceOf: BundlePianoTeleassistenzaTransaction
Usage: #example
Description: "Esempio di Bundle transaction per il piano di teleassistenza: admin=PUT, cliniche=POST"
* type = #transaction

// --- ADMIN (PUT) ---
* entry[0].fullUrl = "http://example.org/fhir/Patient/patient-mrossi"
* entry[0].resource = patient-mrossi
* entry[0].request.method = #PUT
* entry[0].request.url = "Patient/patient-mrossi"

* entry[+].fullUrl = "http://example.org/fhir/Practitioner/pract-bianchi"
* entry[=].resource = pract-bianchi
* entry[=].request.method = #PUT
* entry[=].request.url = "Practitioner/pract-bianchi"

* entry[+].fullUrl = "http://example.org/fhir/Organization/org-assistenza"
* entry[=].resource = org-assistenza
* entry[=].request.method = #PUT
* entry[=].request.url = "Organization/org-assistenza"

* entry[+].fullUrl = "http://example.org/fhir/PractitionerRole/practrole-bianchi-gom"
* entry[=].resource = practrole-bianchi-gom
* entry[=].request.method = #PUT
* entry[=].request.url = "PractitionerRole/practrole-bianchi-gom"

// --- CLINICHE (POST) ---
* entry[+].fullUrl = "http://example.org/fhir/Composition/composition-pta-1"
* entry[=].resource = composition-pta-1
* entry[=].request.method = #POST
* entry[=].request.url = "Composition"

* entry[+].fullUrl = "http://example.org/fhir/CarePlan/careplan-tele-1"
* entry[=].resource = careplan-tele-1
* entry[=].request.method = #POST
* entry[=].request.url = "CarePlan"

// Encounter (POST)
* entry[+].fullUrl = "http://example.org/fhir/Encounter/enc-tele-1"
* entry[=].resource = enc-tele-1
* entry[=].request.method = #POST
* entry[=].request.url = "Encounter"

// Observation (POST)
* entry[+].fullUrl = "http://example.org/fhir/Observation/obs-dx-icd9"
* entry[=].resource = obs-dx-icd9
* entry[=].request.method = #POST
* entry[=].request.url = "Observation"
