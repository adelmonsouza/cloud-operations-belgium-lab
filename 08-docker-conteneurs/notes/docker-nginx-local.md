# Docker Nginx local

## Définitions simples

- **Docker CLI** : outil en ligne de commande utilisé pour demander des opérations au runtime Docker.
- **Docker daemon** : service backend qui crée, démarre, arrête et observe les conteneurs.
- **Docker Desktop** : application macOS qui fournit notamment le runtime Docker local.
- **Image** : modèle immuable utilisé pour créer un conteneur, ici `nginx`.
- **Container** : instance isolée d'une image, ici `lab-nginx`.
- **Port mapping** : publication d'un port de l'hôte vers un port du conteneur.
- **localhost** : machine locale utilisée comme seule cible de vérification dans ce lab.
- **running** : conteneur démarré et potentiellement capable de servir une application.
- **exited** : conteneur arrêté, mais encore présent jusqu'à une suppression explicite.
- **logs** : événements et messages produits par le processus du conteneur.

## Comprendre les commandes clés

### `-d`

L'option `-d` lance le conteneur en arrière-plan. Le terminal reste disponible pour exécuter `docker ps`, `curl` et les autres contrôles.

### `-p 8080:80`

La notation signifie : port `8080` côté hôte vers port `80` côté conteneur. Le port `80` est le port HTTP utilisé par Nginx dans le conteneur; `8080` permet d'y accéder localement sans supposer qu'un autre service de l'hôte utilise déjà le port `80`.

### Pourquoi `8081` échoue comme test négatif

Le lab publie uniquement `8080:80`. Aucun mapping ne relie `8081` au conteneur; un échec de `curl` sur `localhost:8081` est donc attendu et sert de contrôle négatif.

### Pourquoi `docker info` est un préflight

`docker info` vérifie la communication entre le CLI et le daemon. Une version CLI affichée seule ne garantit pas que le runtime est démarré. Sans daemon, `docker run` ne peut pas créer le conteneur.

### Pourquoi ne pas toucher aux conteneurs existants

Le lab doit rester isolé et réversible. Arrêter, supprimer ou inspecter en détail un workload qui n'appartient pas au lab créerait un risque opérationnel inutile.

## Runtime, container et application

- Le **runtime** fournit la capacité d'exécuter des conteneurs.
- Le **container** porte le processus isolé et son état de cycle de vie.
- L'**application** est le service réellement testé, ici Nginx via HTTP.

Ces niveaux doivent être vérifiés séparément : daemon disponible, conteneur `running`, port publié, puis réponse applicative.

## Différence entre les états

| Situation | Signification | Contrôle |
|---|---|---|
| CLI disponible, daemon indisponible | Le client est installé mais ne peut pas exécuter les demandes | `docker info` |
| Container `running` | Le processus du conteneur est actif | `docker ps` |
| Port publié | L'hôte redirige un port vers le conteneur | `docker ps` puis `curl` |
| Container `exited` | Le conteneur existe mais son processus est arrêté | `docker ps -a` ciblé |
| HTTP 200 | L'application a répondu à la requête | `curl -I http://localhost:8080` |

## Explication en entretien - français

> J'ai d'abord validé le runtime Docker avec `docker info`, puis j'ai lancé un container Nginx dédié, publié le port 8080 vers le port 80 du container et vérifié la réponse HTTP sur localhost. J'ai aussi testé un port non publié pour confirmer le comportement attendu, puis arrêté le container pour observer la différence entre un service running et stopped.

## Interview explanation - English

> I first validated the Docker runtime with `docker info`, then started a dedicated Nginx container, published host port 8080 to container port 80, and verified the HTTP response on localhost. I also tested an unpublished port as a negative control, then stopped the container to observe the difference between a running and a stopped service.

## Règles de publication

Les outputs bruts, logs détaillés, noms de workloads non concernés, chemins locaux, hostnames et informations utilisateur restent privés. La preuve publique se limite aux commandes génériques, aux placeholders et aux résultats synthétiques.
