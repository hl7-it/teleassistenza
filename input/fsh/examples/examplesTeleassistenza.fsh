Alias: $loinc = http://loinc.org
Alias: $prestazioni = http://hl7.it/CodeSystem/prestazioni
Alias: $organization-type = http://terminology.hl7.org/CodeSystem/organization-type
Alias: $v3-ActCode = http://terminology.hl7.org/CodeSystem/v3-ActCode
Alias: $observation-category = http://terminology.hl7.org/CodeSystem/observation-category
Alias: $icd-9-cm = http://hl7.org/fhir/sid/icd-9-cm
Alias: $istat-DUG-CS = https://www.hl7.it/fhir/terminology/CodeSystem/dug

Instance: PianoDiTeleassistenza
InstanceOf: BundlePianoTeleassistenza
Usage: #example
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
* id = "careplan-tele-1"
* identifier.system = "http://hl7.it/identifiers/careplan"
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
* activity[=].detail.code = $prestazioni#TM-CARD-01 "Telemonitoraggio cardiologico"
* activity[=].detail.status = #scheduled
* activity[=].detail.scheduledTiming.repeat.frequency = 2
* activity[=].detail.scheduledTiming.repeat.period = 1
* activity[=].detail.scheduledTiming.repeat.periodUnit = #d
* activity[=].detail.description = "Rilevazione PA, FC, SpO2 due volte al giorno; fascia 08:00-10:00 e 18:00-20:00."
* activity[=].detail.performer = Reference(org-assistenza)
* activity[+].detail.kind = #ServiceRequest
//* activity[=].detail.instantiatesCanonical = "ActivityDefinition/actdef-teleass"
* activity[=].detail.code = $prestazioni#TEL-ASS-01 "Teleassistenza infermieristica"
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
* id = "obs-dx-icd9"
* status = #final
* category = $observation-category#social-history
* category.text = "Diagnosi"
* code = $icd-9-cm#428.0 "Insufficienza cardiaca congestizia"
* code.text = "Diagnosi principale"
* subject = Reference(patient-mrossi)
* effectiveDateTime = "2024-03-15"
* performer = Reference(practrole-bianchi-gom)
* valueCodeableConcept = $icd-9-cm#428.0 "Insufficienza cardiaca congestizia"
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
* code = $prestazioni#TM-CARD-01 "Telemonitoraggio cardiologico"

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
* code = $prestazioni#TEL-ASS-01 "Teleassistenza infermieristica"
