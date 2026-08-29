# Politique de sécurité et confidentialité

Ce dépôt est public-safe, orienté apprentissage, sans données d'employeur, client ou environnement interne.

## Public repository threat model

Ce dépôt étant public, le risque principal n'est pas l'exploitation technique du dépôt lui-même, mais la fuite involontaire d'informations : secrets, identifiants cloud, données personnelles, données employeur/client, screenshots bruts ou outputs d'outils contenant trop de contexte.

## What can go wrong

- Un fichier `.env`, state Terraform ou credential JSON peut être ajouté par erreur.
- Une capture peut révéler un nom d'utilisateur, tenant ID, subscription ID, IP publique ou chemin local.
- Un log peut contenir un token, une URL interne ou une donnée client.
- Un lab cloud peut exposer des IDs réels dans une evidence.
- Un texte portfolio peut sur-vendre un lab personnel comme expérience production.

## GitHub public repository rules

- Tout contenu doit être fictif, pédagogique ou anonymisé.
- Les outputs bruts restent hors du dépôt public.
- Les preuves publiées doivent être relues et sanitizadas.
- Les commits doivent rester petits et vérifiables.
- Aucun push ne doit être fait si le scan sécurité échoue.

## Secret scanning and push protection expectation

GitHub secret scanning et push protection doivent être considérés comme une couche supplémentaire, pas comme la seule protection. Le dépôt fournit aussi `scripts/security-scan.sh` pour un contrôle local simple avant commit et push.

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

## Evidence sanitization policy

Une evidence publique doit remplacer les données réelles par des placeholders comme `<LOCAL_IP_ANONYMIZED>`, `<PUBLIC_IP_REDACTED>`, `<TENANT_ID_REDACTED>`, `<SUBSCRIPTION_ID_REDACTED>`, `<ACCOUNT_ID_REDACTED>`, `<USERNAME_REDACTED>`, `<HOSTNAME_REDACTED>`, `<RESOURCE_GROUP_EXAMPLE>` ou `<FAKE_COMPANY_EXAMPLE>`.

## Screenshot sanitization policy

Les screenshots bruts ne doivent pas être commités. Toute capture publique doit être relue, recadrée si nécessaire, et masquer noms, e-mails, IDs, IPs, chemins locaux, abonnements cloud, noms de ressources réelles et informations d'employeur/client.

## Cloud output sanitization policy

Les sorties Azure, AWS, Terraform, Docker, GitHub ou outils de supervision doivent être nettoyées avant publication. Les IDs cloud, resource IDs, account IDs, subscriptions, tenants, usernames, hostnames et IPs doivent être remplacés par des placeholders.

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

## Local pre-push checklist

- [ ] `git status --short --branch` propre.
- [ ] `bash scripts/validate-structure.sh` réussi.
- [ ] `bash scripts/security-scan.sh` réussi.
- [ ] Aucun screenshot brut.
- [ ] Aucun output cloud réel non nettoyé.
- [ ] Aucun fichier sensible détecté.
- [ ] Push normal uniquement, jamais force push.

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

## Emergency procedure if sensitive data is committed

1. Arrêter toute publication supplémentaire.
2. Identifier le type de donnée exposée sans la recopier.
3. Révoquer le secret ou l'identifiant concerné si applicable.
4. Nettoyer le contenu et l'historique Git avec une méthode appropriée.
5. Vérifier GitHub Actions, artefacts, issues et PR.
6. Refaire `bash scripts/security-scan.sh`.
7. Reprendre les commits uniquement après validation.

## Decision rule: when to move content to private repo

Public : documentation propre, labs fictifs, templates, portfolio et evidences sanitizadas.

Privé : rascunhos, screenshots bruts, outputs réels, debugging temporário, notes non relues et tout matériel incertain.
