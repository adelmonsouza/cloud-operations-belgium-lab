# Contribution

Même si ce dépôt est personnel, il suit une discipline de contribution professionnelle.

## Branches

- `main` : version stable et présentable.
- `lab/<module>-<sujet>` : ajout ou amélioration d'un lab.
- `docs/<sujet>` : documentation, portfolio ou templates.
- `fix/<sujet>` : correction ciblée.

## Commits

Utiliser des messages courts, explicites et orientés résultat, par exemple :

- `Add TCP/IP diagnostic lab template`
- `Document Azure monitoring evidence rules`
- `Improve Terraform safety checklist`

## Ajouter un lab

1. Créer un fichier dans le dossier `labs/` du module.
2. Utiliser `templates/lab-report-template.md`.
3. Ajouter les commandes et résultats attendus.
4. Ajouter les validations et limites.
5. Lier l'evidence correspondante.

## Ajouter une evidence

1. Utiliser `templates/evidence-template.md`.
2. Vérifier la confidentialité avant commit.
3. Expliquer pourquoi la preuve est utile.
4. Ne jamais ajouter de secret, donnée client ou donnée employeur.

## Vérification confidentialité

Avant chaque PR ou commit important :

- relire `SECURITY.md` ;
- exécuter `git diff` ;
- vérifier screenshots, logs, Terraform et fichiers cloud ;
- remplacer toute donnée réelle par des placeholders.

## Pull request propre

Une PR doit contenir :

- objectif clair ;
- fichiers modifiés ;
- validations exécutées ;
- risques ou limites ;
- checklist de confidentialité.

## Definition of done pour un module

Un module est considéré complet quand il contient :

- README à jour ;
- notes principales ;
- au moins un lab documenté ;
- evidence anonymisée ;
- questions d'entretien avec réponses préparées ;
- lien vers portfolio ou CV si pertinent ;
- validation de structure réussie.
