# Ports, firewall et connectivité applicative

## Objectif

Comprendre comment vérifier qu'un service applicatif écoute sur un port attendu, et comment interpréter les signaux de connectivité dans un diagnostic Cloud Operations.

## Concepts clés

| Concept | Rôle opérationnel |
|---|---|
| Port TCP | Identifie un service accessible via une connexion fiable. |
| Port UDP | Identifie un service utilisant des datagrammes sans session persistante. |
| Socket | Association adresse, protocole et port. |
| Service applicatif | Processus qui écoute et répond aux clients. |
| Firewall local | Filtrage appliqué par la machine elle-même. |
| Firewall réseau | Filtrage appliqué par un routeur, firewall, NSG ou équipement réseau. |
| Allow rule | Autorise explicitement un flux. |
| Deny rule | Bloque explicitement un flux. |
| Timeout | Le client ne reçoit pas de réponse à temps. |
| Connection refused | La destination répond mais refuse la connexion sur ce port. |
| Port ouvert | Un service accepte ou répond sur le port. |
| Port fermé | Aucun service ne répond ou le port est refusé. |

## Ports courants à connaître

| Port | Service | Remarque |
|---|---|---|
| 22 | SSH | Administration distante Linux/Unix. |
| 53 | DNS | Résolution de noms, souvent UDP et parfois TCP. |
| 80 | HTTP | Web non chiffré. |
| 443 | HTTPS | Web chiffré, APIs et consoles cloud. |
| 3389 | RDP | Administration distante Windows. |

## Commandes sûres

```bash
nc -vz example.com 443
nc -vz example.com 80
curl -I https://example.com
lsof -iTCP -sTCP:LISTEN -n -P
netstat -an | grep LISTEN
```

## Règles de sécurité

- Ne pas scanner des IPs ou domaines inconnus.
- Utiliser uniquement `example.com`, `localhost` ou des placeholders.
- Ne pas publier d'output local brut.
- Anonymiser hostnames, ports internes, chemins, processus et IPs.
- Ne pas transformer ces commandes en scan offensif.

## Anonymisation

Remplacer les valeurs réelles par :

- `<HOSTNAME_REDACTED>`
- `<LOCAL_IP_ANONYMIZED>`
- `<PUBLIC_IP_REDACTED>`
- `<SERVICE_NAME_EXAMPLE>`
- `<PORT_EXAMPLE>`
- `<CONNECTIVITY_RESULT_EXAMPLE>`
- `<PROCESS_NAME_REDACTED>`
- `<FIREWALL_RULE_EXAMPLE>`

## Matrice opérationnelle

| Symptôme | Vérification | Signal | Hypothèse | Action |
|---|---|---|---|---|
| Application web inaccessible | `curl -I https://example.com` | Timeout | Réseau, firewall ou endpoint indisponible | Vérifier DNS, route et port 443 |
| Port 443 refusé | `nc -vz example.com 443` | Connection refused | Service HTTPS absent ou endpoint incorrect | Vérifier service applicatif |
| Port attendu absent localement | `lsof -iTCP -sTCP:LISTEN -n -P` | Pas de listener | Service arrêté ou mauvaise config | Vérifier processus et configuration |
| Listener présent mais accès externe échoue | `lsof`, `nc` depuis contexte autorisé | Local OK, distant KO | Firewall ou règle réseau | Vérifier allow/deny rules |
| HTTP OK mais HTTPS KO | `nc` sur 80 et 443 | 80 OK, 443 KO | TLS ou listener HTTPS absent | Vérifier certificat et service |

## Lien avec incident management

Documenter port, protocole, résultat, contexte de test et hypothèse permet une escalade précise. L'objectif n'est pas de prouver toute la cause racine immédiatement, mais de réduire le périmètre : réseau, firewall, système ou application.

## Limites

Ces commandes doivent rester limitées à des destinations autorisées. Elles ne remplacent pas les logs firewall, métriques applicatives, tests depuis plusieurs réseaux ou outils de supervision.
