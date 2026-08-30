# Plan - 30 Jours Cloud Operations Belgique

Le tableau ci-dessous représente le plan pédagogique initial. Il conserve le bloc Windows Server comme étape prévue de formation, mais l'ordre réel de publication a évolué pour publier d'abord les preuves réseau et un premier lab Docker local.

| Jour | Thème | Objectif | Livrable | Module associé | Preuve attendue | Question d'entretien |
|---|---|---|---|---|---|---|
| 1 | Orientation Cloud Operations | Clarifier le positionnement professionnel | Journal jour 1 | `00-orientation/` | Objectif et trajectoire écrits | Pourquoi voulez-vous évoluer vers Cloud Operations ? |
| 2 | TCP/IP bases | Revoir IP, masque, passerelle | Note courte | `01-reseaux-tcp-ip/` | Exemple de configuration anonymisée | Comment expliquer IP, masque et passerelle ? |
| 3 | Diagnostic réseau | Tester connectivité et routes | Mini-lab diagnostic | `01-reseaux-tcp-ip/` | Commandes `ping`/`traceroute` commentées | Que vérifiez-vous si un serveur ne répond pas ? |
| 4 | DNS | Comprendre résolution de noms | Note et commandes | `01-reseaux-tcp-ip/` | Résultats DNS anonymisés | Comment diagnostiquer un problème DNS ? |
| 5 | DHCP | Comprendre attribution d'adresses | Schéma simple | `04-administration-windows-server/` | Schéma DHCP fictif | A quoi sert DHCP en entreprise ? |
| 6 | Ports et firewall | Relier services, ports et filtrage | Checklist | `01-reseaux-tcp-ip/` | Tableau ports/services | Comment vérifier qu'un port est ouvert ? |
| 7 | Revue semaine 1 | Consolider réseau et orientation | Journal hebdomadaire | `JOURNAL.md` | Synthèse semaine 1 | Quelle preuve réseau pouvez-vous montrer ? |
| 8 | Windows Server (bloc pédagogique initial) | Identifier rôles serveur | Note structurée | `02-windows-server-introduction/` | Checklist rôles | Quels rôles Windows Server sont courants ? |
| 9 | Services Windows (bloc pédagogique initial) | Comprendre services et état | Procédure | `02-windows-server-introduction/` | Checklist service | Comment vérifier un service Windows ? |
| 10 | PowerShell bases | Comprendre cmdlets et pipeline | Script simple | `03-powershell-introduction/` | Script non destructif | Pourquoi PowerShell est utile pour l'administration ? |
| 11 | PowerShell reporting | Produire un inventaire pédagogique | Mini-script | `03-powershell-introduction/` | Sortie anonymisée | Comment gérez-vous les erreurs dans un script ? |
| 12 | Active Directory concepts | Comprendre domaine, OU, users, groups | Note conceptuelle | `04-administration-windows-server/` | Schéma AD fictif | Quel est le rôle d'Active Directory ? |
| 13 | DNS/DHCP Windows | Relier services réseau et domaine | Note | `04-administration-windows-server/` | Schéma service | Comment DNS soutient Active Directory ? |
| 14 | Revue semaine 2 | Consolider Windows et PowerShell | Journal hebdomadaire | `JOURNAL.md` | Synthèse semaine 2 | Quelle automatisation Windows pouvez-vous expliquer ? |
| 15 | Linux bases | Revoir utilisateurs, fichiers, services | Note Linux | `07-linux-server-administration/` | Commandes anonymisées | Comment vérifier un service Linux ? |
| 16 | Logs Linux | Lire journaux et diagnostiquer | Mini-lab logs | `07-linux-server-administration/` | Extrait anonymisé | Comment utilisez-vous les logs pendant un incident ? |
| 17 | Bash bases | Créer script sûr | Script Bash | `08-bash-scripting/` | Script avec `set -euo pipefail` | Pourquoi valider les entrées d'un script ? |
| 18 | Bash checks | Automatiser un contrôle local | Mini-script | `08-bash-scripting/` | Sortie de test | Comment éviter un script destructif ? |
| 19 | Docker | Comprendre image, conteneur, logs | Note et commandes | `09-containerisation/` | Commandes Docker pédagogiques | Différence entre image et conteneur ? |
| 20 | GitHub Actions | Comprendre validation CI | Note workflow | `.github/workflows/` | Explication du workflow | Pourquoi valider automatiquement un dépôt ? |
| 21 | Revue semaine 3 | Consolider Linux, Bash, Docker, CI | Journal hebdomadaire | `JOURNAL.md` | Synthèse semaine 3 | Quelle preuve d'automatisation pouvez-vous montrer ? |
| 22 | Azure fundamentals | Revoir ressources, régions, groupes | Note AZ-104 | `05-az-104-azure-administrator/` | Carte concepts Azure | Comment organisez-vous les ressources Azure ? |
| 23 | Azure IAM | Comprendre Entra ID et RBAC | Checklist IAM | `05-az-104-azure-administrator/` | Matrice fictive | Différence entre identité et RBAC ? |
| 24 | Azure networking | Revoir VNet, subnet, NSG | Schéma | `05-az-104-azure-administrator/` | Schéma VNet fictif | Comment sécuriser un réseau Azure ? |
| 25 | Azure Monitor | Comprendre métriques et alertes | Note supervision | `13-observabilite-supervision/` | Exemple d'alerte fictive | Comment définir une alerte utile ? |
| 26 | Log Analytics/KQL | Lire une requête KQL simple | Fichier KQL | `13-observabilite-supervision/` | Requête pédagogique | A quoi sert KQL en opérations cloud ? |
| 27 | Incident management | Documenter un incident fictif | Rapport incident | `13-observabilite-supervision/` | Timeline et RCA courte | Comment structurez-vous une investigation ? |
| 28 | Terraform et AWS basics | Relier IaC et culture multi-cloud | Note comparative | `10-aws-cloud-practitioner/`, `11-terraform/` | Tableau Azure/AWS/Terraform | Différence entre `plan` et `apply` ? |
| 29 | Security hardening et runbooks | Formaliser sécurité opérationnelle | Checklist et runbook | `14-securisation-systemes-services/` | Checklist public-safe | Qu'est-ce que le moindre privilège ? |
| 30 | Final review et portfolio | Relier preuves, final lab et employabilité | Synthèse portfolio | `15-laboratoire-final-jury/`, `portfolio/` | Liste de preuves prioritaires | Quelle progression ce dépôt démontre-t-il ? |

