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
* entry[7].fullUrl = "http://example.org/fhir/'ServiceRequest/ServiceRequestTeleassistenzaExample"
* entry[7].resource = ServiceRequestTeleassistenzaExample

// * entry[8].fullUrl = "http://example.org/fhir/ActivityDefinition/actdef-tm-card"
// * entry[8].resource = actdef-tm-card
// * entry[8].fullUrl = "http://example.org/fhir/ActivityDefinition/actdef-teleass"
// * entry[8].resource = actdef-teleass

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
* attester[legalAuthenticator].mode = #legal
* attester[legalAuthenticator].time = "2023-02-25T12:45:00+01:00"
* attester[legalAuthenticator].party = Reference(PractitionerRole/practrole-bianchi-gom)
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
* activity[=].detail.instantiatesCanonical = Canonical(actdef-teleass)
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
* class = http://terminology.hl7.org/CodeSystem/v3-ActCode|9.0.0#VR "Virtual"
* subject = Reference(patient-mrossi)
* basedOn = Reference(ServiceRequestTeleassistenzaExample)
// * appointment = Reference(AppointmentTeleassistenzaExample)
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

Instance: actdef-teleass
InstanceOf: ActivityDefinitionTeleassistenza
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


Instance: AppointmentTeleassistenzaExample
InstanceOf: AppointmentTeleassistenza
Title: "Appuntamento Teleconsulto Cardiologica"
Description: "Esempio di appuntamento per teleconsulto cardiologica del paziente Mario Rossi"
Usage: #example
* id = "9c7e5f13-47bd-4a0a-a6bb-c9e39fd3a908"
* status = #booked
* identifier.value = "TV-20250709-001"
* created = "2025-07-01T09:00:00+01:00"
* start = "2025-07-09T10:00:00+01:00"
* end = "2025-07-09T10:30:00+01:00"
* basedOn = Reference(ServiceRequestTeleassistenzaExample)
* serviceCategory = http://terminology.hl7.org/CodeSystem/service-category|1.1.1#8 "Counselling"
* reasonCode = http://snomed.info/sct#3143004 "Visual field examination and evaluation, intermediate"
* reasonCode.text = "Teleconsulto cardiologica per controllo post-operatorio"
* participant[0].actor = Reference(patient-mrossi)
* participant[0].status = #accepted
* participant[1].actor = Reference(practrole-bianchi-gom)
* participant[1].status = #accepted

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

* entry[observation][7].fullUrl = "http://example.org/fhir/Observation/Observation-quesito"
* entry[observation][7].resource = Observation-quesito

* entry[allergyIntolerance][0].fullUrl = "http://example.org/fhir/AllergyIntolerance/1360bd6a-3855-48d3-aa33-96a9d961bb94"
* entry[allergyIntolerance][0].resource = AllergyIntoleranceTeleassistenzaExample

* entry[medicationStatement].fullUrl = "http://example.org/fhir/MedicationStatement/e62c9f1d-9c0b-4433-853b-06ec5074f19a"
* entry[medicationStatement].resource = MedicationStatement-terapia-corrente

* entry[observation][8].fullUrl = "http://example.org/fhir/Observation/c2a2b1ea-9d7e-41b9-83a5-cc2e71c0b865"
* entry[observation][8].resource = Observation-esame-obiettivo

* entry[serviceRequest].fullUrl = "http://example.org/fhir/'ServiceRequest/ServiceRequestTeleassistenzaExample"
* entry[serviceRequest].resource = ServiceRequestTeleassistenzaExample


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
* attester[legalAuthenticator].mode = #legal
* attester[legalAuthenticator].time = "2023-02-25T12:45:00+01:00"
* attester[legalAuthenticator].party = Reference(PractitionerRole/practrole-bianchi-gom)
* section[pianoDiCura].code = $loinc#18776-5
* section[pianoDiCura].title = "Piano di cura"
* section[pianoDiCura].entry[0] = Reference(CarePlan/careplan-rel-1)

