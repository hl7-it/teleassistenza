// ╭──────────────────────────────────────────────────────────────────────────────╮
// │  aliases.fsh – file centralizzato di tutti gli Alias del progetto            │
// ╰──────────────────────────────────────────────────────────────────────────────╯

// ── Identificatori / Sistemi standard ─────────────────────────────────────────
Alias: $loinc                   = http://loinc.org
Alias: $anpr                    = http://hl7.it/sid/anpr
Alias: $cf                      = http://hl7.it/sid/codiceFiscale
Alias: $icd-9-cm                = http://hl7.org/fhir/sid/icd-9-cm

// ── Terminologie HL7 ──────────────────────────────────────────────────────────
Alias: $v2-0203                 = http://terminology.hl7.org/CodeSystem/v2-0203|5.0.0
Alias: $v3-ActCode              = http://terminology.hl7.org/CodeSystem/v3-ActCode
Alias: $organization-type      = http://terminology.hl7.org/CodeSystem/organization-type
Alias: $observation-category   = http://terminology.hl7.org/CodeSystem/observation-category

// ── Estensioni FHIR core ──────────────────────────────────────────────────────
Alias: $patient-birthPlace              = http://hl7.org/fhir/StructureDefinition/patient-birthPlace
Alias: $iso21090-ADXP-streetName        = http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName
Alias: $iso21090-ADXP-streetNameBase    = http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetNameBase
Alias: $iso21090-ADXP-streetNameType    = http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetNameType
Alias: $iso21090-ADXP-houseNumber       = http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber
Alias: $iso21090-SC-coding              = http://hl7.org/fhir/StructureDefinition/iso21090-SC-coding

// ── StructureDefinitions IT ───────────────────────────────────────────────────
Alias: $Address                 = http://hl7.it/fhir/StructureDefinition/Address
Alias: $Organization_T1        = http://hl7.it/fhir/StructureDefinition/Organization_T1
Alias: $Organization_T2        = http://hl7.it/fhir/StructureDefinition/Organization_T2
Alias: $Organization_T3        = http://hl7.it/fhir/StructureDefinition/Organization_T3
Alias: $serviceRequest_tm      = http://hl7.it/fhir/StructureDefinition/ServiceRequestTeleassistenza
Alias: $CarePlan_PianoDiCura_TM = https://agenas.gov.it/fhir/StructureDefinition/CarePlan_PianoDiCura_TM
Alias: $Observation             = https://agenas.gov.it/fhir/StructureDefinition/Observation

// ── ValueSets IT ──────────────────────────────────────────────────────────────
Alias: $uri-idRegionali             = https://www.hl7.it/fhir/terminology/ValueSet/vs-anagrafi-regionali
Alias: $uri-idEni                   = https://www.hl7.it/fhir/terminology/ValueSet/VstipoIdentificatore
Alias: $uri-idStp                   = https://www.hl7.it/fhir/terminology/ValueSet/VstipoIdentificatore
Alias: $uri-idAslRegione            = https://www.hl7.it/fhir/terminology/ValueSet/uri-idAslRegione
Alias: $minsan-idStruttureInterne-vs = https://www.hl7.it/fhir/terminology/ValueSet/minsan-idStruttureInterne
Alias: $tipoCertificatore           = https://www.hl7.it/fhir/terminology/ValueSet/tipoCertificatore
Alias: $brancaPrestazione           = https://terminology.agenas.gov.it/ValueSet/brancaPrestazione
Alias: $specialityPractitionerRole  = https://terminology.agenas.gov.it/ValueSet/specialityPractitionerRole
Alias: $minsan-fls                  = https://terminology.agenas.gov.it/ValueSet/minsan-fls

// ── CodeSystems IT ────────────────────────────────────────────────────────────
Alias: $istat-dug               = https://www.hl7.it/fhir/terminology/CodeSystem/dug
Alias: $istat-DUG-CS            = https://www.hl7.it/fhir/terminology/CodeSystem/dug
Alias: $minsan-hsp              = https://www.hl7.it/fhir/terminology/CodeSystem/minsan-hsp
Alias: $cs-mds-idStruttureInterne = https://www.hl7.it/fhir/terminology/CodeSystem/cs-mds-idStruttureInterne
