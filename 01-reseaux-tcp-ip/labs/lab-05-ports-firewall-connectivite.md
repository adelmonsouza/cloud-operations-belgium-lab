# Lab 05 - Ports, firewall et connectivité applicative

## Module associé

`01-reseaux-tcp-ip`

## Objectif

Documenter une méthode public-safe pour vérifier si un service applicatif est joignable, si un port répond, et si l'hypothèse principale est réseau, firewall ou application.

## Contexte fictif

Une application web de `<FAKE_COMPANY_EXAMPLE>` n'est pas accessible depuis un poste utilisateur. L'équipe Cloud Operations doit vérifier si le nom DNS répond, si le port web est joignable, et si un service local ou distant semble écouter sur le port attendu.

## Pré-requis

- macOS avec Terminal.
- Utiliser uniquement `example.com`, `localhost` ou des placeholders.
- Ne pas scanner de systèmes tiers.
- Ne pas publier d'output local brut.
- Ne pas inclure de hostname réel, IP publique personnelle, données employeur ou données client.

## Commandes sûres

```bash
nc -vz example.com 443
nc -vz example.com 80
curl -I https://example.com
lsof -iTCP -sTCP:LISTEN -n -P
netstat -an | grep LISTEN
```

## Explication des commandes

| Commande | Utilité |
|---|---|
| `nc -vz example.com 443` | Vérifie si le port HTTPS d'un domaine public d'exemple est joignable. |
| `nc -vz example.com 80` | Vérifie si le port HTTP d'un domaine public d'exemple est joignable. |
| `curl -I https://example.com` | Récupère uniquement les en-têtes HTTP pour vérifier la réponse applicative. |
| `lsof -iTCP -sTCP:LISTEN -n -P` | Liste les ports TCP en écoute localement ; sortie à anonymiser. |
| `netstat -an | grep LISTEN` | Alternative pour observer les sockets en écoute. |

## Important

Ces commandes ne doivent pas être utilisées pour scanner des IPs, plages réseau ou domaines inconnus. Le lab est défensif et pédagogique : il sert à comprendre les signaux de connectivité, pas à découvrir des services sur des systèmes tiers.

## Comment anonymiser les sorties

Remplacer toute valeur réelle :

```text
Hostname: <HOSTNAME_REDACTED>
Local IP: <LOCAL_IP_ANONYMIZED>
Public IP: <PUBLIC_IP_REDACTED>
Service: <SERVICE_NAME_EXAMPLE>
Port: <PORT_EXAMPLE>
Process: <PROCESS_NAME_REDACTED>
Connectivity result: <CONNECTIVITY_RESULT_EXAMPLE>
Firewall rule: <FIREWALL_RULE_EXAMPLE>
```

Ne jamais publier :

- listeners locaux bruts ;
- noms de processus sensibles ;
- hostnames réels ;
- IP publique personnelle ;
- domaines ou endpoints professionnels ;
- règles firewall réelles d'un employeur ou client.

## Tableau symptôme / commande / signal / hypothèse / action

| Symptôme | Commande | Signal observé | Hypothèse | Action recommandée |
|---|---|---|---|---|
| Application inaccessible | `curl -I https://example.com` | Timeout | Réseau, firewall ou endpoint indisponible | Vérifier DNS, route et port |
| Connexion refusée | `nc -vz example.com 443` | Connection refused | Hôte joignable mais service absent | Vérifier service applicatif |
| Port ouvert | `nc -vz example.com 443` | Connexion réussie | Réseau et port OK | Vérifier couche HTTP/TLS/applicative |
| Aucun listener local | `lsof -iTCP -sTCP:LISTEN -n -P` | Port attendu absent | Service non démarré | Vérifier processus et logs |
| Listener local présent, accès distant KO | `lsof`, `netstat`, `nc` | Local OK, distant KO | Firewall local ou réseau | Vérifier règles allow/deny |

## Scénario fictif

L'utilisateur indique que `<SERVICE_NAME_EXAMPLE>` ne répond pas. DNS retourne `<DNS_RESULT_EXAMPLE>`. Le test `nc` vers `<PORT_EXAMPLE>` retourne `<CONNECTIVITY_RESULT_EXAMPLE>`, tandis que `curl -I` retourne `<HTTP_STATUS_EXAMPLE>`. L'équipe Cloud Operations documente ces signaux pour distinguer un problème de port, firewall ou application.

## Exemples fictifs

| Exemple | DNS | Port | Signal applicatif | Interprétation |
|---|---|---|---|---|
| DNS OK, port 443 accessible | `<DNS_RESULT_EXAMPLE>` | 443 accessible | `<HTTP_STATUS_EXAMPLE>` | Réseau et port semblent OK ; vérifier application ou TLS si erreur HTTP. |
| DNS OK, port fermé | `<DNS_RESULT_EXAMPLE>` | Connection refused | Pas de réponse applicative | Service absent, arrêté ou mauvais endpoint. |
| DNS OK, timeout | `<DNS_RESULT_EXAMPLE>` | Timeout | Pas de réponse | Filtrage firewall, routage ou endpoint indisponible. |
| Port local en écoute | N/A | `<PORT_EXAMPLE>` en LISTEN | Processus présent | Service local démarré ; vérifier accès externe si nécessaire. |
| Service arrêté | N/A | Port absent | Aucun listener | Démarrer ou corriger le service avant diagnostic réseau. |

## Erreurs fréquentes de diagnostic

- Penser qu'un port ouvert prouve que l'application fonctionne.
- Penser qu'un timeout prouve forcément que le firewall bloque.
- Ignorer la différence entre port fermé et service applicatif en erreur.
- Tester des destinations non autorisées.
- Publier des outputs locaux contenant processus ou hostnames réels.

## Lien avec incident management

Ce lab alimente un rapport d'incident avec : symptôme, port attendu, protocole, test effectué, signal observé, hypothèse et action suivante. Cela rend l'escalade plus claire et réduit le temps perdu entre équipes.

## Question d'entretien en français

Comment vérifiez-vous si un problème d'accès web vient du réseau, du firewall ou de l'application ?

## Question d'entretien en anglais

How would you troubleshoot an application that resolves in DNS but does not respond on the expected port?

## Preuve attendue

Voir `../evidence/evidence-05-ports-firewall-connectivite.md`.

## Prochaine action

Préparer une revue de fin de semaine avec les preuves réseau ajoutées et les questions d'entretien associées.