## Ordre réel publié à ce jour

Cette section suit les contenus effectivement publiés dans le dépôt. Le Jour 07 correspond à la revue réseau, le Jour 08 au lab Docker Nginx local et le Jour 09 reste planifié. Windows Server et Active Directory restent des blocs d'infrastructure prévus ultérieurement; ils ne sont pas présentés comme le contenu publié du Jour 08.

| Jour | Sujet publié | Journal | Lab | Evidence | Notes | Statut |
|---|---|---|---|---|---|---|
| 07 | Revue réseau et mini case study de troubleshooting | [Journal](journal/jour-07-revue-reseau-case-study.md) | [Lab](../01-reseaux-tcp-ip/labs/lab-06-revue-reseau-case-study.md) | [Evidence](../01-reseaux-tcp-ip/evidence/evidence-06-revue-reseau-case-study.md) | [Notes](../01-reseaux-tcp-ip/notes/revue-reseau-troubleshooting.md) | Done |
| 08 | Docker Nginx local | [Journal](journal/jour-08-docker-nginx-local.md) | [Lab](../08-docker-conteneurs/labs/lab-01-nginx-local-port-mapping.md) | [Evidence](../08-docker-conteneurs/evidence/evidence-01-nginx-local-port-mapping.md) | [Notes](../08-docker-conteneurs/notes/docker-nginx-local.md) | Done |
| 09 | Docker port mapping failures and troubleshooting | A créer | A créer | A créer | A créer | Planned |