* section[questitoDiagnostico].code = $loinc#29299-5
* section[questitoDiagnostico].title = "Quesito diagnostico"
* section[questitoDiagnostico].entry[0] = Reference(Observation/Observation-quesito)

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

* section[InquadramentoClinicoIniziale].title = "Inquadramento Clinico Iniziale"
* section[InquadramentoClinicoIniziale].code = $loinc#47039-3
* section[InquadramentoClinicoIniziale].section[anamnesi].code = $loinc#11329-0
* section[InquadramentoClinicoIniziale].section[anamnesi].title = "Anamnesi"
* section[InquadramentoClinicoIniziale].section[anamnesi].entry[0] = Reference(Observation/obs-anamnesi-1)
* section[InquadramentoClinicoIniziale].section[allergie].code = $loinc#48765-2
* section[InquadramentoClinicoIniziale].section[allergie].title = "Allergie"
* section[InquadramentoClinicoIniziale].section[allergie].entry[0] = Reference(AllergyIntolerance/1360bd6a-3855-48d3-aa33-96a9d961bb94)
* section[InquadramentoClinicoIniziale].section[terapiaFarmacologicaInAtto].code = $loinc#10160-0
* section[InquadramentoClinicoIniziale].section[terapiaFarmacologicaInAtto].title = "Terapia farmacologica in atto"
* section[InquadramentoClinicoIniziale].section[terapiaFarmacologicaInAtto].entry[0] = Reference(MedicationStatement/e62c9f1d-9c0b-4433-853b-06ec5074f19a)
* section[InquadramentoClinicoIniziale].section[esameObiettivo].code = $loinc#29545-1
* section[InquadramentoClinicoIniziale].section[esameObiettivo].title = "Esame obiettivo"
* section[InquadramentoClinicoIniziale].section[esameObiettivo].entry[0] = Reference(Observation/c2a2b1ea-9d7e-41b9-83a5-cc2e71c0b865)


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


Instance: Observation-quesito
InstanceOf: ObservationTeleassistenza
Description: "Esempio di quesito diagnostico nel contesto della teleassistenza"
Usage: #example
* id = "Observation-quesito"
* status = #final
* code = diagnosi-icd9cm#786.2 "TOSSE"
* subject = Reference(Patient/patient-mrossi)
* valueString = "Controllo post-COVID per tosse persistente"
* performer = Reference(PractitionerRole/practrole-bianchi-gom)
* effectiveDateTime = "2025-06-16T10:30:00+02:00"

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
* id = "1360bd6a-3855-48d3-aa33-96a9d961bb94"
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

Instance: MedicationStatement-terapia-corrente
InstanceOf: MedicationStatementTeleassistenza
Description: "Esempio di medicationStatement nel contesto della teleconsulto"
Usage: #example
* status = #active
* subject = Reference(Patient/patient-mrossi)
* medicationCodeableConcept = $sct#372729009 "Acyclovir"
* effectivePeriod.start = "2025-06-01"
* id = "e62c9f1d-9c0b-4433-853b-06ec5074f19a"

Instance: Observation-anamnesi
InstanceOf: ObservationTeleassistenzaNarrative
Description: "Esempio di anamnesi nel contesto della teleconsulto"
Usage: #example
* id = "84f911ee-b09d-4325-a3f3-a973a0c5ad8f"
* status = #final
* code = $loinc#11329-0
* subject = Reference(Patient/patient-mrossi)
* valueString = "Paziente con anamnesi positiva per bronchite cronica, non fumatore."
* performer = Reference(practrole-bianchi-gom)
* effectiveDateTime = "2025-06-16T10:30:00+02:00"


