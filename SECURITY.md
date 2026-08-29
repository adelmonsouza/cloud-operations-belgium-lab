# Politique de sécurité et confidentialité

Ce dépôt est public-safe, orienté apprentissage, sans données d'employeur, client ou environnement interne.

## Données interdites

Ne jamais committer :

- secrets, tokens, mots de passe, clés API, certificats privés ;
- fichiers `.env`, `.tfvars`, state Terraform réel ou credentials cloud ;
- noms de clients, employeurs, systèmes internes ou tickets réels ;
- données personnelles, e-mails réels, identifiants, IP internes non anonymisées ;
- screenshots contenant informations sensibles ;
- logs bruts provenant d'un environnement professionnel ;
- contenu offensif de cybersécurité ou scripts destructifs.

## Gestion des secrets

- Utiliser uniquement des placeholders comme `REPLACE_WITH_DEMO_VALUE`.
- Ne jamais documenter une vraie valeur secrète, même partiellement.
- Vérifier `git diff` avant chaque commit.
- Révoquer immédiatement tout secret exposé par erreur.

## Screenshots

- Masquer noms, comptes, adresses e-mail, IDs tenant, subscription IDs, IPs internes et chemins sensibles.
- Préférer des captures de labs locaux ou environnements pédagogiques.
- Ajouter une note indiquant que la capture est anonymisée.

## Terraform

- Ne jamais committer `.terraform/`, `terraform.tfstate`, `terraform.tfstate.*` ou `*.tfvars`.
- Les exemples doivent être pédagogiques et utiliser des variables factices.
- Les plans Terraform ajoutés comme evidence doivent être anonymisés.

## Azure et AWS

- Ne pas créer de ressources cloud réelles depuis ce dépôt sans décision explicite hors dépôt.
- Ne jamais stocker de credentials CLI.
- Anonymiser tenant, subscription, account ID, resource group et régions si nécessaire.
- Documenter les coûts potentiels dans tout lab cloud.

## Logs et evidence

- Nettoyer toute evidence avant commit.
- Supprimer ou masquer identifiants, tokens, chemins privés, adresses e-mail, données client et données employeur.
- Les evidence doivent prouver un apprentissage, pas exposer un environnement réel.

## No employer/client data

Aucune donnée Accenture, client, fournisseur, ticket, outil interne, procédure interne ou information confidentielle ne doit être ajoutée. Les scénarios doivent être fictifs et pédagogiques.

## Fictitious scenarios only

Les entreprises, utilisateurs, incidents, architectures et besoins décrits dans ce dépôt sont fictifs, anonymisés ou créés pour l'apprentissage.

## Checklist avant commit

- [ ] `git diff` relu.
- [ ] Aucun secret ou fichier `.env`.
- [ ] Aucun fichier Terraform sensible.
- [ ] Aucune donnée employeur/client.
- [ ] Screenshots anonymisés.
- [ ] Logs nettoyés.
- [ ] Scripts non destructifs.

## Vérification locale avant commit

Ces commandes sont public-safe et ne créent aucune ressource cloud. Elles servent à détecter des fichiers ou motifs évidents avant un commit.

```bash
# Vérifier les fichiers sensibles qui ne doivent pas être versionnés.
find . -path ./.git -prune -o \( \
  -name '.env' -o \
  -name '.env.*' -o \
  -name '*.pem' -o \
  -name '*.key' -o \
  -name '*.pfx' -o \
  -name '*.p12' -o \
  -name 'terraform.tfstate' -o \
  -name 'terraform.tfstate.*' -o \
  -name '*.tfvars' \
\) -print

# Rechercher des formats évidents de tokens ou clés privées réelles.
grep -RInE --exclude-dir=.git --exclude='*.gitkeep' \
  '(AKIA[0-9A-Z]{16}|ASIA[0-9A-Z]{16}|sk-[A-Za-z0-9_-]{20,}|ghp_[A-Za-z0-9_]{20,}|github_pat_[A-Za-z0-9_]{20,}|xox[baprs]-[A-Za-z0-9-]{20,}|-----BEGIN [A-Z ]*PRIVATE KEY-----)' .

# Vérifier la structure du dépôt avant commit.
bash scripts/validate-structure.sh

# Relire les changements exacts avant commit.
git diff --staged
```

Les mots pédagogiques comme `secret`, `token`, `password`, `.env`, `tfstate` ou `tfvars` peuvent apparaître dans cette politique ou dans `.gitignore`. Ce n'est pas un problème tant qu'aucune valeur réelle, clé privée ou fichier sensible n'est présent.

## Checklist avant rendre public

- [ ] Relecture complète de `SECURITY.md`.
- [ ] Recherche de mots clés sensibles.
- [ ] Vérification `.gitignore`.
- [ ] Validation avec `scripts/validate-structure.sh`.
- [ ] Suppression des captures non anonymisées.
- [ ] Vérification de l'historique Git si un secret a pu être commité.

## Si un secret est commité par erreur

1. Considérer le secret compromis.
2. Révoquer ou faire tourner le secret à la source.
3. Supprimer le secret du dépôt et de l'historique si nécessaire.
4. Vérifier qu'aucune copie n'est restée dans issues, PR, logs CI ou artefacts.
5. Documenter l'incident sans révéler le secret.
