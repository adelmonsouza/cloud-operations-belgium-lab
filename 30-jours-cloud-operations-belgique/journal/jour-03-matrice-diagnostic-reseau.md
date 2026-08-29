# Jour 03 - Matrice de diagnostic réseau

## Objectif du jour

Créer une matrice professionnelle de troubleshooting réseau pour relier symptômes, commandes, signaux observés, hypothèses techniques et actions suivantes.

## Pourquoi une matrice de diagnostic est utile en Cloud Operations

En Cloud Operations, un incident réseau peut venir de plusieurs couches : poste local, DNS, passerelle, pare-feu, routage, service applicatif ou plateforme cloud. Une matrice évite de diagnostiquer au hasard. Elle aide à formuler une hypothèse, choisir une commande sûre, interpréter le signal et décider si l'action suivante relève de l'équipe système, réseau, sécurité, cloud ou applicative.

## Tableau symptômes / commandes / signaux / hypothèses / actions

| Symptôme | Commandes sûres | Signal observé | Hypothèse | Action suivante |
|---|---|---|---|---|
| Aucun accès réseau | `ifconfig`, `ipconfig getifaddr en0` | Pas d'adresse IP ou interface inactive | Problème local d'interface ou DHCP | Vérifier interface active, Wi-Fi/Ethernet, renouvellement DHCP |
| Internet inaccessible mais IP locale présente | `netstat -rn`, `ping -c 4 1.1.1.1` | Route par défaut absente ou ping échoue | Problème de passerelle ou routage | Vérifier passerelle `<DEFAULT_GATEWAY_ANONYMIZED>` |
| Nom de domaine inaccessible | `dig example.com` | Pas de réponse DNS ou réponse inattendue | Problème DNS | Tester un autre resolver et vérifier configuration DNS |
| Service inaccessible sur un port | `nc -vz <HOST_EXAMPLE> <PORT_EXAMPLE>` | Connexion refusée ou timeout | Service arrêté, port filtré ou mauvais endpoint | Vérifier service, firewall, NSG ou règle réseau |
| Lenteur intermittente | `ping -c 4 1.1.1.1`, `traceroute example.com` | Latence élevée ou sauts instables | Congestion, Wi-Fi faible, VPN ou routage instable | Comparer avec autre réseau ou fenêtre de temps |
| Application cloud indisponible | `dig <SERVICE_NAME_EXAMPLE>`, `curl -I <URL_EXAMPLE>` | DNS OK mais HTTP échoue | Problème applicatif, TLS, firewall ou backend | Vérifier status applicatif, logs et alertes |

## Exemples public-safe

- Adresse locale : `<LOCAL_IP_ANONYMIZED>`
- Passerelle : `<DEFAULT_GATEWAY_ANONYMIZED>`
- Hôte de test : `<HOST_EXAMPLE>`
- Port de test : `<PORT_EXAMPLE>`
- URL pédagogique : `<URL_EXAMPLE>`
- Service fictif : `<SERVICE_NAME_EXAMPLE>`

## Erreurs fréquentes de diagnostic

- Conclure trop vite que le cloud est en panne sans tester DNS, route et connectivité IP.
- Confondre timeout réseau et erreur applicative.
- Publier des outputs bruts contenant IPs, hostnames ou IDs réels.
- Ignorer qu'un `traceroute` incomplet peut venir d'un filtrage normal.
- Tester uniquement depuis son poste au lieu de comparer plusieurs points de vue.

## Lien avec incident management

La matrice aide à structurer la première phase d'un incident : qualification, collecte de signaux, hypothèse initiale, impact et escalade. Elle peut être intégrée dans un runbook pour réduire le temps de diagnostic et améliorer la communication entre équipes.

## Question d'entretien en français

Comment utilisez-vous une matrice de diagnostic pour éviter une escalade réseau prématurée ?

## Question d'entretien en anglais

How do you use a troubleshooting matrix to separate DNS, routing, firewall and application issues?

## Preuve ajoutée

Ajout de la note `01-reseaux-tcp-ip/notes/matrice-diagnostic-reseau.md`, du lab `lab-02-matrice-diagnostic-reseau.md` et de l'evidence `evidence-02-matrice-diagnostic-reseau.md`.

## Prochaine action

Créer le Jour 04 sur DNS : résolution de noms, types d'enregistrements, erreurs fréquentes et diagnostic public-safe.
