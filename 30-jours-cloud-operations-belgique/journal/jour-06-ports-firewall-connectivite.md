# Jour 06 - Ports, firewall et connectivité applicative

## Objectif du jour

Comprendre comment diagnostiquer si un service applicatif est joignable, comment interpréter les ports ouverts ou fermés, et comment relier ces signaux à un problème réseau, firewall ou applicatif.

## Pourquoi les ports et firewalls sont importants en Cloud Operations

Un service peut avoir une adresse IP correcte et une résolution DNS valide, mais rester inaccessible si le port attendu n'est pas ouvert, si une règle firewall bloque le trafic, ou si l'application n'écoute pas. En Cloud Operations, les ports et firewalls sont essentiels pour diagnostiquer les incidents web, SSH, RDP, DNS, API et supervision.

## Concepts étudiés

- Port TCP : point d'entrée logique pour une connexion fiable orientée session.
- Port UDP : point d'entrée logique pour des échanges sans session persistante.
- Socket : combinaison d'une adresse, d'un port et d'un protocole.
- Service applicatif : processus qui écoute sur un port pour répondre aux clients.
- Firewall local : filtrage appliqué sur la machine.
- Firewall réseau : filtrage appliqué par un équipement ou service réseau.
- Allow rule : règle qui autorise un flux.
- Deny rule : règle qui bloque un flux.
- Timeout : absence de réponse dans le délai attendu.
- Connection refused : hôte joignable, mais aucun service n'accepte la connexion sur ce port.
- Port ouvert : un service répond ou accepte la connexion.
- Port fermé : aucun service n'écoute ou le flux est refusé.

## Ports courants

| Port | Protocole | Usage courant |
|---|---|---|
| 22 | TCP | SSH |
| 53 | TCP/UDP | DNS |
| 80 | TCP | HTTP |
| 443 | TCP | HTTPS |
| 3389 | TCP | RDP |

## Commandes sûres documentées

```bash
nc -vz example.com 443
nc -vz example.com 80
curl -I https://example.com
lsof -iTCP -sTCP:LISTEN -n -P
netstat -an | grep LISTEN
```

Important : ne pas scanner des IPs ou domaines inconnus. Utiliser uniquement `example.com`, `localhost` ou des placeholders. Tout output local doit être anonymisé avant publication.

## Tableau symptôme / commande / signal / hypothèse / action

| Symptôme | Commande | Signal | Hypothèse | Action suivante |
|---|---|---|---|---|
| Site web inaccessible | `curl -I https://example.com` | Timeout | Firewall, DNS, réseau ou service distant | Vérifier DNS, port 443 et statut HTTP |
| HTTPS refusé | `nc -vz example.com 443` | Connection refused | Aucun service HTTPS ou filtrage actif | Vérifier endpoint et règles firewall |
| HTTP fonctionne, HTTPS échoue | `nc -vz example.com 80`, `nc -vz example.com 443` | 80 ouvert, 443 fermé | TLS ou service HTTPS absent | Vérifier configuration applicative |
| Service local non joignable | `lsof -iTCP -sTCP:LISTEN -n -P` | Port absent | Application non démarrée | Vérifier processus et logs |
| Port local attendu absent | `netstat -an | grep LISTEN` | Aucun listener | Mauvais port ou service arrêté | Confirmer configuration du service |

## Scénario fictif

Une application web de `<FAKE_COMPANY_EXAMPLE>` n'est pas accessible depuis un poste utilisateur. DNS retourne `<DNS_RESULT_EXAMPLE>`, mais le test de connectivité vers `<SERVICE_NAME_EXAMPLE>` sur `<PORT_EXAMPLE>` indique `<CONNECTIVITY_RESULT_EXAMPLE>`. L'équipe Cloud Operations doit distinguer un problème réseau, firewall ou applicatif avant escalade.

## Erreurs fréquentes de diagnostic

- Confondre `connection refused` et `timeout`.
- Tester un port sans vérifier que le service doit réellement écouter sur ce port.
- Scanner des domaines ou IPs inconnus au lieu d'utiliser un environnement autorisé.
- Publier des listeners locaux contenant hostnames, chemins ou processus sensibles.
- Conclure à une panne applicative sans vérifier firewall et connectivité.

## Lien avec incident management

Les tests de ports aident à documenter la portée d'un incident : service indisponible, port bloqué, application arrêtée ou filtrage réseau. Ils fournissent des signaux utiles pour router l'escalade vers réseau, sécurité, système, cloud platform ou application.

## Question d'entretien en français

Comment distinguez-vous un timeout réseau d'une connexion refusée lors du diagnostic d'un service applicatif ?

## Question d'entretien en anglais

How do you determine whether an application connectivity issue is caused by the network, firewall, or the application itself?

## Preuve ajoutée

Ajout de `01-reseaux-tcp-ip/notes/ports-firewall-connectivite.md`, `lab-05-ports-firewall-connectivite.md` et `evidence-05-ports-firewall-connectivite.md`.

## Prochaine action

Créer le Jour 07 avec une revue de la première semaine : réseau, DNS, DHCP, ports, preuves ajoutées et questions d'entretien.
