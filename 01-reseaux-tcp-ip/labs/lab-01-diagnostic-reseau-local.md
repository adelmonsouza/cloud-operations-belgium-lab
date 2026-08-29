# Lab 01 - Diagnostic réseau local

## Module associé

`01-reseaux-tcp-ip`

## Objectif

Documenter une méthode simple, sûre et reproductible pour observer la configuration réseau locale, tester la connectivité et interpréter les premiers signaux TCP/IP.

## Contexte fictif

Une PME belge fictive signale qu'un poste de travail accède difficilement à certains services internes et externes. Avant d'escalader, l'équipe Cloud Operations doit collecter des informations réseau de base sans exposer de données sensibles.

## Pré-requis

- macOS.
- Terminal local.
- Connexion réseau active.
- Aucune ressource cloud réelle.
- Aucune donnée employeur, client ou système interne.

## Commandes sûres à exécuter sur macOS

```bash
hostname
ifconfig
ipconfig getifaddr en0
netstat -rn
ping -c 4 1.1.1.1
dig example.com
traceroute example.com
```

## Explication de chaque commande

| Commande | Utilité opérationnelle |
|---|---|
| `hostname` | Affiche le nom local de la machine. A anonymiser si le nom contient une information personnelle. |
| `ifconfig` | Affiche les interfaces réseau, adresses locales, état des interfaces et informations de liaison. |
| `ipconfig getifaddr en0` | Affiche l'adresse IPv4 de l'interface `en0`, souvent utilisée pour le Wi-Fi sur macOS. |
| `netstat -rn` | Affiche la table de routage, notamment la route par défaut et la passerelle. |
| `ping -c 4 1.1.1.1` | Teste une connectivité IP externe sans dépendre du DNS. |
| `dig example.com` | Teste la résolution DNS avec un domaine pédagogique public. |
| `traceroute example.com` | Affiche les sauts réseau vers une destination pédagogique. Les IP publiques observées doivent être anonymisées avant publication. |

## Comment anonymiser les résultats

Remplacer toute donnée personnelle ou sensible avant de publier :

- nom machine réel : `<HOSTNAME_ANONYMIZED>` ;
- adresse IP locale : `<LOCAL_IP_ANONYMIZED>` ;
- passerelle : `<DEFAULT_GATEWAY_ANONYMIZED>` ;
- route ou saut réseau : `<ROUTE_HOP_ANONYMIZED>` ;
- résultat DNS : `<DNS_RESULT_EXAMPLE>` ;
- latence : `<LATENCY_EXAMPLE_MS>` ;
- interface non pertinente ou nom sensible : `<INTERFACE_ANONYMIZED>`.

Ne jamais publier d'IP publique personnelle, de nom d'entreprise, de nom client, de réseau interne professionnel ou de screenshot sensible.

## Résultats attendus

Exemple anonymisé :

```text
Hostname: <HOSTNAME_ANONYMIZED>
Local IPv4: <LOCAL_IP_ANONYMIZED>
Default gateway: <DEFAULT_GATEWAY_ANONYMIZED>
External ping: 4 packets transmitted, 4 packets received, <PACKET_LOSS_EXAMPLE>% packet loss
DNS: example.com -> <DNS_RESULT_EXAMPLE>
Traceroute: hop 1 <ROUTE_HOP_ANONYMIZED>, hop 2 <ROUTE_HOP_ANONYMIZED>
```

## Interprétation opérationnelle

- Si `ping -c 4 1.1.1.1` fonctionne mais `dig example.com` échoue, l'hypothèse DNS devient prioritaire.
- Si `ping` échoue et que la route par défaut est absente, l'hypothèse passerelle/routage devient prioritaire.
- Si la latence est très élevée ou variable, il faut vérifier Wi-Fi, congestion, VPN, filtrage ou chemin réseau.
- Si `traceroute` s'arrête très tôt, il peut s'agir d'un filtrage local, d'une passerelle indisponible ou d'un réseau qui bloque ICMP/UDP.

## Erreurs possibles

- `ipconfig getifaddr en0` peut ne rien retourner si l'interface active n'est pas `en0`.
- `traceroute` peut afficher des `*` même si le service final fonctionne, car certains équipements filtrent les réponses.
- `ping` peut être bloqué par certains réseaux sans indiquer que tout le réseau est indisponible.
- Les résultats peuvent varier selon Wi-Fi, VPN, pare-feu local ou politique réseau.

## Lien avec Cloud Operations

Ce lab entraîne une méthode utile pour les incidents cloud et hybrides : séparer connectivité IP, résolution DNS, routage, latence et filtrage. Cette logique aide à qualifier un incident avant d'impliquer réseau, sécurité, cloud platform ou support applicatif.

## Question d'entretien en français

Comment diagnostiqueriez-vous un problème de connectivité avant de conclure qu'une application cloud est indisponible ?

## Question d'entretien en anglais

How would you separate a DNS issue from a general network connectivity issue?

## Prochaine amélioration

Ajouter un second lab avec une matrice de diagnostic : symptôme, commande, signal observé, hypothèse et action suivante.
