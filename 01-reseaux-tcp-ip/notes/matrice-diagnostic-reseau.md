# Matrice de diagnostic réseau

## Objectif

Fournir une méthode de diagnostic réseau simple et réutilisable pour les premiers niveaux d'analyse Cloud Operations.

## Principe

Un diagnostic réseau efficace relie toujours :

- un symptôme observable ;
- une commande ou vérification sûre ;
- un signal mesurable ;
- une hypothèse technique ;
- une action suivante.

Cette méthode évite les conclusions trop rapides et facilite l'escalade avec des preuves propres.

## Matrice principale

| Symptôme | Vérification | Signal attendu | Hypothèse si anomalie | Action suivante |
|---|---|---|---|---|
| Interface inactive | `ifconfig` | Interface active avec adresse locale anonymisée | Interface désactivée ou réseau non connecté | Vérifier connexion locale |
| Pas d'IP locale | `ipconfig getifaddr en0` | `<LOCAL_IP_ANONYMIZED>` | DHCP indisponible ou interface incorrecte | Vérifier DHCP ou interface active |
| Pas de route par défaut | `netstat -rn` | Route `default` vers `<DEFAULT_GATEWAY_ANONYMIZED>` | Passerelle absente ou configuration réseau incorrecte | Vérifier passerelle |
| IP externe inaccessible | `ping -c 4 1.1.1.1` | Réponses avec perte faible | Routage, firewall ou connectivité WAN | Comparer depuis un autre réseau |
| DNS échoue | `dig example.com` | Réponse DNS pédagogique | Resolver DNS indisponible ou filtrage | Tester configuration DNS |
| Destination lente | `traceroute example.com` | Chemin cohérent avec latence acceptable | Congestion, VPN, routage ou filtrage | Mesurer dans le temps |
| Service HTTP échoue | `curl -I <URL_EXAMPLE>` | Statut HTTP attendu | Problème applicatif, TLS ou firewall | Vérifier logs et monitoring |

## Règles public-safe

- Ne pas publier de vrais hostnames.
- Ne pas publier d'IP publique personnelle.
- Ne pas publier de tenant ID, subscription ID ou account ID.
- Remplacer toute valeur réelle par un placeholder.
- Ne pas inclure de screenshots bruts.

## Placeholders recommandés

- `<LOCAL_IP_ANONYMIZED>`
- `<PUBLIC_IP_REDACTED>`
- `<DEFAULT_GATEWAY_ANONYMIZED>`
- `<HOSTNAME_REDACTED>`
- `<HOST_EXAMPLE>`
- `<PORT_EXAMPLE>`
- `<URL_EXAMPLE>`
- `<SERVICE_NAME_EXAMPLE>`

## Utilisation en incident management

Pendant un incident, cette matrice peut servir de première checklist :

1. Confirmer le symptôme.
2. Vérifier la couche locale.
3. Vérifier la connectivité IP.
4. Vérifier DNS.
5. Vérifier route et filtrage.
6. Vérifier service applicatif.
7. Documenter les signaux avant escalade.

## Limites

Cette matrice ne remplace pas une analyse complète des logs, métriques, règles firewall, NSG, proxy, VPN ou incidents fournisseur. Elle sert à structurer les premières observations.
