# DHCP, passerelle et attribution d'adresses

## Objectif

Comprendre les composants d'une configuration réseau attribuée automatiquement et savoir diagnostiquer les problèmes courants d'adressage.

## Concepts clés

| Concept | Rôle opérationnel |
|---|---|
| DHCP | Attribue automatiquement adresse IP, masque, passerelle et options réseau. |
| Adresse IP | Identifie une interface sur un réseau. |
| Masque de sous-réseau | Détermine quelles adresses sont locales. |
| Bail DHCP | Durée d'utilisation d'une adresse attribuée. |
| Passerelle par défaut | Routeur utilisé pour sortir du réseau local. |
| Route par défaut | Route utilisée quand aucune route plus spécifique ne correspond. |
| Conflit d'adresse IP | Deux équipements utilisent la même adresse, causant instabilité ou pertes. |
| Absence d'adresse IP | La machine ne peut pas communiquer correctement sur le réseau attendu. |
| Adresse APIPA / link-local | Adresse automatique de secours, souvent signe que DHCP n'a pas répondu. |

## Commandes macOS utiles

```bash
ipconfig getifaddr en0
ipconfig getoption en0 router
ipconfig getoption en0 subnet_mask
ipconfig getpacket en0
netstat -rn
ifconfig en0
```

## Anonymisation obligatoire

Ne jamais publier de sortie brute. Remplacer :

- adresse locale : `<LOCAL_IP_ANONYMIZED>` ;
- adresse link-local : `<APIPA_ADDRESS_EXAMPLE>` ;
- passerelle : `<DEFAULT_GATEWAY_ANONYMIZED>` ;
- masque : `<SUBNET_MASK_EXAMPLE>` ;
- hostname : `<HOSTNAME_REDACTED>` ;
- interface sensible : `<INTERFACE_ANONYMIZED>` ;
- bail DHCP : `<DHCP_LEASE_EXAMPLE>` ;
- route : `<ROUTE_ENTRY_EXAMPLE>`.

## Matrice de diagnostic

| Symptôme | Vérification | Signal | Hypothèse | Action |
|---|---|---|---|---|
| Aucune IP | `ipconfig getifaddr en0` | Pas de sortie | Interface inactive ou DHCP indisponible | Vérifier interface active et serveur DHCP |
| Adresse APIPA | `ifconfig en0` | `<APIPA_ADDRESS_EXAMPLE>` | Echec DHCP | Vérifier réseau local, scope DHCP et câble/Wi-Fi |
| Pas de passerelle | `ipconfig getoption en0 router` | Aucun routeur | Option DHCP manquante | Vérifier configuration DHCP |
| Mauvais masque | `ipconfig getoption en0 subnet_mask` | `<SUBNET_MASK_EXAMPLE>` inattendu | Mauvais sous-réseau | Vérifier scope et VLAN |
| Route absente | `netstat -rn` | Pas de `default` | Route par défaut non installée | Comparer bail DHCP et table de routage |
| Connectivité instable | `ifconfig en0`, `netstat -rn` | Adresse ou route changeante | Conflit IP ou renouvellement instable | Vérifier logs réseau et attribution |

## Scénario fictif

Un poste de `<FAKE_COMPANY_EXAMPLE>` reçoit une adresse dans un sous-réseau inattendu et aucune passerelle par défaut. Le poste peut afficher une interface active, mais ne peut pas joindre les services distants. L'hypothèse principale est une configuration DHCP incorrecte ou un mauvais réseau d'accès.

## Lien avec Cloud Operations

Même dans un environnement cloud, les postes d'administration, bastions, VPN, agents de supervision et machines hybrides dépendent d'une configuration réseau correcte. DHCP et routage local restent donc importants pour qualifier les incidents avant de suspecter Azure, AWS ou une application.

## Limites

Ce document ne remplace pas l'analyse d'un serveur DHCP, d'un contrôleur réseau, d'un switch, d'un firewall ou d'un VPN. Il structure les premières vérifications côté machine.
