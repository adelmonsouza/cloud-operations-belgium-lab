# Réseaux TCP/IP

## Objectif du module

Comprendre les fondamentaux TCP/IP nécessaires au diagnostic réseau et produire des preuves public-safe utiles pour Cloud Operations.

## Pourquoi ce module est important pour Cloud Operations
Le réseau est la base des incidents cloud, systèmes, DNS, VPN, accès applicatifs et supervision. Ce module vise à transformer une connaissance théorique en capacité opérationnelle démontrable.

## Compétences visées
- Lire une configuration IP.
- Comprendre sous-réseaux, passerelle, DNS et ports.
- Diagnostiquer une connectivité.
- Documenter une topologie simple.

## Labs prévus

- Diagnostic `ping`, `traceroute`, `nslookup` et `curl`.
- Analyse d'un incident DNS fictif.
- Schéma réseau d'une PME fictive.

## Labs disponibles

| Lab | Sujet | Statut |
|---|---|---|
| [Lab 01](labs/lab-01-diagnostic-reseau-local.md) | Diagnostic réseau local | Publié |
| [Lab 02](labs/lab-02-matrice-diagnostic-reseau.md) | Matrice de diagnostic réseau | Publié |
| [Lab 03](labs/lab-03-diagnostic-dns.md) | Diagnostic DNS | Publié |
| [Lab 04](labs/lab-04-dhcp-passerelle-adressage.md) | DHCP, passerelle et adressage | Publié |
| [Lab 05](labs/lab-05-ports-firewall-connectivite.md) | Ports, firewall et connectivité applicative | Publié |
| [Lab 06](labs/lab-06-revue-reseau-case-study.md) | Revue réseau et mini case study de troubleshooting | Publié |

## Preuves attendues

Commandes commentées, schémas, résultats anonymisés et mini-rapport de diagnostic.

## Evidences disponibles

- [Evidence 01 - Diagnostic réseau local](evidence/evidence-01-diagnostic-reseau-local.md)
- [Evidence 02 - Matrice de diagnostic réseau](evidence/evidence-02-matrice-diagnostic-reseau.md)
- [Evidence 03 - Diagnostic DNS](evidence/evidence-03-diagnostic-dns.md)
- [Evidence 04 - DHCP, passerelle et adressage](evidence/evidence-04-dhcp-passerelle-adressage.md)
- [Evidence 05 - Ports, firewall et connectivité applicative](evidence/evidence-05-ports-firewall-connectivite.md)
- [Evidence 06 - Revue réseau et mini case study](evidence/evidence-06-revue-reseau-case-study.md)

## Notes disponibles

- [Matrice de diagnostic réseau](notes/matrice-diagnostic-reseau.md)
- [DNS, résolution de noms et diagnostic opérationnel](notes/dns-resolution-noms.md)
- [DHCP, passerelle et attribution d'adresses](notes/dhcp-passerelle-adressage.md)
- [Ports, firewall et connectivité applicative](notes/ports-firewall-connectivite.md)
- [Revue réseau et troubleshooting](notes/revue-reseau-troubleshooting.md)

## Questions d'entretien possibles
Voir `interview-questions.md`.

## Lien vers les templates
Voir `../templates/`.

## Statut initial

En cours. Les jours 02 à 07 du défi sont publiés avec labs, evidences et notes réseau. Le Jour 07 consolide la première semaine avec une méthode de case study en couches.

## Prochaine étape

Jour 09 : troubleshooting Docker sur les échecs de mapping de ports, en réutilisant la méthode réseau du Jour 07.

## English Summary
This module covers TCP/IP fundamentals for operational network troubleshooting.