Instance: Observation-esame-obiettivo
InstanceOf: ObservationTeleassistenzaNarrative
Description: "Esempio di esame obiettivo nel contesto della teleconsulto"
Usage: #example
* status = #final
* code = $loinc#29545-1
* subject = Reference(Patient/patient-mrossi)
* valueString = "Durante la conversazione si rileva tosse secca intermittente."
* id = "c2a2b1ea-9d7e-41b9-83a5-cc2e71c0b865"
* performer = Reference(practrole-bianchi-gom)
* effectiveDateTime = "2025-06-16T10:30:00+02:00"

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


/*
 BundleRelazioneTeleassistenzaTransaction
*/

Instance: RelazioneDiTeleassistenzaTransaction
InstanceOf: BundleRelazioneTeleassistenzaTransaction
Usage: #example
Description: "Esempio di Bundle transaction per la Relazione di Teleassistenza: risorse amministrative via PUT, cliniche via POST."
* type = #transaction

// =====================
// AMMINISTRATIVE (PUT)
// =====================

* entry[patient].fullUrl = "http://example.org/fhir/Patient/patient-mrossi"
* entry[patient].resource = patient-mrossi
* entry[patient].request.method = #PUT
* entry[patient].request.url = "Patient/patient-mrossi"

* entry[practitionerRole].fullUrl = "http://example.org/fhir/PractitionerRole/practrole-bianchi-gom"
* entry[practitionerRole].resource = practrole-bianchi-gom
* entry[practitionerRole].request.method = #PUT
* entry[practitionerRole].request.url = "PractitionerRole/practrole-bianchi-gom"

* entry[organization].fullUrl = "http://example.org/fhir/Organization/org-assistenza"
* entry[organization].resource = org-assistenza
* entry[organization].request.method = #PUT
* entry[organization].request.url = "Organization/org-assistenza"

* entry[practitioner].fullUrl = "http://example.org/fhir/Practitioner/pract-bianchi"
* entry[practitioner].resource = pract-bianchi
* entry[practitioner].request.method = #PUT
* entry[practitioner].request.url = "Practitioner/pract-bianchi"


// ===============
// CLINICHE (POST)
// ===============

* entry[composition].fullUrl = "http://example.org/fhir/Composition/composition-rel-1"
* entry[composition].resource = composition-rel-1
* entry[composition].request.method = #POST
* entry[composition].request.url = "Composition"

* entry[carePlan].fullUrl = "http://example.org/fhir/CarePlan/careplan-rel-1"
* entry[carePlan].resource = careplan-rel-1
* entry[carePlan].request.method = #POST
* entry[carePlan].request.url = "CarePlan"

* entry[encounter].fullUrl = "http://example.org/fhir/Encounter/enc-tele-1"
* entry[encounter].resource = enc-tele-1
* entry[encounter].request.method = #POST
* entry[encounter].request.url = "Encounter"

* entry[medicationRequest].fullUrl = "http://example.org/fhir/MedicationRequest/medreq-terapia-1"
* entry[medicationRequest].resource = medreq-terapia-1
* entry[medicationRequest].request.method = #POST
* entry[medicationRequest].request.url = "MedicationRequest"

// ---- Observation (POST) ----
// 0: Anamnesi
* entry[observation][0].fullUrl = "http://example.org/fhir/Observation/obs-anamnesi-1"
* entry[observation][0].resource = obs-anamnesi-1
* entry[observation][0].request.method = #POST
* entry[observation][0].request.url = "Observation"

// 1: Confronto
* entry[observation][1].fullUrl = "http://example.org/fhir/Observation/obs-confronto-1"
* entry[observation][1].resource = obs-confronto-1
* entry[observation][1].request.method = #POST
* entry[observation][1].request.url = "Observation"

// 2: Referto
* entry[observation][2].fullUrl = "http://example.org/fhir/Observation/obs-referto-1"
* entry[observation][2].resource = obs-referto-1
* entry[observation][2].request.method = #POST
* entry[observation][2].request.url = "Observation"

