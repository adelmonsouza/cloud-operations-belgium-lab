# Lab 02 - Matrice de diagnostic réseau

## Module associé

`01-reseaux-tcp-ip`

## Objectif

Construire une matrice de troubleshooting réseau utilisable dans un contexte Cloud Operations, sans publier de données réelles.

## Contexte fictif

Une PME belge fictive reçoit plusieurs signalements : lenteur applicative, DNS intermittent et accès instable à un service cloud pédagogique. L'équipe Cloud Operations veut une méthode commune pour qualifier les incidents avant escalade.

## Pré-requis

- Avoir lu `lab-01-diagnostic-reseau-local.md`.
- Utiliser uniquement des commandes sûres.
- Ne pas publier de résultats réels sans anonymisation.
- Ne pas utiliser de données employeur, client ou système interne.

## Matrice de diagnostic

| Symptôme | Commandes | Signaux observés | Hypothèses | Actions suivantes |
|---|---|---|---|---|
| Pas d'accès réseau | `ifconfig`, `ipconfig getifaddr en0` | `<LOCAL_IP_ANONYMIZED>` absent | Interface inactive, DHCP indisponible | Vérifier interface, réseau local, DHCP |
| Accès IP externe impossible | `netstat -rn`, `ping -c 4 1.1.1.1` | Route par défaut absente ou perte élevée | Passerelle, routage, firewall | Valider `<DEFAULT_GATEWAY_ANONYMIZED>` |
| DNS ne résout pas | `dig example.com` | `<DNS_RESULT_EXAMPLE>` absent | Resolver DNS, filtrage, configuration | Tester DNS alternatif pédagogique |
| Port applicatif inaccessible | `nc -vz <HOST_EXAMPLE> <PORT_EXAMPLE>` | Timeout ou refus | Service arrêté, firewall, mauvais port | Vérifier service et règles réseau |
| Lenteur intermittente | `ping`, `traceroute` | `<LATENCY_EXAMPLE_MS>` élevé | Congestion, Wi-Fi, VPN, chemin réseau | Répéter mesure, comparer contexte |
| Erreur HTTP | `curl -I <URL_EXAMPLE>` | Code HTTP inattendu | Backend, TLS, proxy ou auth | Vérifier logs applicatifs et alertes |

## Exemples public-safe

```text
Symptôme: DNS intermittent
Commande: dig example.com
Signal: <DNS_RESULT_EXAMPLE>
Hypothèse: resolver DNS instable ou filtrage
Action suivante: comparer avec un resolver pédagogique et vérifier la configuration locale
```

```text
Symptôme: latence élevée
Commande: ping -c 4 1.1.1.1
Signal: <LATENCY_EXAMPLE_MS>
Hypothèse: congestion locale ou chemin réseau instable
Action suivante: répéter la mesure et comparer depuis un autre réseau
```

## Erreurs fréquentes de diagnostic

- Démarrer par une conclusion au lieu d'une observation.
- Confondre DNS et connectivité IP.
- Oublier que firewall, proxy ou VPN peuvent modifier les résultats.
- Considérer `traceroute` comme une preuve absolue.
- Publier des IPs, hostnames ou URLs réels dans une evidence.

## Interprétation opérationnelle

Une matrice ne résout pas l'incident seule. Elle standardise le raisonnement, limite les oublis et aide à produire une escalade plus utile : symptôme clair, test exécuté, signal observé, hypothèse et demande précise.

## Lien avec incident management

Cette matrice peut être intégrée à un runbook d'incident réseau. Elle soutient la timeline, la qualification d'impact, la communication et l'escalade vers les équipes réseau, sécurité, cloud ou applicatives.

## Question d'entretien en français

Comment structurez-vous un diagnostic réseau quand un utilisateur dit que "l'application ne fonctionne pas" ?

## Question d'entretien en anglais

How would you structure network troubleshooting when a user reports that an application is unavailable?

## Preuve ajoutée

Voir `../evidence/evidence-02-matrice-diagnostic-reseau.md`.

## Prochaine amélioration

Créer un mini-lab DNS dédié avec `dig`, types d'enregistrements, erreurs fréquentes et interprétation opérationnelle.
