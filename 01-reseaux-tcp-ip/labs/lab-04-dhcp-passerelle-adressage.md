# Lab 04 - DHCP, passerelle et adressage

## Module associé

`01-reseaux-tcp-ip`

## Objectif

Documenter une méthode public-safe pour vérifier l'adresse IP locale, le masque, le bail DHCP, la passerelle et la route par défaut sur macOS.

## Contexte fictif

Une machine de `<FAKE_COMPANY_EXAMPLE>` reçoit une adresse incorrecte ou ne reçoit pas de passerelle. L'utilisateur indique que certains services internes fonctionnent, mais que les services externes ou cloud pédagogiques sont inaccessibles.

## Pré-requis

- macOS avec Terminal.
- Interface `en0` utilisée comme exemple pédagogique.
- Aucune ressource cloud réelle.
- Aucun output brut publié.
- Aucun hostname, IP publique personnelle ou donnée employeur/client.

## Commandes sûres sur macOS

```bash
ipconfig getifaddr en0
ipconfig getoption en0 router
ipconfig getoption en0 subnet_mask
ipconfig getpacket en0
netstat -rn
ifconfig en0
```

## Explication des commandes

| Commande | Utilité |
|---|---|
| `ipconfig getifaddr en0` | Affiche l'adresse IPv4 attribuée à l'interface `en0`. |
| `ipconfig getoption en0 router` | Affiche la passerelle reçue via DHCP. |
| `ipconfig getoption en0 subnet_mask` | Affiche le masque attribué. |
| `ipconfig getpacket en0` | Affiche les détails du bail DHCP ; sortie à anonymiser strictement. |
| `netstat -rn` | Affiche la table de routage et la route par défaut. |
| `ifconfig en0` | Affiche l'état de l'interface et les adresses associées. |

## Comment anonymiser les sorties

Remplacer toute valeur réelle :

```text
Local IP: <LOCAL_IP_ANONYMIZED>
Subnet mask: <SUBNET_MASK_EXAMPLE>
Default gateway: <DEFAULT_GATEWAY_ANONYMIZED>
DHCP lease: <DHCP_LEASE_EXAMPLE>
Route entry: <ROUTE_ENTRY_EXAMPLE>
Hostname: <HOSTNAME_REDACTED>
Interface: <INTERFACE_ANONYMIZED>
APIPA/link-local: <APIPA_ADDRESS_EXAMPLE>
```

Ne jamais publier :

- hostname réel ;
- IP publique personnelle ;
- détails de réseau employeur/client ;
- sortie brute complète de `ipconfig getpacket en0` ;
- screenshot contenant interface, nom machine, Wi-Fi, VPN ou profil réseau.

## Tableau symptôme / commande / signal / hypothèse / action

| Symptôme | Commande | Signal | Hypothèse | Action |
|---|---|---|---|---|
| Pas d'adresse IPv4 | `ipconfig getifaddr en0` | Pas de sortie | DHCP indisponible ou interface inactive | Vérifier interface et réseau local |
| Adresse APIPA | `ifconfig en0` | `<APIPA_ADDRESS_EXAMPLE>` | Aucun bail DHCP reçu | Vérifier DHCP, Wi-Fi/Ethernet, VLAN |
| Pas de passerelle | `ipconfig getoption en0 router` | Pas de valeur | Option router absente du bail DHCP | Vérifier scope DHCP |
| Mauvais masque | `ipconfig getoption en0 subnet_mask` | `<SUBNET_MASK_EXAMPLE>` inattendu | Mauvais sous-réseau ou VLAN | Comparer avec plan réseau fictif |
| Route par défaut absente | `netstat -rn` | Pas de route `default` | Passerelle non installée | Corréler avec option DHCP router |
| Conflit d'adresse suspect | `ifconfig en0` | Connectivité instable | Adresse dupliquée ou bail incohérent | Vérifier attribution côté réseau |

## Résultats attendus

Exemple public-safe :

```text
Local IP: <LOCAL_IP_ANONYMIZED>
Subnet mask: <SUBNET_MASK_EXAMPLE>
Default gateway: <DEFAULT_GATEWAY_ANONYMIZED>
Route default: <ROUTE_ENTRY_EXAMPLE>
DHCP lease: <DHCP_LEASE_EXAMPLE>
Status: <INTERFACE_STATUS_EXAMPLE>
```

## Scénario fictif d'analyse

Le poste reçoit `<LOCAL_IP_ANONYMIZED>` avec `<SUBNET_MASK_EXAMPLE>`, mais `ipconfig getoption en0 router` ne retourne aucune passerelle. `netstat -rn` ne montre pas de route `default`. L'hypothèse principale est un bail DHCP incomplet ou un scope DHCP mal configuré.

Action suivante : documenter les signaux, vérifier le réseau d'accès et escalader vers l'équipe réseau avec les éléments anonymisés.

## Erreurs fréquentes

- Interpréter une interface active comme preuve que le réseau fonctionne.
- Oublier de vérifier la passerelle.
- Confondre adresse APIPA/link-local et adresse valide.
- Publier le contenu brut du bail DHCP.
- Escalader vers l'équipe cloud sans preuve de connectivité locale.

## Lien avec incident management

Un incident d'adressage doit inclure : impact, adresse anonymisée, masque, passerelle, route par défaut, hypothèse et action suivante. Cela aide à prioriser l'incident et à éviter une escalade vague.

## Question d'entretien en français

Comment diagnostiquez-vous un poste qui a une adresse IP mais ne peut pas sortir de son réseau local ?

## Question d'entretien en anglais

How would you diagnose a workstation that has an IP address but cannot reach external networks?

## Preuve attendue

Voir `../evidence/evidence-04-dhcp-passerelle-adressage.md`.

## Prochaine action

Créer un lab sur ports, firewall et connectivité applicative.
