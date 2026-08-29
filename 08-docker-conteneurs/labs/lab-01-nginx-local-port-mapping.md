# Lab 01 - Nginx local, mapping de port et vérification HTTP

## Module associé

`08-docker-conteneurs/`

## Objectif

Déployer localement un service web simple, publier un port, vérifier la réponse HTTP, consulter les logs du conteneur concerné et observer le comportement après arrêt du service.

## Pré-requis

- Docker Desktop démarré sur la machine de laboratoire.
- Accès à un terminal dans un sandbox local.
- Aucun autre conteneur ne doit être modifié.
- Utiliser uniquement `localhost` et le nom de lab `lab-nginx`.

## Scénario fictif

> Je dois déployer localement un service web simple, publier un port, vérifier la réponse HTTP, puis arrêter le service.

Le lab est isolé des autres workloads locaux. Il ne crée aucune ressource cloud et ne scanne aucun système tiers.

## Préflight obligatoire

### `docker info`

```bash
docker info
```

Cette commande vérifie que le Docker CLI peut joindre le daemon. Un échec signifie qu'il faut résoudre le problème du runtime avant de créer le conteneur.

### `docker ps`

```bash
docker ps
```

Cette commande confirme que l'API Docker répond et affiche les conteneurs en cours d'exécution. Les conteneurs existants ne doivent pas être arrêtés, inspectés en détail ou modifiés dans ce lab.

## Exécution du lab

### Créer et démarrer le conteneur

```bash
docker run --name lab-nginx -d -p 8080:80 nginx
```

Pourquoi : créer un conteneur dédié à partir de l'image `nginx`, le lancer en arrière-plan et publier le port local `8080` vers le port HTTP `80` du conteneur.

Ce que cela prouve : si la commande réussit, le daemon a pu créer et démarrer le conteneur et appliquer le mapping demandé.

Interprétation : un identifiant de conteneur indique une création réussie. Une erreur doit être analysée sans supprimer d'autres conteneurs.

### Vérifier l'état et le mapping

```bash
docker ps --filter "name=^/lab-nginx$"
```

Pourquoi : limiter l'observation au conteneur du lab.

Ce que cela prouve : l'état `Up` et l'information `8080->80` indiquent que le service est actif et que le port est publié.

Interprétation : si `lab-nginx` n'apparaît pas, le conteneur n'est pas running ou n'a pas été créé. Ne pas conclure à un problème HTTP avant ce contrôle.

### Vérifier la réponse HTTP

```bash
curl -I http://localhost:8080
```

Pourquoi : tester l'application via le port publié, sans télécharger le contenu de la page.

Ce que cela prouve : un statut HTTP `200 OK` confirme que la requête atteint Nginx et qu'une réponse applicative revient sur `localhost`.

Interprétation : un échec peut venir du conteneur arrêté, du mapping absent, du daemon, du service ou d'un conflit local de port.

### Tester un port non publié

```bash
curl -I http://localhost:8081 || true
```

Pourquoi : fournir un contrôle négatif avec un port qui n'est pas publié par ce lab.

Ce que cela prouve : l'échec attendu confirme qu'aucun service de ce lab n'écoute sur `8081`.

Interprétation : ce résultat n'est pas un incident ; il est cohérent avec la configuration `8080:80`.

### Consulter les logs du lab

```bash
docker logs lab-nginx --tail 30
```

Pourquoi : observer uniquement les signaux opérationnels du conteneur concerné.

Ce que cela prouve : les logs peuvent confirmer le démarrage du serveur et aider à expliquer une erreur applicative.

Interprétation : les logs bruts locaux peuvent contenir des informations système. Ils restent privés et ne doivent pas être copiés tels quels dans le dépôt public.

### Arrêter le service

```bash
docker stop lab-nginx
```

Pourquoi : observer proprement le changement d'état du conteneur.

Ce que cela prouve : le service peut passer de `running` à `exited` sans que le conteneur soit automatiquement supprimé.

### Vérifier après l'arrêt

```bash
curl -I http://localhost:8080 || true
```

Pourquoi : confirmer que le port ne sert plus la réponse HTTP après l'arrêt.

Ce que cela prouve : un conteneur existant mais arrêté ne fournit pas un service actif.

## Résultat public-safe observé

- Le daemon Docker était opérationnel après le préflight.
- `lab-nginx` a été créé à partir de l'image `nginx`.
- Le mapping `localhost:8080` vers le port container `80` a été appliqué.
- `localhost:8080` a répondu avec `HTTP 200 OK` pendant l'état `running`.
- `localhost:8081` a échoué comme contrôle négatif attendu.
- Après `docker stop`, `localhost:8080` ne répondait plus.
- Le conteneur a été laissé en état `Exited (0)`.

## Avertissements public-safe

- Ne pas supprimer, arrêter ou modifier d'autres conteneurs.
- Ne pas copier de logs bruts dans le dépôt public.
- Ne pas publier d'outputs locaux contenant hostname, utilisateur, chemins, ports non anonymisés ou autres informations système.
- Ne pas utiliser `nmap` ni scanner des IP ou domaines inconnus.

## Interprétation opérationnelle

| Symptôme | Hypothèse principale | Contrôle suivant |
|---|---|---|
| `docker info` échoue | Daemon indisponible | Vérifier Docker Desktop, puis relancer le préflight |
| `lab-nginx` est `Up`, mais `8080` échoue | Mapping, port local ou service à vérifier | Relire `docker ps`, puis consulter les logs du lab |
| `8080` répond en HTTP 200 | Runtime, conteneur, mapping et application répondent | Documenter le résultat public-safe |
| `8081` échoue | Aucun service n'est publié sur ce port | Ne rien corriger : c'est le contrôle négatif attendu |
| Après `docker stop`, `8080` échoue | Service arrêté | Vérifier l'état `Exited` du seul conteneur du lab |

## Question d'entretien

Comment vérifiez-vous qu'un service conteneurisé est réellement disponible après son démarrage ?

Réponse attendue : valider le runtime avec `docker info`, vérifier l'état et le mapping avec `docker ps`, puis effectuer un test applicatif avec `curl`. Les logs du conteneur ciblé complètent le diagnostic.

## Prochaine amélioration

Créer un scénario public-safe de panne de mapping de ports pour le Jour 09, sans toucher aux conteneurs existants.
