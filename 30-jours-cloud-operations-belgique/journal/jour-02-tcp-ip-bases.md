# Jour 02 - Bases TCP/IP

## Objectif du jour

Créer le premier contenu technique réel du laboratoire avec un mini-lab public-safe sur les bases TCP/IP et le diagnostic réseau local.

## Pourquoi TCP/IP est important pour Cloud Operations

TCP/IP est au centre des opérations cloud et infrastructure : accès aux services, résolution DNS, routage, supervision, pare-feu, latence, disponibilité et diagnostic d'incidents. Un Cloud Operations Engineer doit savoir relier un symptôme utilisateur à une hypothèse réseau vérifiable.

## Concepts étudiés

- Adresse IP : identifiant logique d'une interface réseau.
- Masque de sous-réseau : information utilisée pour déterminer si une destination est locale ou distante.
- Passerelle : équipement ou route par défaut utilisé pour sortir du réseau local.
- DNS : service qui traduit un nom comme `example.com` en adresse IP.
- Route : chemin utilisé par le système pour atteindre une destination réseau.
- Latence : temps de réponse entre une source et une destination.
- Perte de paquets : paquets envoyés mais non reçus, souvent signe de congestion, filtrage ou instabilité.

## Mini-lab réalisé

Création du lab `01-reseaux-tcp-ip/labs/lab-01-diagnostic-reseau-local.md`, qui documente des commandes sûres sur macOS : `hostname`, `ifconfig`, `ipconfig getifaddr en0`, `netstat -rn`, `ping`, `dig` et `traceroute`.

## Preuve ajoutée

Création de `01-reseaux-tcp-ip/evidence/evidence-01-diagnostic-reseau-local.md` avec des résultats attendus anonymisés. Aucun résultat réel de machine personnelle n'est inclus.

## Question d'entretien

Comment diagnostiqueriez-vous un problème réseau local avant d'escalader vers une équipe cloud ou réseau ?

## Réflexion professionnelle

Ce premier lab montre une compétence opérationnelle simple mais essentielle : partir d'un symptôme réseau, utiliser des commandes sûres, anonymiser les résultats, puis expliquer ce que chaque signal prouve. C'est une base utile pour les rôles Cloud Operations, car beaucoup d'incidents commencent par une question de connectivité, DNS ou routage.

## Prochaine action

Compléter le jour 03 avec un lab de diagnostic réseau plus orienté interprétation : connectivité, DNS, route, latence et hypothèses d'incident fictif.
