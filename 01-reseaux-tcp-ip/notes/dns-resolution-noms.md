# DNS, résolution de noms et diagnostic opérationnel

## Objectif

Comprendre les concepts DNS essentiels et préparer une méthode de diagnostic public-safe pour Cloud Operations.

## Pourquoi DNS compte

DNS est une dépendance critique pour les applications, consoles cloud, APIs, services web, messagerie et accès internes. Un incident DNS peut produire des symptômes proches d'une panne applicative : service inaccessible, lenteur, erreur TLS, endpoint introuvable ou échec d'authentification.

## Concepts clés

| Concept | Rôle opérationnel |
|---|---|
| Résolution de noms | Convertit un nom DNS en donnée exploitable par le client. |
| Record A | Retourne une adresse IPv4. |
| Record AAAA | Retourne une adresse IPv6. |
| CNAME | Crée un alias vers un autre nom DNS. |
| MX | Indique les serveurs de messagerie du domaine. |
| TXT | Porte des informations texte, politiques ou validations. |
| NS | Indique les serveurs autoritaires pour la zone. |
| TTL | Définit combien de temps une réponse peut rester en cache. |
| Cache DNS | Réduit les requêtes répétées mais peut garder une ancienne réponse. |
| NXDOMAIN | Indique que le nom demandé n'existe pas. |
| Timeout DNS | Indique qu'aucune réponse n'est arrivée à temps. |

## Commandes de diagnostic sûres

```bash
dig example.com
dig A example.com
dig AAAA example.com
dig MX example.com
dig TXT example.com
dig NS example.com
nslookup example.com
scutil --dns
```

## Anonymisation stricte

Avant publication, remplacer :

- resolver local : `<DNS_RESOLVER_REDACTED>` ;
- domaine interne : `<DOMAIN_REDACTED>` ;
- hostname : `<HOSTNAME_REDACTED>` ;
- IP locale : `<LOCAL_IP_ANONYMIZED>` ;
- IP publique : `<PUBLIC_IP_REDACTED>` ;
- résultat DNS : `<DNS_RESULT_EXAMPLE>` ;
- tenant/subscription/account : `<TENANT_ID_REDACTED>`, `<SUBSCRIPTION_ID_REDACTED>`, `<ACCOUNT_ID_REDACTED>`.

Ne pas publier de sortie brute de `scutil --dns`, car elle peut contenir des domaines internes, resolvers, interfaces, VPN ou profils réseau.

## Matrice DNS

| Symptôme | Commande | Signal | Hypothèse | Action suivante |
|---|---|---|---|---|
| Domaine introuvable | `dig <DOMAIN_EXAMPLE>` | `NXDOMAIN` | Record absent, domaine incorrect ou zone non publiée | Vérifier nom et zone autoritaire |
| Réponse lente | `dig example.com` | Temps de requête élevé | Resolver lent, latence réseau ou cache froid | Comparer plusieurs tests |
| IPv4 manquante | `dig A example.com` | Aucun A record | Service IPv6-only ou erreur de zone | Vérifier besoin IPv4 |
| IPv6 manquante | `dig AAAA example.com` | Aucun AAAA record | IPv6 non déployé | Vérifier architecture réseau |
| Alias inattendu | `dig CNAME <SERVICE_NAME_EXAMPLE>` | CNAME absent ou différent | Mauvais endpoint ou changement DNS | Comparer avec documentation |
| Messagerie impactée | `dig MX example.com` | MX absent | Service mail mal configuré | Vérifier records MX |
| Validation cloud échoue | `dig TXT example.com` | TXT absent ou incorrect | Validation DNS incomplète | Vérifier valeur attendue public-safe |
| Resolver local suspect | `scutil --dns` | Resolver inattendu | VPN, profil ou configuration locale | Anonymiser et comparer |

## Lien incident management

Pendant un incident, documenter :

1. le nom testé ;
2. le type de record ;
3. le resolver utilisé, anonymisé si nécessaire ;
4. le résultat observé ;
5. l'impact utilisateur ;
6. l'hypothèse ;
7. l'action suivante.

## Limites

DNS ne prouve pas seul qu'une application fonctionne. Une résolution correcte doit être complétée par des tests réseau, HTTP/TLS, logs applicatifs et supervision.