// 3: Diagnosi (ICD9)
* entry[observation][3].fullUrl = "http://example.org/fhir/Observation/obs-dx-icd9"
* entry[observation][3].resource = obs-dx-icd9
* entry[observation][3].request.method = #POST
* entry[observation][3].request.url = "Observation"

// 4: Suggerimenti
* entry[observation][4].fullUrl = "http://example.org/fhir/Observation/obs-suggerimenti-1"
* entry[observation][4].resource = obs-suggerimenti-1
* entry[observation][4].request.method = #POST
* entry[observation][4].request.url = "Observation"

// 5: Accertamenti
* entry[observation][5].fullUrl = "http://example.org/fhir/Observation/obs-accertamenti-1"
* entry[observation][5].resource = obs-accertamenti-1
* entry[observation][5].request.method = #POST
* entry[observation][5].request.url = "Observation"

// 6: Precedenti
* entry[observation][6].fullUrl = "http://example.org/fhir/Observation/obs-precedenti-1"
* entry[observation][6].resource = obs-precedenti-1
* entry[observation][6].request.method = #POST
* entry[observation][6].request.url = "Observation"



Instance: ServiceRequestTeleassistenzaExample
InstanceOf: ServiceRequestTeleassistenza
Usage: #example
Title: "ServiceRequest Teleassistenza - Esempio"
Description: "Richiesta di teleassistenza domiciliare sincrona (video), con requisition impostato secondo l'invariante"
// Identificativi
* id = "ServiceRequestTeleassistenzaExample"
* identifier[0].system = "http://example.org/fhir/id/servicerequest"
* identifier[0].value = "SR-2025-000987"
* requisition.system = "http://www.acme.it/identifiers/requisition"
* requisition.value = "REQ-2025-000123"
* requisition.type = cs-tipo-ricetta#ND "Assistiti SASN con visita domiciliare"

* status = #active
* intent = #order
* priority = #routine
* category = csspecialityPractitionerRole#07 "Cardiochirurgia"

* code = http://snomed.info/sct#4914002 "Treatment planning for teletherapy"
* code.text = "Teleassistenza sincrona via video per monitoraggio paziente cronico"

// Dettagli ordine
* orderDetail[0].text = "Controllo parametri e counselling per scompenso cardiaco; include verifica aderenza terapeutica."
* quantityQuantity.value = 1

// Soggetto, encounter, tempi
* subject = Reference(Patient/patient-mrossi)
* occurrencePeriod.start = "2025-10-27T10:00:00+01:00"
* occurrencePeriod.end   = "2025-10-27T10:30:00+01:00"
* authoredOn = "2025-10-25T14:15:00+02:00"

// Richiedente ed esecutore
* requester = Reference(practrole-bianchi-gom)
* performer[0] = Reference(practrole-bianchi-gom)
* reasonCode[0].text = "Scompenso cardiaco cronico - follow-up teleassistito"
* note[0].text = "Paziente dotato di tablet aziendale; preferire fascia mattutina."


Instance: Device-Pulsossimetro-Esempio
InstanceOf: Deviceteleassistenza
Usage: #example
Title: "Pulsossimetro - Esempio"
Description: "Device di teleassistenza per monitoraggio SpO2"
* status = #active
* identifier[0].system = "http://example.org/fhir/id/device"
* identifier[0].value = "DEV-SPO2-0021"

* udiCarrier.deviceIdentifier = "98765432109876"
* udiCarrier.carrierHRF = "(01)98765432109876(21)SNSPO20021(10)BATCH9"

* manufacturer = "Meditech Italia S.r.l."
* manufactureDate = "2023-11-02"
* expirationDate = "2028-11-01"
* lotNumber = "BATCH9"
* serialNumber = "SNSPO20021"

* deviceName[0].name = "Meditech OxiCare Pro"
* deviceName[0].type = http://hl7.org/fhir/device-nametype#model-name "Model name"
