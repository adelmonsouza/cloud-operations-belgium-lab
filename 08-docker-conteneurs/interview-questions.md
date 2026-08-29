# Questions d'entretien - Docker et conteneurs

## Questions en français

1. Quelle est la différence entre une image Docker et un conteneur ?
2. Pourquoi vérifier `docker info` avant d'exécuter `docker run` ?
3. Comment expliquez-vous le mapping `8080:80` ?
4. Quelle différence faites-vous entre un conteneur `running` et `exited` ?
5. Comment vérifiez-vous qu'un service HTTP conteneurisé est réellement disponible ?

## Questions en anglais

1. What is the difference between a Docker image and a container?
2. Why should you run `docker info` before `docker run`?
3. How would you troubleshoot a published port that does not respond?

## Structure de réponse recommandée

Répondre avec une séquence opérationnelle : préflight du runtime, état du conteneur, mapping de port, test applicatif, logs ciblés et décision. Mentionner la séparation entre les workloads du lab et les autres conteneurs.

## Preuves liées

- [Lab Nginx local](labs/lab-01-nginx-local-port-mapping.md)
- [Evidence Nginx local](evidence/evidence-01-nginx-local-port-mapping.md)

## TODO

- [ ] Préparer une réponse STAR à partir du lab.
- [ ] Ajouter un cas de mapping incorrect avec des valeurs fictives.
- [ ] Relier le diagnostic à un runbook d'incident.
