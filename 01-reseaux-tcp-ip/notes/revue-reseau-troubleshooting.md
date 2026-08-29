# Revue réseau et troubleshooting

## Rappel des couches

- **DNS** : associe un nom à une adresse utilisable par le client.
- **TCP** : établit une connexion fiable vers un port.
- **TLS** : protège et négocie une connexion HTTPS.
- **HTTP** : protocole applicatif qui transporte la requête et la réponse web.
- **Port** : point logique d'accès à un service.
- **Service** : processus qui écoute et traite les requêtes.
- **Firewall** : contrôle qui peut être autorisé ou refusé selon des règles.

## Différences importantes

### DNS OK et application OK

DNS OK signifie seulement que le nom a été résolu dans le contexte du test. Il faut encore vérifier TCP, le port, TLS et HTTP avant de dire que l'application est disponible.

### Port fermé et timeout

Un refus immédiat, souvent décrit comme `connection refused`, indique généralement qu'une cible a répondu mais qu'aucun service n'accepte la connexion sur ce port. Un `timeout` signifie que la réponse attendue n'est pas arrivée dans le délai; le filtrage, le routage ou une perte peuvent être en cause. Aucun de ces signaux ne suffit seul à prouver la cause racine.

### Service stopped et port non publié

Un service `stopped` peut exister mais ne plus écouter. Un port non publié signifie qu'aucun chemin n'expose le service sur le port testé. Dans les deux cas, le test HTTP échoue, mais l'action corrective n'est pas la même.

### Problème réseau et problème applicatif

Un problème réseau empêche généralement d'atteindre le service ou le port. Un problème applicatif peut laisser TCP répondre tout en produisant une erreur HTTP, une réponse lente ou un comportement fonctionnel incorrect. Il faut vérifier les couches avant de classer l'incident.

## Méthode d'entretien

- « Je ne saute pas directement à la conclusion. »
- « Je valide couche par couche. »
- « Je distingue le signal observé de l'hypothèse qu'il suggère. »
- « Je garde les outputs sensibles hors du dépôt public. »
- « Je termine par une next action mesurable. »

## Questions d'entretien en français

1. Quelle est votre méthode face à une indisponibilité web intermittente ?
2. Que signifie DNS OK mais HTTP en échec ?
3. Comment distinguez-vous un timeout d'un refus de connexion ?
4. Pourquoi un port ouvert ne garantit-il pas que l'application fonctionne correctement ?
5. Comment documentez-vous une investigation pour qu'elle soit utile à une équipe d'astreinte ?

## Questions d'entretien en anglais

1. How do you investigate an intermittent web outage?
2. What does DNS working but HTTP failing tell you?
3. How do you distinguish a timeout from a connection refusal?

## Réponses à préparer

- [ ] Donner un exemple fictif avec la matrice du lab.
- [ ] Expliquer une décision sans présenter une hypothèse comme un fait.
- [ ] Décrire la sanitization d'une evidence.

## Bridge to Docker

Cette méthode sera réutilisée dans Docker :

- comparer le port host au port container ;
- vérifier `localhost` comme point d'accès ;
- distinguer un service `running` d'un service `stopped` ;
- consulter les logs du conteneur ciblé ;
- ajouter plus tard un healthcheck pour compléter le test HTTP.
