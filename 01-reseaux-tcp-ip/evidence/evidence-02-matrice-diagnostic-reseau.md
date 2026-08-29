# Evidence 02 - Matrice de diagnostic réseau

## Type de preuve

Evidence documentaire public-safe.

## Module

`01-reseaux-tcp-ip`

## Date

2026-08-29

## Objectif

Démontrer une méthode structurée de diagnostic réseau adaptée à Cloud Operations.

## Preuve ajoutée

- Note : `01-reseaux-tcp-ip/notes/matrice-diagnostic-reseau.md`
- Lab : `01-reseaux-tcp-ip/labs/lab-02-matrice-diagnostic-reseau.md`
- Journal : `30-jours-cloud-operations-belgique/journal/jour-03-matrice-diagnostic-reseau.md`

## Tableau de preuve

| Élément | Valeur public-safe |
|---|---|
| Symptôme | DNS intermittent, latence, port inaccessible |
| Commandes | `dig`, `ping`, `traceroute`, `netstat`, `ifconfig`, `curl`, `nc` |
| Signaux | `<DNS_RESULT_EXAMPLE>`, `<LATENCY_EXAMPLE_MS>`, `<ROUTE_HOP_ANONYMIZED>` |
| Hypothèses | DNS, routage, firewall, service applicatif |
| Action suivante | Escalade documentée ou vérification complémentaire |

## Données sensibles vérifiées : oui

- Aucun résultat réel de machine personnelle.
- Aucune IP publique personnelle.
- Aucune donnée Accenture.
- Aucune donnée client ou employeur.
- Aucun tenant ID, subscription ID ou account ID.
- Aucun token, secret, mot de passe ou fichier `.env`.
- Aucun screenshot sensible.

## Ce que cette preuve démontre

- Capacité à structurer un diagnostic réseau.
- Capacité à relier symptômes, commandes, signaux, hypothèses et actions.
- Compréhension de la différence entre DNS, routage, firewall et application.
- Préparation à l'incident management.
- Discipline de publication public-safe.

## Comment réutiliser cette preuve en entretien

Cette preuve peut soutenir une réponse à la question : "Comment abordez-vous un incident réseau ou applicatif flou ?"

Réponse possible : commencer par transformer le symptôme en hypothèses testables, vérifier la couche locale, la connectivité IP, DNS, routage, filtrage et service applicatif, puis escalader avec des signaux concrets plutôt qu'une conclusion non prouvée.
