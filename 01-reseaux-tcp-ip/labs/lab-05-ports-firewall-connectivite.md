# Lab 05 - Ports, firewall et connectivité applicative

## Module associé

`01-reseaux-tcp-ip`

## Objectif

Documenter une méthode public-safe pour vérifier si un service applicatif est joignable, si un port répond, et si l'hypothèse principale est réseau, firewall ou application.

## Contexte fictif

Une application web de `<FAKE_COMPANY_EXAMPLE>` n'est pas accessible depuis un poste utilisateur. Le DNS semble répondre, mais la connexion applicative échoue. L'équipe Cloud Operations doit vérifier si le port web est joignable et si un service local ou distant semble écouter sur le port attendu.

## Pré-requis

- macOS avec Terminal.
- Utiliser uniquement `example.com`, `localhost` ou des placeholders.
- Ne pas scanner de systèmes tiers.
- Ne pas publier d'output local brut.
- Ne pas inclure de hostname réel, IP publique personnelle, données employeur ou données client.

## Commandes sûres

Exécuter ces commandes une par une. Après chaque commande, noter le signal observé dans les notes privées, puis préparer uniquement une version anonymisée pour le dépôt public.

```bash
curl -I https://example.com
nc -vz example.com 443
nc -vz example.com 80
lsof -iTCP -sTCP:LISTEN -n -P
netstat -an | grep LISTEN
```

### `curl -I https://example.com`

```bash
curl -I https://example.com
```

Cette commande demande uniquement les en-têtes HTTP. Elle vérifie plusieurs couches en une seule observation : résolution DNS, connexion TCP vers 443, négociation HTTPS et réponse HTTP.

Signal à observer : un statut HTTP public-safe comme `<HTTP_STATUS_EXAMPLE>`. Une réponse HTTP indique que le chemin applicatif répond, mais elle ne prouve pas que toutes les fonctionnalités de l'application sont opérationnelles.

### `nc -vz example.com 443`

```bash
nc -vz example.com 443
```

Cette commande teste la connectivité TCP vers le port HTTPS. Elle est utile pour distinguer un problème de port d'un problème purement applicatif.

Signal à observer : `<CONNECTIVITY_RESULT_EXAMPLE>`, par exemple port accessible, connexion refusée ou timeout. Un port accessible signifie que la connexion TCP arrive au service, pas que l'application est saine.

### `nc -vz example.com 80`

```bash
nc -vz example.com 80
```

Cette commande teste la connectivité TCP vers le port HTTP. Elle permet de comparer le comportement de HTTP et HTTPS dans un diagnostic simple.

Signal à observer : différence éventuelle entre port 80 et port 443. Si 80 répond et 443 échoue, l'hypothèse peut se déplacer vers TLS, listener HTTPS, règle firewall spécifique ou configuration applicative.

### `lsof -iTCP -sTCP:LISTEN -n -P`

```bash
lsof -iTCP -sTCP:LISTEN -n -P
```

Cette commande observe les services TCP en écoute sur la machine locale. Elle aide à vérifier si un service attendu est réellement démarré et lié à un port.

Signal à observer : présence ou absence d'un listener sur `<PORT_EXAMPLE>`. La sortie brute doit rester privée, car elle peut contenir nom utilisateur, processus, ports internes et informations système.

### `netstat -an | grep LISTEN`

```bash
netstat -an | grep LISTEN
```

Cette commande fournit une autre vue des sockets en écoute. Elle sert à confirmer l'observation locale quand `lsof` n'est pas disponible ou quand l'on veut comparer deux vues.

Signal à observer : socket en état `LISTEN` sur un port attendu. Comme pour `lsof`, la sortie brute doit rester hors du dépôt public et être remplacée par des placeholders.

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

Les sorties brutes de `lsof` et `netstat` doivent rester hors du dépôt public. Elles peuvent contenir un nom utilisateur local, des processus, des ports internes, des hostnames ou des informations système.

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

## Lecture des résultats

| Signal | Interprétation prudente | Limite |
|---|---|---|
| DNS OK + port 443 accessible | Le nom résout et le port HTTPS accepte une connexion TCP. | Ne prouve pas que l'application fonctionne complètement. |
| DNS OK + port fermé | La destination est probablement atteinte, mais le service n'accepte pas la connexion. | Peut dépendre d'une règle locale ou distante. |
| DNS OK + timeout | Le trafic peut être filtré, perdu ou dirigé vers un endpoint indisponible. | Ne suffit pas à accuser le firewall sans autre preuve. |
| Port local en écoute | Un service local écoute sur un port. | Ne prouve pas que le service est accessible depuis un autre réseau. |
| Service arrêté | Aucun listener attendu n'est visible. | Vérifier aussi configuration, logs et dépendances. |

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

## Comment expliquer ce lab en entretien

Réponse courte possible : "Je sépare le diagnostic en couches. Je vérifie d'abord que le nom répond, puis je teste le port attendu avec une destination autorisée. Ensuite, je compare timeout et connection refused, et je vérifie si un service écoute localement quand c'est pertinent. Je documente seulement des résultats anonymisés pour éviter toute fuite."

## Preuve attendue

Voir `../evidence/evidence-05-ports-firewall-connectivite.md`.

## Prochaine action

Préparer une revue de fin de semaine avec les preuves réseau ajoutées et les questions d'entretien associées.
