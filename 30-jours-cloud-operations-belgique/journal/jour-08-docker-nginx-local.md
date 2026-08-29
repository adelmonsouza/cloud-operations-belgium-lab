# Jour 08 - Docker Nginx local

## Objectif du jour

Comprendre le daemon Docker, le cycle de vie d'un conteneur, la publication d'un port et la vérification HTTP d'un service local.

## Préflight Docker

J'ai d'abord vérifié le runtime avec `docker info`, puis la réponse de l'API avec `docker ps`. Cette étape a confirmé que Docker Desktop et le daemon étaient opérationnels avant la création du conteneur.

## Ce que j'ai testé

- Création du conteneur dédié `lab-nginx` depuis l'image `nginx`.
- Publication du port `localhost:8080` vers le port `80` du conteneur.
- Vérification HTTP avec `curl -I http://localhost:8080`.
- Contrôle négatif sur `localhost:8081`, qui n'était pas publié.
- Consultation des logs de `lab-nginx` uniquement.
- Arrêt contrôlé du conteneur et nouvelle vérification HTTP.

## Ce que j'ai compris

Le Docker CLI installé ne garantit pas que le daemon est disponible. Un préflight réussi permet ensuite de distinguer le runtime, le conteneur, le mapping de port et l'application.

Le résultat `HTTP 200 OK` sur `localhost:8080` confirmait qu'un Nginx running était accessible via le mapping `8080:80`. Après `docker stop`, le conteneur existait toujours en état `Exited`, mais le service ne répondait plus.

## Incident précédent : CLI disponible mais daemon indisponible

Lors d'un premier essai, le CLI Docker était installé mais le daemon Docker Desktop n'était pas joignable. Les tests HTTP échouaient alors parce qu'aucun conteneur n'avait été créé et qu'aucun service n'écoutait sur le port attendu.

## Résolution

Docker Desktop a été démarré manuellement, puis `docker info` et `docker ps` ont confirmé que le runtime était prêt. Le lab a ensuite été exécuté dans le sandbox local.

## Résultat du lab

- `lab-nginx` créé avec succès.
- Mapping `8080:80` validé.
- `localhost:8080` : réponse `HTTP 200 OK` pendant l'état `running`.
- `localhost:8081` : échec attendu, aucun service n'y était publié.
- `lab-nginx` arrêté proprement et laissé en état `Exited (0)`.
- Aucun autre conteneur n'a été modifié.

## Ce qui reste privé

Les logs bruts, la liste détaillée des autres conteneurs, les chemins locaux, les informations utilisateur et tout output non relu restent hors du dépôt public. La preuve publiée se limite à des commandes génériques et à des résultats synthétiques.

## Prochaine étape

Jour 09 : documenter un échec de mapping de port et construire une méthode de troubleshooting Docker public-safe.
