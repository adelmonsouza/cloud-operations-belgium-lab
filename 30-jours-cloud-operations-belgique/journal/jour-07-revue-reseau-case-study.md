# Jour 07 - Revue réseau et mini case study de troubleshooting

## Objectif du Jour 07

Consolider les apprentissages de la première semaine réseau et appliquer une méthode structurée à un incident applicatif fictif.

## Pourquoi cette revue est nécessaire avant Docker

Docker ajoute une couche de runtime, de conteneur et de publication de ports, mais les fondamentaux restent réseau : résolution, connectivité TCP, port, service et réponse HTTP. Une revue en couches évite de confondre un problème de runtime avec un problème d'application.

## Ce que la première semaine a couvert

- TCP/IP, adresse, masque, passerelle et route.
- DNS, cache, résolution et erreurs de nom.
- DHCP, adressage et passerelle par défaut.
- Ports, firewall, timeout et `connection refused`.
- Vérification HTTP avec `curl`.
- Observation contrôlée de `localhost` et des services locaux.
- Production d'evidence public-safe sans output brut.

## Ce que je sais diagnostiquer maintenant

Je sais partir d'un symptôme utilisateur, vérifier chaque couche dans l'ordre, formuler des hypothèses et définir une action suivante. Je distingue aussi une réponse DNS d'une disponibilité applicative et un conteneur ou service arrêté d'un port non publié.

## Comment je structure une investigation

1. Reformuler le symptôme et son périmètre.
2. Vérifier DNS.
3. Vérifier la connectivité TCP.
4. Vérifier le port applicatif.
5. Vérifier le service local ou distant autorisé.
6. Comparer les signaux et éliminer les hypothèses.
7. Produire une evidence nettoyée.
8. Définir une next action mesurable.

## Ce qui reste privé

Les outputs bruts, adresses locales, hostnames, utilisateurs, chemins, logs et détails d'environnements réels restent hors du dépôt public. La publication utilise uniquement des placeholders et des résultats simulés.

## Résultat du jour

La revue relie les cinq premiers labs réseau à une méthode de troubleshooting réutilisable. Elle confirme que le diagnostic doit progresser de DNS vers TCP, port, service et HTTP, sans sauter directement à une conclusion.

## Prochaine étape

Continuer les labs Docker avec le Jour 09 : `Docker port mapping failures and troubleshooting`.
