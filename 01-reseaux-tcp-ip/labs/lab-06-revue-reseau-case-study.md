# Lab 06 - Revue réseau et mini case study de troubleshooting

## Module associé

`01-reseaux-tcp-ip/`

## Objectif

Appliquer une méthode de diagnostic en couches à un incident applicatif fictif, puis transformer l'analyse en evidence public-safe exploitable en entretien.

## Pré-requis

- Avoir relu les labs TCP/IP, DNS, DHCP, ports et connectivité.
- Utiliser uniquement `example.com`, `localhost` et des placeholders.
- Ne pas copier d'outputs locaux bruts.
- Aucun scan de système tiers et aucune commande offensive.

## Scénario fictif

> Un utilisateur indique qu’une application web est indisponible. Le nom DNS semble correct, mais l’accès au service échoue de manière intermittente.

Le scénario ne représente aucun employeur, client ou environnement réel. Il sert à pratiquer une investigation reproductible et limitée.

## Méthode en couches

### 1. Identifier le symptôme utilisateur

Clarifier l'URL d'exemple, l'heure, la fréquence, le périmètre et le message visible. Ne pas conclure à un problème réseau sur la seule base d'un message applicatif.

### 2. Vérifier DNS

```bash
dig example.com
```

Un résultat DNS cohérent permet de poursuivre, mais ne prouve pas que le service HTTP est disponible.

### 3. Vérifier la connectivité TCP

```bash
nc -vz example.com 443
nc -vz example.com 80
```

Un succès montre qu'une connexion TCP peut être établie vers le port testé. Un échec doit être comparé au type de signal : refus immédiat ou timeout.

### 4. Vérifier le port applicatif et HTTP

```bash
curl -I https://example.com
```

Une réponse HTTP confirme qu'une requête applicative a atteint le service et qu'une réponse a été reçue. Elle ne prouve pas la santé fonctionnelle de toutes les routes de l'application.

### 5. Vérifier le service local ou distant autorisé

```bash
lsof -iTCP -sTCP:LISTEN -n -P
netstat -an | grep LISTEN
```

Ces commandes peuvent exposer des informations locales. Dans un exercice réel, garder les sorties privées et ne publier qu'un résumé anonymisé.

### 6. Distinguer les hypothèses

Comparer les signaux DNS, TCP, port, firewall, service et HTTP. Une investigation sérieuse conserve les hypothèses éliminées et justifie l'action suivante.

### 7. Documenter l'evidence

Noter la commande, le signal attendu, le résultat synthétique et la décision. Remplacer les valeurs locales par des placeholders avant toute publication.

### 8. Définir la next action

La prochaine action doit être limitée et vérifiable : reproduire sur `localhost`, consulter un log autorisé, vérifier un service ciblé ou demander une information de périmètre.

## Tableau de diagnostic

| Symptôme | Couche | Test | Signal attendu | Hypothèse | Action |
|---|---|---|---|---|---|
| Le nom ne se résout pas | DNS | `dig example.com` | Réponse cohérente | DNS, cache ou configuration de nom | Vérifier le resolver autorisé et le nom utilisé |
| DNS OK, connexion TCP échoue | TCP/réseau | `nc -vz example.com 443` | Connexion établie ou erreur explicite | Routage, filtrage ou service non joignable | Comparer 443 et 80, puis qualifier l'erreur |
| TCP OK, HTTP échoue | HTTP/application | `curl -I https://example.com` | Statut HTTP | TLS, reverse proxy ou application | Examiner le statut et le périmètre applicatif |
| Service local absent | Service | `lsof -iTCP -sTCP:LISTEN -n -P` | Aucun listener attendu | Service arrêté ou non démarré | Vérifier uniquement le service du lab |
| Port non publié | Port | Test sur `localhost` | Connexion refusée | Mapping absent | Vérifier la configuration autorisée |
| Timeout intermittent | Réseau/firewall | Test répété contrôlé | Réponse variable | Perte, filtrage ou dépendance instable | Documenter fréquence et fenêtre d'observation |
| Application stopped | Application | Requête HTTP locale | Échec après arrêt | Processus applicatif arrêté | Vérifier l'état puis appliquer le runbook |

## Matrice de décision

| Cas | Ce que le signal suggère | Ce qu'il ne prouve pas |
|---|---|---|
| DNS échoue | Le nom n'est pas résolu dans le contexte testé | Que le réseau ou l'application sont indisponibles |
| DNS OK, TCP échoue | La résolution fonctionne mais la connexion ne s'établit pas | Que le firewall est la seule cause |
| TCP OK, HTTP échoue | Le transport répond mais l'application ou TLS doit être étudié | Que l'application est saine |
| Service local absent | Aucun processus attendu n'écoute | Qu'un service distant est indisponible |
| Port non publié | Aucun chemin local n'expose ce port | Que le conteneur ou service n'existe pas |
| Firewall possible | Un filtrage peut expliquer le signal | Que la règle est définitivement identifiée |
| Application stopped | Le processus applicatif n'est pas actif | Que le runtime est en panne |

## Erreurs fréquentes

- Tester uniquement HTTP sans vérifier DNS et TCP.
- Confondre DNS OK avec application OK.
- Conclure à un firewall sans qualifier `timeout` ou `connection refused`.
- Publier un output local complet au lieu d'un résumé.
- Modifier un service ou un workload qui ne fait pas partie du périmètre.
- Sauter l'étape de définition du symptôme et du périmètre.

## Lien avec incident management

Le case study suit une structure d'incident : symptôme, périmètre, timeline, hypothèses, tests, décision, communication et next action. Cette discipline rend l'analyse relisible par une équipe et facilite ensuite un runbook ou une RCA.

## Question d'entretien - français

Comment diagnostiqueriez-vous une application web intermittente alors que le DNS semble fonctionner ?

Réponse attendue : partir du symptôme, vérifier DNS, tester TCP sur le port concerné, vérifier HTTP, qualifier les timeouts ou refus, contrôler le service autorisé et documenter les hypothèses sans exposer de données sensibles.

## Interview question - English

How would you troubleshoot an intermittent web application outage when DNS appears to work?

## Preuve attendue

Une matrice remplie avec des signaux simulés ou anonymisés, une décision par hypothèse et une next action clairement limitée.

## Prochaine amélioration

Transformer ce case study en mini case study portfolio avec une timeline fictive et un runbook associé.
