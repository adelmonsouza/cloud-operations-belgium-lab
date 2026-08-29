# Cloud Operations Belgium Lab

Laboratoire professionnel de préparation au métier d'Administrateur Systèmes et Cloud en Belgique - Azure, Linux, Windows Server, supervision, sécurité, automatisation et infrastructure as code.

Ce laboratoire documente ma progression vers un profil Cloud Operations / Administrateur Systèmes et Cloud, avec un focus sur l'administration, la supervision, l'automatisation, la sécurité opérationnelle et la fiabilité des environnements systèmes et cloud.

## Objectif professionnel

Ce dépôt accompagne une transition réaliste depuis un rôle Cloud & Infrastructure Support Engineer vers des fonctions plus orientées exploitation, plateforme et administration cloud :

- Cloud Operations Engineer
- Administrateur / Administratrice Systèmes et Cloud
- Platform Operations Engineer
- Infrastructure Operations Engineer
- Profil Azure, systèmes, monitoring et automatisation

L'objectif est de démontrer des compétences pratiques, documentées et vérifiables, sans prétendre à une expérience qui n'a pas encore été acquise en production.

## Pourquoi ce laboratoire existe

Le projet sert à centraliser l'apprentissage, produire des preuves techniques et préparer des échanges professionnels : formation, stage, entretiens, CV, LinkedIn et défense devant jury. Chaque module doit transformer une connaissance théorique en capacité opérationnelle démontrable.

Ce dépôt est une structure initiale : les labs seront ajoutés progressivement, tous les scénarios resteront fictifs et pédagogiques, et l'objectif est de construire des preuves concrètes vers un profil Cloud Operations en Belgique.

## Alignement avec la formation belge

Le dépôt est aligné avec une formation francophone belge d'Administrateur Systèmes et Cloud couvrant TCP/IP, Windows Server, PowerShell, Azure AZ-104, Microsoft 365, Linux, Bash, Docker, AWS Cloud Practitioner, Terraform, VMware vSphere, observabilité, sécurisation et laboratoire final.

Voir [PROGRAMME.md](PROGRAMME.md) pour la correspondance détaillée entre programme officiel, dossiers, compétences et preuves attendues.

## Compétences visées

- Administration réseau TCP/IP et diagnostic de connectivité.
- Administration Windows Server, Active Directory, DNS, DHCP et GPO.
- Automatisation PowerShell et Bash.
- Administration Linux serveur.
- Administration Azure orientée AZ-104.
- Concepts AWS Cloud Practitioner.
- Conteneurisation Docker et Docker Compose.
- Terraform et infrastructure as code.
- Virtualisation VMware vSphere au niveau conceptuel et opérationnel.
- Supervision, alerting, runbooks et gestion d'incidents.
- Sécurisation des systèmes et services.
- Documentation professionnelle en français.

## Structure du dépôt

- `00-orientation/` : positionnement professionnel, vocabulaire et trajectoire.
- `01-...` à `14-...` : modules techniques alignés avec la formation.
- `15-laboratoire-final-jury/` : projet final transversal pour une PME belge fictive.
- `30-jours-cloud-operations-belgique/` : défi structuré pour transformer 30 jours d'étude en preuves publiques et portfolio.
- `templates/` : modèles de labs, runbooks, incidents, RCA, evidence et défense.
- `portfolio/` : case studies, formulations CV et LinkedIn.
- `scripts/` : scripts de validation du dépôt.

## Règles de confidentialité

Ce dépôt est conçu pour être public-safe. Il ne doit jamais contenir :

- secrets, tokens, mots de passe, clés API ou fichiers `.env` ;
- données réelles d'employeur, client ou environnement interne ;
- screenshots sensibles ou informations confidentielles ;
- logs contenant des identifiants, adresses privées non anonymisées ou détails internes ;
- scripts destructifs ou contenu offensif de cybersécurité.

Tous les scénarios sont fictifs, anonymisés et pédagogiques. Les preuves doivent être nettoyées avant commit.

## Security-first public repository

Ce dépôt est public par design. Tout contenu doit être fictif, anonymisé et public-safe. Les labs réels ne doivent entrer dans le dépôt qu'après sanitization complète ; les outputs bruts, screenshots temporaires, notes privées et evidences non relues doivent rester hors du repo public, idéalement dans un espace privé séparé.

## Local workflow

