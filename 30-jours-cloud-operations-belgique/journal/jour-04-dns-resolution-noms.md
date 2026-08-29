# Jour 04 - DNS, résolution de noms et diagnostic opérationnel

## Objectif du jour

Comprendre comment diagnostiquer les problèmes DNS dans un contexte Cloud Operations / Administrateur Systèmes et Cloud, avec un mini-lab public-safe basé sur `example.com` et des placeholders.

## Pourquoi DNS est critique en Cloud Operations

DNS transforme les noms de services en adresses utilisables par les systèmes. Quand DNS échoue, un service peut sembler indisponible alors que le réseau IP, le serveur ou l'application fonctionnent encore. En opérations cloud, savoir isoler un problème DNS évite les escalades imprécises et accélère l'analyse d'incident.

## Concepts étudiés

- Résolution de noms : processus qui transforme un nom comme `example.com` en adresse IP.
- Record A : associe un nom à une adresse IPv4.
- Record AAAA : associe un nom à une adresse IPv6.
- CNAME : alias vers un autre nom DNS.
- MX : serveur de messagerie pour un domaine.
- TXT : texte associé au domaine, souvent utilisé pour vérifications ou politiques.
- NS : serveurs DNS autoritaires du domaine.
- TTL : durée de cache recommandée pour un enregistrement.
- Cache DNS : stockage temporaire de réponses DNS.
- NXDOMAIN : réponse indiquant que le nom demandé n'existe pas.
- Timeout DNS : absence de réponse dans le délai attendu.

## Mini-lab réalisé

Création du lab `01-reseaux-tcp-ip/labs/lab-03-diagnostic-dns.md` avec des commandes sûres : `dig`, `nslookup` et `scutil --dns` avec anonymisation stricte.

## Tableau symptôme / commande / signal / hypothèse / action

| Symptôme | Commande | Signal | Hypothèse | Action suivante |
|---|---|---|---|---|
| Nom introuvable | `dig example.com` | `NXDOMAIN` sur un nom fictif | Nom incorrect ou zone absente | Vérifier orthographe, zone DNS et record attendu |
| Résolution lente | `dig example.com` | Temps de réponse élevé | Resolver lent, réseau instable ou cache absent | Comparer avec autre resolver pédagogique |
| IPv4 absente | `dig A example.com` | Aucun record A | Service sans IPv4 ou record supprimé | Vérifier architecture et besoin IPv4 |
| IPv6 absente | `dig AAAA example.com` | Aucun record AAAA | IPv6 non configuré | Vérifier si IPv6 est requis |
| Mail impacté | `dig MX example.com` | MX absent ou inattendu | Configuration mail incomplète | Vérifier records MX et priorités |
| Resolver local suspect | `scutil --dns` | Resolver inattendu | VPN, profil réseau ou configuration locale | Anonymiser puis comparer configuration |

## Erreurs fréquentes

- Confondre un problème DNS avec une panne applicative.
- Oublier le cache DNS et le TTL.
- Publier des resolvers internes ou noms de domaines professionnels.
- Tester seulement `A` alors qu'un service dépend aussi de `AAAA`, `CNAME` ou `TXT`.
- Interpréter un timeout DNS comme une preuve unique sans vérifier la connectivité IP.

## Lien avec incident management

Un incident DNS doit être documenté avec le nom testé, le type de record, le signal observé, le resolver utilisé, l'impact utilisateur et l'action suivante. Cette discipline rend l'escalade plus claire vers réseau, cloud platform, messagerie ou application.

## Question d'entretien en français

Comment distingueriez-vous un problème DNS d'un problème de connectivité réseau ?

## Question d'entretien en anglais

How would you troubleshoot a DNS resolution issue in a cloud operations context?

## Preuve ajoutée

Ajout de `01-reseaux-tcp-ip/notes/dns-resolution-noms.md`, `lab-03-diagnostic-dns.md` et `evidence-03-diagnostic-dns.md`.

## Prochaine action

Créer le Jour 05 sur DHCP, passerelle et attribution d'adresses dans un scénario réseau fictif.
