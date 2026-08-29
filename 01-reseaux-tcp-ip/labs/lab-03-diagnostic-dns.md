# Lab 03 - Diagnostic DNS

## Module associé

`01-reseaux-tcp-ip`

## Objectif

Apprendre à diagnostiquer un problème DNS avec des commandes sûres, des domaines publics d'exemple et une méthode d'anonymisation stricte.

## Contexte fictif

Une PME belge fictive signale qu'un service web pédagogique devient inaccessible par son nom DNS. L'équipe Cloud Operations doit déterminer si le problème vient de la résolution de noms, du réseau ou de l'application.

## Pré-requis

- macOS avec Terminal.
- Commandes `dig`, `nslookup` et `scutil` disponibles.
- Utiliser uniquement `example.com` ou des placeholders.
- Ne pas publier de sortie brute contenant des informations personnelles, professionnelles ou cloud réelles.

## Commandes sûres

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

## Explication des commandes

| Commande | Utilité |
|---|---|
| `dig example.com` | Vue générale de la résolution DNS du domaine. |
| `dig A example.com` | Vérifie les enregistrements IPv4. |
| `dig AAAA example.com` | Vérifie les enregistrements IPv6. |
| `dig MX example.com` | Vérifie les serveurs de messagerie. |
| `dig TXT example.com` | Vérifie les records texte. |
| `dig NS example.com` | Vérifie les serveurs DNS autoritaires. |
| `nslookup example.com` | Alternative simple souvent connue en support et administration. |
| `scutil --dns` | Affiche la configuration DNS macOS locale ; à anonymiser strictement avant toute publication. |

## Comment anonymiser les sorties

Remplacer toute valeur réelle par :

```text
Resolver: <DNS_RESOLVER_REDACTED>
Domain: <DOMAIN_REDACTED>
Hostname: <HOSTNAME_REDACTED>
Local IP: <LOCAL_IP_ANONYMIZED>
Public IP: <PUBLIC_IP_REDACTED>
DNS result: <DNS_RESULT_EXAMPLE>
Query time: <DNS_QUERY_TIME_EXAMPLE_MS>
TTL: <TTL_EXAMPLE>
```

Ne jamais publier :

- IP publique personnelle ;
- domaine d'employeur ou client ;
- sortie brute de VPN ;
- tenant ID, subscription ID, account ID ;
- screenshot contenant des informations réseau.

## Tableau symptôme / commande / signal / hypothèse / action

| Symptôme | Commande | Signal | Hypothèse | Action |
|---|---|---|---|---|
| Le nom ne résout pas | `dig example.com` | `NXDOMAIN` ou aucune réponse | Nom incorrect, zone absente ou resolver indisponible | Vérifier nom, zone et resolver |
| IPv4 indisponible | `dig A example.com` | Aucun record A | Record IPv4 absent | Vérifier configuration DNS |
| IPv6 indisponible | `dig AAAA example.com` | Aucun record AAAA | IPv6 non configuré ou non requis | Confirmer besoin IPv6 |
| Mail impacté | `dig MX example.com` | MX absent | Configuration mail manquante | Vérifier records MX |
| Validation DNS échoue | `dig TXT example.com` | TXT absent | Record de validation absent | Vérifier valeur attendue |
| Résolution lente | `dig example.com` | `<DNS_QUERY_TIME_EXAMPLE_MS>` élevé | Resolver lent, réseau instable ou cache | Répéter test, comparer resolver |
| Configuration locale suspecte | `scutil --dns` | `<DNS_RESOLVER_REDACTED>` inattendu | VPN, profil ou DNS local modifié | Comparer contexte réseau |

## Résultats attendus

Ce lab ne publie pas de vrais résultats. Une evidence acceptable doit ressembler à :

```text
Domain tested: example.com
A record: <DNS_RESULT_EXAMPLE>
AAAA record: <DNS_RESULT_EXAMPLE>
MX record: <DNS_RESULT_EXAMPLE>
TXT record: <DNS_RESULT_EXAMPLE>
NS record: <DNS_RESULT_EXAMPLE>
Resolver: <DNS_RESOLVER_REDACTED>
Query time: <DNS_QUERY_TIME_EXAMPLE_MS>
TTL: <TTL_EXAMPLE>
```

## Erreurs fréquentes

- Croire qu'un `dig` réussi prouve que l'application fonctionne.
- Oublier que le cache DNS peut masquer un changement récent.
- Tester seulement un type de record.
- Publier des resolvers internes ou domaines professionnels.
- Ignorer que certains timeouts viennent du réseau ou d'un firewall.

## Lien avec incident management

Le diagnostic DNS doit alimenter un rapport d'incident avec : symptôme, record testé, résultat, impact, hypothèse et action suivante. Cela aide à décider si l'escalade doit aller vers réseau, cloud, sécurité, messagerie ou application.

## Question d'entretien en français

Comment diagnostiqueriez-vous un incident où un service est accessible par IP mais pas par nom DNS ?

## Question d'entretien en anglais

How would you troubleshoot a service that is reachable by IP address but not by DNS name?

## Preuve attendue

Voir `../evidence/evidence-03-diagnostic-dns.md`.

## Prochaine action

Créer un lab sur DHCP, passerelle et attribution d'adresse dans un contexte réseau fictif.
