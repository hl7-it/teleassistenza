### Contesto e scenario di riferimento
La Telemedicina sta assumendo un ruolo sempre più centrale nell’evoluzione del sistema sanitario, rappresentando un’opportunità per migliorare l’accesso alle cure, ridurre i tempi di attesa e garantire una maggiore continuità assistenziale, in particolare per i pazienti con patologie croniche o residenti in aree geograficamente svantaggiate.

L’integrazione della Telemedicina nel Sistema Sanitario Nazionale (SSN) prevede la creazione di infrastrutture digitali interoperabili, capaci di gestire in modo efficiente la raccolta, l’elaborazione e la trasmissione dei dati clinici tra i diversi attori coinvolti: pazienti, medici di medicina generale, specialisti, ospedali, farmacie e servizi di emergenza

### Il dominio della Teleassistenza
La teleassistenza è un atto professionale che rientra nelle competenze specifiche della professione sanitaria di riferimento e si realizza attraverso un'interazione a distanza tra il professionista e il paziente o il caregiver. Il suo scopo principale è supportare la gestione della salute, promuovere il benessere e garantire la continuità assistenziale nel contesto domestico o nei luoghi di vita della persona, con particolare attenzione ai soggetti affetti da patologie croniche, situazioni di fragilità o condizioni di vulnerabilità.

La teleassistenza è generalmente programmata e ripetibile, in coerenza con piani di cura individualizzati costruiti attorno alle esigenze specifiche del paziente. Le sessioni si svolgono principalmente tramite videochiamata e possono includere la condivisione di dati clinici, referti, immagini diagnostiche e altri contenuti digitali rilevanti. Il professionista può inoltre avvalersi di piattaforme dedicate per somministrare questionari di monitoraggio, condividere materiali educativi e fornire indicazioni operative a supporto dell'autogestione della condizione di salute.

La teleassistenza può essere realizzata anche in collaborazione con professionisti dell'ambito sociale, nell'ottica di una presa in carico integrata, multiprofessionale e multidisciplinare, che tenga conto non solo degli aspetti clinici ma anche dei determinanti sociali della salute.


### Integrazione con i sistemi Regionali e Nazionali
L'integrazione con i sistemi sanitari regionali e nazionali è fondamentale per garantire un flusso di informazioni omogeneo e sicuro tra la Piattaforma di Telemedicina e le infrastrutture sanitarie esistenti.

Di seguito è riportato uno schema esemplificativo che illustra il flusso dei dati tra i diversi sistemi, evidenziando come le informazioni vengano trasferite e integrate all'interno della Piattaforma Nazionale di Telemedicina.

<img src="Flusso_Dati_PNT_IRT_v6.png" width="950"/>

<br clear="all"/>

I referti prodotti vengono prima validati dal Gateway, che assicura l'integrità e la conformità dei dati. Successivamente, i dati validati vengono archiviati e indicizzati nei registri nazionali e regionali. Il Gateway invia quindi le informazioni all'EDS, che a sua volta notifica la Piattaforma Nazionale di Telemedicina, garantendo una gestione centralizzata e conforme del flusso informativo.

### Scelte di design
La soluzione adottata da questa guida bilancia l'esigenza di rappresentare la documentazione della teleassistenza come documento clinico completo con la necessità di rendere disponibili in modo strutturato e interoperabile i dati clinici e amministrativi che la compongono.

A tal fine, è stato scelto di prevedere due differenti modalità di rappresentazione e scambio delle informazioni associate alla teleassistenza:
 - Bundle di tipo document, finalizzato alla condivisione e alla conservazione della documentazione di teleassistenza come documento clinico unitario.
 - Bundle di tipo transaction, finalizzato alla fruizione, all'elaborazione e al riutilizzo delle singole risorse FHIR che descrivono la prestazione e il relativo contenuto clinico.

Il bundle di tipo document consente di rappresentare la documentazione di teleassistenza come un insieme coerente di informazioni cliniche organizzate secondo il paradigma documentale di FHIR, favorendone la visualizzazione, la conservazione e la condivisione tra i diversi attori del processo assistenziale.
Il bundle di tipo transaction, invece, consente di accedere alle singole informazioni in forma strutturata, permettendo ai sistemi informativi di ricercare, elaborare e riutilizzare i dati clinici e amministrativi associati alla teleassistenza senza la necessità di interpretare l'intero documento.
Questa scelta progettuale consente di soddisfare contemporaneamente due esigenze complementari:
 - garantire la disponibilità della documentazione di teleassistenza come documento clinico formalmente condivisibile e conservabile;
 - favorire l'interoperabilità applicativa e la valorizzazione del patrimonio informativo attraverso la fruizione granulare delle risorse FHIR che compongono la documentazione.

L'adozione di entrambe le rappresentazioni permette quindi di supportare sia gli scenari orientati al documento sia gli scenari orientati ai dati, favorendo la continuità assistenziale, l'integrazione tra sistemi e il riutilizzo delle informazioni cliniche nel contesto dei servizi di teleassistenza.

<img src="design_teleassistenza.png" width="800"/>

<br clear="all"/>

### Autori e contributori
<table>
<thead>
<tr class="header">
<th>Ruolo</th>
<th>Nome</th>
<th>Organizzazione</th>
<th>Contatto</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>Autore</td>
<td>Leonardo Alcaro</td>
<td>HL7 Italia</td>
<td>leonardo.alcaro@regione.calabria.it</td>
</tr>
<tr class="even">
<td>Autore</td>
<td>Mario Sicuranza</td>
<td>HL7 Italia</td>
<td>mario.sicuranza@icar.cnr.it</td>
</tr>
<tr class="even">
<td>Autore</td>
<td>Sara Marceglia</td>
<td>Agenas</td>
<td>marceglia@agenas.it</td>
</tr>
<tr class="odd">
<td>Autore</td>
<td>Federica Dessì</td>
<td>Deloitte S.B. S.r.l.
 </td>
<td>fdessi@deloitte.it</td>
</tr>
<tr class="odd">
<td>Autore</td>
<td>Sonia Biasi</td>
<td>Deloitte S.B. S.r.l.
 </td>
<td>sbiasi@deloitte.it</td>
</tr>
<tr class="odd">
<td>Autore</td>
<td>Davide Spanu</td>
<td>Deloitte S.B. S.r.l.
 </td>
<td>dspanu@deloitte.it</td>
</tr>
<tr class="odd">
<td>Autore</td>
<td>William Tasinazzo</td>
<td>Deloitte S.B. S.r.l.
 </td>
<td>wtasinazzo@deloitte.it</td>
</tr>
<tr class="even">
<td>Autore</td>
<td>Maria Giovanna Antida Preziosi</td>
<td>SOGEI</td>
<td>mpreziosi@sogei.it</td>
</tr>
</tbody>
</table>

### Intellectual Property Statements
{% include ip-statements.xhtml %}

### Dependenciy table
{% include dependency-table.xhtml %}

#### Cross-Version Analysis
{% include cross-version-analysis.xhtml %}