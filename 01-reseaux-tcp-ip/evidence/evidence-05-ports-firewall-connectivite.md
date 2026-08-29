# Evidence 05 - Ports, firewall et connectivité applicative

## Type de preuve

Evidence public-safe sur le diagnostic de connectivité applicative.

## Module

`01-reseaux-tcp-ip`

## Date

2026-08-29

## Objectif

Démontrer une méthode de diagnostic permettant de relier port, firewall, service applicatif et incident Cloud Operations, sans publier de données réelles.

## Commandes documentées

```bash
nc -vz example.com 443
nc -vz example.com 80
curl -I https://example.com
lsof -iTCP -sTCP:LISTEN -n -P
netstat -an | grep LISTEN
```

## Résultats anonymisés attendus

```text
Target: example.com
Service: <SERVICE_NAME_EXAMPLE>
Port: <PORT_EXAMPLE>
Connectivity result: <CONNECTIVITY_RESULT_EXAMPLE>
HTTP status: <HTTP_STATUS_EXAMPLE>
Local listener: <PROCESS_NAME_REDACTED>
Firewall rule: <FIREWALL_RULE_EXAMPLE>
```

## Tableau de preuve

| Élément observé | Valeur public-safe | Interprétation |
|---|---|---|
| Port testé | `<PORT_EXAMPLE>` | Vérifie le point d'entrée du service. |
| Résultat connectivité | `<CONNECTIVITY_RESULT_EXAMPLE>` | Indique succès, timeout ou refus. |
| Statut HTTP | `<HTTP_STATUS_EXAMPLE>` | Ajoute un signal applicatif. |
| Listener local | `<PROCESS_NAME_REDACTED>` | Vérifie si un service écoute localement. |
| Règle firewall | `<FIREWALL_RULE_EXAMPLE>` | Indique une hypothèse allow/deny fictive. |

## Données sensibles vérifiées : oui

- Aucun scan de systèmes tiers.
- Aucun résultat réel de machine personnelle.
- Aucun hostname réel.
- Aucune IP publique personnelle.
- Aucune donnée Accenture.
- Aucune donnée client ou employeur.
- Aucun tenant ID, subscription ID ou account ID.
- Aucun token, secret, mot de passe ou fichier `.env`.
- Aucun screenshot sensible.

## Ce que cette preuve démontre

- Compréhension des ports TCP/UDP courants.
- Capacité à interpréter timeout, connection refused, port ouvert et port fermé.
- Capacité à distinguer réseau, firewall et application.
- Capacité à anonymiser les outputs de listeners locaux.
- Discipline défensive : pas de scan non autorisé.

## Comment réutiliser cette preuve en entretien

Cette preuve peut soutenir une réponse à la question : "Comment diagnostiquez-vous une application web inaccessible ?"

Réponse possible : vérifier DNS, tester le port attendu avec une destination autorisée, comparer `timeout` et `connection refused`, utiliser `curl -I` pour obtenir un signal applicatif, vérifier les listeners locaux si le service est local, puis escalader avec des observations précises.