Le travail local suit le flux `Sandbox -> Private notes -> Sanitized public lab -> Security scan -> Commit -> Push`. Voir [LOCAL_WORKFLOW.md](LOCAL_WORKFLOW.md) pour les chemins recommandés, les commandes quotidiennes, les outils locaux et les règles de publication public-safe.

## Comment lire le dépôt

1. Lire `README.md`, `PROGRAMME.md`, `ROADMAP.md` et `SECURITY.md`.
2. Parcourir les modules dans l'ordre de la roadmap.
3. Consulter les labs et evidence une fois ajoutés.
4. Utiliser `portfolio/` pour traduire les apprentissages en preuves professionnelles.
5. Vérifier la structure avec `scripts/validate-structure.sh`.

## Progression actuelle

Le module réseau est en cours avec les premiers labs TCP/IP publiés.

| Jour | Sujet | Journal | Lab | Evidence | Notes | Statut |
|---|---|---|---|---|---|---|
| 01 | Orientation Cloud Ops | [Journal](30-jours-cloud-operations-belgique/journal/jour-01-orientation-cloud-ops.md) | N/A | N/A | [Orientation](00-orientation/README.md) | Publié |
| 02 | TCP/IP diagnostic local | [Journal](30-jours-cloud-operations-belgique/journal/jour-02-tcp-ip-bases.md) | [Lab](01-reseaux-tcp-ip/labs/lab-01-diagnostic-reseau-local.md) | [Evidence](01-reseaux-tcp-ip/evidence/evidence-01-diagnostic-reseau-local.md) | N/A | Publié |
| 03 | Matrice diagnostic réseau | [Journal](30-jours-cloud-operations-belgique/journal/jour-03-matrice-diagnostic-reseau.md) | [Lab](01-reseaux-tcp-ip/labs/lab-02-matrice-diagnostic-reseau.md) | [Evidence](01-reseaux-tcp-ip/evidence/evidence-02-matrice-diagnostic-reseau.md) | [Notes](01-reseaux-tcp-ip/notes/matrice-diagnostic-reseau.md) | Publié |
| 04 | DNS diagnostic | [Journal](30-jours-cloud-operations-belgique/journal/jour-04-dns-resolution-noms.md) | [Lab](01-reseaux-tcp-ip/labs/lab-03-diagnostic-dns.md) | [Evidence](01-reseaux-tcp-ip/evidence/evidence-03-diagnostic-dns.md) | [Notes](01-reseaux-tcp-ip/notes/dns-resolution-noms.md) | Publié |
| 05 | DHCP / passerelle / adressage | [Journal](30-jours-cloud-operations-belgique/journal/jour-05-dhcp-passerelle-adressage.md) | [Lab](01-reseaux-tcp-ip/labs/lab-04-dhcp-passerelle-adressage.md) | [Evidence](01-reseaux-tcp-ip/evidence/evidence-04-dhcp-passerelle-adressage.md) | [Notes](01-reseaux-tcp-ip/notes/dhcp-passerelle-adressage.md) | Publié |
| 06 | Ports / firewall / connectivité | [Journal](30-jours-cloud-operations-belgique/journal/jour-06-ports-firewall-connectivite.md) | [Lab](01-reseaux-tcp-ip/labs/lab-05-ports-firewall-connectivite.md) | [Evidence](01-reseaux-tcp-ip/evidence/evidence-05-ports-firewall-connectivite.md) | [Notes](01-reseaux-tcp-ip/notes/ports-firewall-connectivite.md) | Done |
| 07 | Revue réseau et mini case study de troubleshooting | A créer | A créer | A créer | A créer | Planned |

## What This Repository Demonstrates

This repository demonstrates a structured learning path from infrastructure support toward Cloud Operations and Systems Administration. It focuses on operational documentation, reproducible labs, monitoring, automation, security hygiene, and practical evidence aligned with Belgian training expectations.

## English Summary

Cloud Operations Belgium Lab is a professional learning and portfolio repository aligned with a Belgian Systems and Cloud Administrator training programme. It covers TCP/IP, Windows Server, Linux, Azure AZ-104, Microsoft 365, AWS fundamentals, Docker, Terraform, VMware concepts, monitoring, security, automation and final jury preparation.

## Disclaimer

All scenarios, companies, users, systems, incidents and evidence in this repository are fictitious or anonymized for educational purposes. No employer, client or confidential data is allowed.
