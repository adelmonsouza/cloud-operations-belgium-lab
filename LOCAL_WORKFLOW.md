# Local workflow

## Objectif

Ce document décrit comment travailler localement sur `Cloud Operations Belgium Lab` sans compromettre la sécurité du dépôt public GitHub.

## Chemin local recommandé

Le dépôt public doit rester dans :

```text
~/Developer/cloud-operations-belgium-lab
```

## Espaces de travail

| Zone | Chemin recommandé | Usage | Git public |
|---|---|---|---|
| Dépôt public | `~/Developer/cloud-operations-belgium-lab` | Documentation propre, labs sanitizés, portfolio | Oui |
| Notes privées | `~/Developer/cloud-ops-private-notes` | Outputs bruts, screenshots à nettoyer, brouillons, questions | Non |
| Sandbox | `~/Developer/cloud-ops-sandbox` | Tests locaux, essais techniques, préparation de labs | Non |

Ne pas créer de symlink depuis le dépôt public vers les zones privées.

Les tests réels se font dans `~/Developer/cloud-ops-sandbox`. Les réponses privées, brouillons d'exercices et raisonnements non nettoyés se font dans `~/Developer/cloud-ops-private-notes/exercises`. Le dépôt public ne reçoit que la version finale sanitizée.

## Workflow recommandé

```text
Sandbox -> Private notes -> Sanitized public lab -> Security scan -> Commit -> Push
```

1. Tester ou étudier dans la sandbox.
2. Garder les notes brutes dans l'espace privé.
3. Nettoyer les outputs, hostnames, IPs, IDs cloud et screenshots.
4. Ajouter uniquement le contenu public-safe dans le dépôt public.
5. Exécuter les validations.
6. Committer avec un message clair.
7. Pousser avec `git push`, jamais avec force push.

## Commandes quotidiennes

Ouvrir le projet :

```bash
cd ~/Developer/cloud-operations-belgium-lab
code .
```

Cursor/VS Code peut être utilisé comme éditeur. Quand Codex modifie des fichiers publics, le lancer depuis `~/Developer/cloud-operations-belgium-lab` pour éviter de mélanger dépôt public, notes privées et sandbox.

Vérifier l'état Git :

```bash
git status --short --branch
git log --oneline --decorate -5
```

Lancer les validations :

```bash
bash scripts/validate-structure.sh
bash scripts/security-scan.sh
git diff --check
```

Afficher l'arborescence :

```bash
tree -L 3
```

## Checklist avant commit

- [ ] Le contenu est fictif, pédagogique ou anonymisé.
- [ ] Aucun secret, token, mot de passe ou credential.
- [ ] Aucun fichier `.env`, clé, certificat, state Terraform ou credentials JSON.
- [ ] Aucun output cloud brut.
- [ ] Aucun screenshot sensible.
- [ ] Aucun hostname réel ou IP publique personnelle.
- [ ] Aucune donnée Accenture, client ou employeur.
- [ ] `bash scripts/validate-structure.sh` réussit.
- [ ] `bash scripts/security-scan.sh` réussit.
- [ ] `git diff --check` réussit.

## Outils déjà installés ou à vérifier

Outils confirmés localement :

- Git
- GitHub CLI
- Homebrew
- VS Code/Cursor CLI
- Codex CLI
- `tree`
- `jq`
- Docker

Outils légers recommandés mais non installés dans cette passe :

```bash
brew install yq shellcheck markdownlint-cli
```

Après installation, vérifier :

```bash
yq --version
shellcheck --version
markdownlint --version
```

## Outils cloud à installer plus tard

Ne pas installer automatiquement dans une passe de documentation. Installation future possible :

```bash
brew install azure-cli
brew install awscli
brew install terraform
brew install --cask powershell
```

Ne pas exécuter de login cloud dans le dépôt public. Documenter les labs cloud avec prudence et placeholders.

## Règles public-safe

- Utiliser `example.com`, `localhost` ou des placeholders.
- Remplacer les valeurs réelles par `<LOCAL_IP_ANONYMIZED>`, `<PUBLIC_IP_REDACTED>`, `<HOSTNAME_REDACTED>`, `<TENANT_ID_REDACTED>`, `<SUBSCRIPTION_ID_REDACTED>` ou `<ACCOUNT_ID_REDACTED>`.
- Garder les outputs bruts dans `~/Developer/cloud-ops-private-notes/raw-outputs`.
- Garder les screenshots à nettoyer dans `~/Developer/cloud-ops-private-notes/screenshots-to-sanitize`.
- Ne publier que des preuves sanitizées.

## Erreurs à éviter

- Travailler directement avec des outputs bruts dans le dépôt public.
- Ajouter des captures sans vérifier les détails visibles.
- Commiter un fichier ignoré par intention de sécurité via `git add -f`.
- Scanner des systèmes tiers ou inconnus.
- Pousser si le security scan échoue.
- Utiliser `git push --force`.

## Si `.git/index.lock` apparaît

1. Vérifier s'il existe un processus Git actif :

```bash
ps aux | grep -i "[g]it"
```

2. Si un processus Git actif réel existe, ne pas supprimer le lock.
3. Si aucun processus Git actif n'existe, supprimer uniquement le lock :

```bash
rm -f .git/index.lock
```

4. Revalider :

```bash
git status --short --branch
```

## Si des fichiers apparaissent en `??`

1. Lire les chemins listés par `git status --short --branch`.
2. Identifier s'ils appartiennent au dépôt public ou aux zones privées.
3. Si le fichier est un brouillon, output brut ou screenshot non nettoyé, ne pas le committer.
4. Si le fichier est public-safe, relire son contenu puis exécuter :

```bash
bash scripts/security-scan.sh
git diff --check
```

5. Ajouter explicitement le fichier voulu avec `git add <path>`.
