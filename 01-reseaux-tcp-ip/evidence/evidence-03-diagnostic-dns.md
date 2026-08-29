# Evidence 03 - Diagnostic DNS

## Type de preuve

Evidence DNS public-safe et anonymisée.

## Module

`01-reseaux-tcp-ip`

## Date

2026-08-29

## Objectif

Démontrer une méthode de diagnostic DNS sans publier de sortie réelle de machine, d'employeur, de client ou d'environnement cloud.

## Commandes documentées

```bash
dig example.com
dig A example.com
dig AAAA example.com
dig MX example.com
dig TXT example.com
dig NS example.com
nslookup example.com
scutil --dns
```

## Résultats anonymisés attendus

```text
Domain tested: example.com
A record: <DNS_RESULT_EXAMPLE>
AAAA record: <DNS_RESULT_EXAMPLE>
MX record: <DNS_RESULT_EXAMPLE>
TXT record: <DNS_RESULT_EXAMPLE>
NS record: <DNS_RESULT_EXAMPLE>
Resolver: <DNS_RESOLVER_REDACTED>
Query time: <DNS_QUERY_TIME_EXAMPLE_MS>
TTL: <TTL_EXAMPLE>
Status: <DNS_STATUS_EXAMPLE>
```

## Tableau de preuve

| Élément observé | Valeur public-safe | Interprétation |
|---|---|---|
| Record A | `<DNS_RESULT_EXAMPLE>` | Vérifie la résolution IPv4. |
| Record AAAA | `<DNS_RESULT_EXAMPLE>` | Vérifie la résolution IPv6. |
| Record MX | `<DNS_RESULT_EXAMPLE>` | Vérifie la configuration mail. |
| Record TXT | `<DNS_RESULT_EXAMPLE>` | Vérifie une information texte ou validation. |
| Record NS | `<DNS_RESULT_EXAMPLE>` | Vérifie les serveurs autoritaires. |
| Resolver local | `<DNS_RESOLVER_REDACTED>` | Ne doit jamais être publié brut. |
| Statut DNS | `<DNS_STATUS_EXAMPLE>` | Aide à distinguer succès, NXDOMAIN ou timeout. |

## Données sensibles vérifiées : oui

- Aucun résultat réel de machine personnelle.
- Aucune IP publique personnelle.
- Aucune donnée Accenture.
- Aucune donnée client ou employeur.
- Aucun domaine interne.
- Aucun tenant ID, subscription ID ou account ID.
- Aucun token, secret, mot de passe ou fichier `.env`.
- Aucun screenshot sensible.

## Ce que cette preuve démontre

- Compréhension des records DNS principaux.
- Capacité à distinguer NXDOMAIN, timeout et réponse attendue.
- Capacité à utiliser `dig`, `nslookup` et `scutil --dns` avec prudence.
- Capacité à anonymiser les informations DNS avant publication.
- Utilité directe pour incident management et Cloud Operations.

## Comment réutiliser cette preuve en entretien

Cette preuve peut soutenir une réponse à la question : "Comment diagnostiquez-vous un problème DNS ?"

Réponse possible : vérifier d'abord si le problème touche la résolution ou la connectivité IP, tester les records nécessaires avec `dig`, comparer le statut DNS, tenir compte du TTL/cache, anonymiser les informations sensibles et escalader avec un signal précis.
