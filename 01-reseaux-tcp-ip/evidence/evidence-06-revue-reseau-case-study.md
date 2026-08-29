# Evidence 06 - Revue réseau et mini case study

## Résumé public-safe du case study

Cette evidence présente une méthode en couches pour analyser une indisponibilité web intermittente dans un scénario fictif. Les signaux sont simulés ou résumés; aucun output local brut n'est publié.

## Hypothèses testées

- Résolution DNS incorrecte ou intermittente.
- Connectivité TCP ou routage instable.
- Port applicatif filtré ou non accessible.
- Service local arrêté ou absent.
- Problème firewall possible.
- Erreur TLS ou HTTP au niveau applicatif.

## Décision opérationnelle

Ne pas conclure à partir d'un seul test. La décision consiste à valider chaque couche, conserver les hypothèses éliminées, puis définir une action limitée et vérifiable. L'evidence publique ne prétend pas identifier une cause réelle d'entreprise.

## Ce que l'evidence montre

- Une méthode ordonnée de troubleshooting.
- La différence entre DNS, TCP, port, service et HTTP.
- L'utilisation de commandes sûres sur `example.com` et `localhost`.
- Une pratique de documentation adaptée à l'incident management.
- La capacité à séparer les informations publiques des outputs privés.

## Ce que l'evidence ne montre pas

- La santé d'une infrastructure réelle.
- Une résolution d'incident chez un employeur ou un client.
- Des résultats bruts de machine ou de production.
- Une preuve de disponibilité complète d'une application réelle.

## Limites du diagnostic

- Le scénario est fictif et les résultats sont synthétiques.
- Les tests ne couvrent pas toutes les routes HTTP ni toutes les dépendances.
- Un test réussi à un instant donné ne garantit pas l'absence d'intermittence.
- L'analyse firewall reste une hypothèse tant que la règle autorisée n'est pas vérifiée.

## Preuve synthétique

| Couche | Test public-safe | Signal simulé | Décision |
|---|---|---|---|
| DNS | `dig example.com` | Résolution cohérente | Poursuivre vers TCP |
| TCP | `nc -vz example.com 443` | Connexion établie | Poursuivre vers HTTP |
| HTTP | `curl -I https://example.com` | Réponse HTTP reçue | Vérifier le périmètre applicatif |
| Service local | `lsof ...` ou `netstat ...` | Résultat anonymisé | Ne publier que la conclusion utile |
| Incident | Matrice et timeline | Hypothèses tracées | Définir la next action |

## Prochaine action recommandée

Créer un runbook fictif "Web service intermittently unavailable" avec critères de succès, conditions d'escalade et règles de conservation des evidence.
