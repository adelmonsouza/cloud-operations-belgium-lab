# Modèle public/privé de publication

## Objectif

Définir ce qui peut être publié dans le dépôt public et ce qui doit rester dans un espace privé pendant l'étude, le nettoyage ou le debugging.

## Repo public

Le dépôt public contient uniquement :

- documentation propre ;
- labs fictifs ou pédagogiques ;
- preuves sanitizadas ;
- templates ;
- portfolio honnête ;
- journaux d'apprentissage relus ;
- scripts non destructifs et sans secrets.

## Repo privé

Un espace privé doit être utilisé pour :

- notes brutes ;
- screenshots temporaires ;
- outputs à nettoyer ;
- erreurs de manipulation ;
- brouillons ;
- tout matériel incertain ;
- preuves pas encore anonymisées.

## Flux recommandé

1. Etudier dans un espace contrôlé.
2. Garder le brouillon privé.
3. Sanitizar les outputs, captures et notes.
4. Déplacer uniquement l'evidence propre vers le dépôt public.
5. Exécuter `bash scripts/security-scan.sh`.
6. Créer un commit clair.
7. Pousser vers GitHub avec un push normal.

## Règle de décision

Si une information peut exposer une personne, un client, un employeur, une infrastructure réelle ou un identifiant cloud, elle reste privée jusqu'à anonymisation complète.
