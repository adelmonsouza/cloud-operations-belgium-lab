# Evidence 01 - Nginx local et mapping de port

## Résumé public-safe du lab

Un conteneur Nginx dédié a été lancé localement après validation du daemon Docker. Le port `8080` de `localhost` a été publié vers le port HTTP `80` du conteneur. La réponse HTTP a été vérifiée, puis le conteneur a été arrêté pour observer la différence entre un service actif et un conteneur existant mais arrêté.

Les résultats ci-dessous sont un résumé nettoyé. Aucun output brut local n'est publié.

## Tableau de preuve

| Étape | Commande | Signal attendu | Résultat observé public-safe | Décision |
|---|---|---|---|---|
| Préflight runtime | `docker info` | Section serveur disponible | Daemon Docker opérationnel | Continuer |
| Préflight conteneurs | `docker ps` | API Docker répond | Conteneurs existants visibles, aucun modifié | Continuer sans toucher aux autres workloads |
| Création | `docker run --name lab-nginx -d -p 8080:80 nginx` | Identifiant de conteneur | `lab-nginx` créé avec succès | Vérifier l'état |
| Mapping | `docker ps --filter "name=^/lab-nginx$"` | `8080->80`, état `Up` | Mapping `8080:80` visible | Tester HTTP |
| Test applicatif | `curl -I http://localhost:8080` | Statut HTTP | `HTTP 200 OK` pendant l'exécution | Service joignable |
| Contrôle négatif | `curl -I http://localhost:8081 \|\| true` | Connexion refusée ou échec | Échec attendu, aucun mapping `8081` | Configuration cohérente |
| Observation | `docker logs lab-nginx --tail 30` | Logs du service ciblé | Logs consultés uniquement pour `lab-nginx` | Ne pas publier les logs bruts |
| Arrêt | `docker stop lab-nginx` | État `Exited` | Conteneur arrêté proprement | Vérifier l'effet sur HTTP |
| Après arrêt | `curl -I http://localhost:8080 \|\| true` | Échec HTTP | Service non joignable après arrêt | Confirmer `running` ≠ `stopped` |

## Analyse opérationnelle

Le résultat démontre quatre niveaux distincts :

1. Le Docker CLI est disponible et le daemon répond.
2. Le conteneur `lab-nginx` peut être créé et démarré.
3. Le mapping `8080:80` rend l'application accessible via `localhost:8080`.
4. L'arrêt du conteneur supprime le service actif tout en conservant le conteneur dans l'état `Exited`.

Un port publié n'est pas la même chose qu'un port non publié. De même, un conteneur existant n'est pas nécessairement un service running.

## Ce qui peut être montré publiquement

- Les commandes génériques du lab.
- Le mapping fictif `8080:80`.
- Les statuts HTTP synthétiques.
- Le cycle `running` puis `Exited`.
- L'analyse de la différence entre CLI et daemon.

## Ce qui doit rester privé

- Logs bruts du conteneur.
- Liste détaillée des autres conteneurs locaux.
- Hostname, nom d'utilisateur, chemins locaux et ports non liés au lab.
- Screenshots ou outputs non relus.

## Décision

La preuve est acceptable pour une publication publique : elle est limitée à `localhost`, au conteneur `lab-nginx`, à l'image `nginx` et à des résultats résumés. Aucun autre workload n'a été modifié.

## Résultat public-safe

Le lab confirme qu'un préflight runtime, un mapping de port, un test HTTP et une observation de cycle de vie forment une méthode simple et reproductible pour un premier diagnostic Cloud Operations.
