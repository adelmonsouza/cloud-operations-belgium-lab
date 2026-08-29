# Programme de formation et correspondance dépôt

Ce document relie le programme officiel de formation aux dossiers du dépôt, aux compétences attendues et aux preuves professionnelles à produire.

## Correspondance des modules

| Module officiel | Dossier du dépôt | Compétences visées | Preuves attendues | Valeur pour l'emploi | Certification liée |
|---|---|---|---|---|---|
| Orientation professionnelle | `00-orientation/` | Positionnement, vocabulaire, trajectoire Cloud Ops | Profil cible, objectifs, vocabulaire FR/EN | Clarifie le projet professionnel | N/A |
| Fondamentaux des réseaux TCP/IP | `01-reseaux-tcp-ip/` | IP, sous-réseaux, DNS, routage, diagnostic | Schémas, commandes, labs ping/traceroute/DNS | Base indispensable pour support infrastructure | N/A |
| Introduction à Windows Server | `02-windows-server-introduction/` | Installation, rôles, services, console serveur | Notes, captures anonymisées, checklist | Prépare l'administration Windows | N/A |
| Introduction à PowerShell | `03-powershell-introduction/` | Cmdlets, pipeline, scripts, objets | Scripts simples et validations | Automatisation Windows | N/A |
| Administration Windows Server | `04-administration-windows-server/` | AD DS, DNS, DHCP, GPO, comptes | Labs AD/DNS/DHCP/GPO | Compétence clé sysadmin | N/A |
| AZ-104 Microsoft Azure Administrator | `05-az-104-azure-administrator/` | Identité, compute, storage, network, monitoring | Labs Azure documentés, KQL, scripts | Profil Azure Administrator | AZ-104 |
| Microsoft 365 Administration | `06-microsoft-365-administration/` | Utilisateurs, groupes, licences, sécurité M365 | Labs conceptuels et checklists | Administration moderne workplace | N/A |
| Administration de serveurs Linux | `07-linux-server-administration/` | Services, utilisateurs, permissions, systemd | Labs Linux et commandes | Polyvalence systèmes | N/A |
| Scripting Bash | `08-bash-scripting/` | Shell, conditions, boucles, validation | Scripts non destructifs | Automatisation Linux | N/A |
| Introduction à la conteneurisation | `09-containerisation/` | Images, conteneurs, volumes, réseaux, Compose | Dockerfiles, Compose, evidence | Exploitation applicative moderne | N/A |
| AWS Cloud Practitioner Foundational | `10-aws-cloud-practitioner/` | Concepts cloud, services AWS, coûts, sécurité | Notes, mini-labs conceptuels | Culture multi-cloud | AWS Cloud Practitioner |
| Terraform | `11-terraform/` | IaC, state, modules, variables, plan/apply | Configurations safe, plans anonymisés | Automatisation infrastructure | N/A |
| VMware vSphere | `12-vmware-vsphere/` | Concepts VM, clusters, stockage, réseau | Labs théoriques, schémas | Compréhension hybride/on-prem | N/A |
| Observation et supervision | `13-observabilite-supervision/` | Logs, métriques, alertes, dashboards, runbooks | KQL, dashboards, incidents fictifs | Fiabilité et exploitation | N/A |
| Sécurisation systèmes et services | `14-securisation-systemes-services/` | Hardening, IAM, patching, vuln management | Checklists, runbooks, evidence | Secure by default | N/A |
| Laboratoire final avec jury | `15-laboratoire-final-jury/` | Architecture intégrée, défense orale, synthèse | Dossier final, preuves, présentation | Démonstration complète | N/A |

## Comment utiliser ce programme

Chaque module doit produire progressivement :

- des notes courtes et structurées ;
- un ou plusieurs labs reproductibles ;
- des preuves techniques dans `evidence/` ;
- des questions d'entretien et réponses préparées ;
- des liens vers des éléments du portfolio ou des formulations CV.

Les preuves doivent rester pédagogiques, anonymisées et compatibles avec une publication GitHub publique.
