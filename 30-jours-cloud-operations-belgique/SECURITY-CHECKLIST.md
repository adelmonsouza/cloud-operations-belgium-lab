# Checklist sécurité avant publication

Avant de publier un journal, une preuve, une capture, un post LinkedIn ou un élément de portfolio :

- [ ] Aucun nom de client.
- [ ] Aucune donnée Accenture.
- [ ] Aucun ticket réel.
- [ ] Aucun screenshot sensible.
- [ ] Aucun token.
- [ ] Aucun secret.
- [ ] Aucun mot de passe.
- [ ] Aucun identifiant cloud réel.
- [ ] Aucun tenant ID, subscription ID ou account ID réel.
- [ ] Aucun détail d'infrastructure réelle.
- [ ] Aucun nom de système interne.
- [ ] Aucun log brut non anonymisé.
- [ ] Aucun fichier `.env`, `.tfvars`, state Terraform, certificat ou clé privée.
- [ ] Le scénario est clairement indiqué comme fictif ou pédagogique.
- [ ] La preuve montre une compétence sans exposer un environnement réel.

En cas de doute, ne pas publier et remplacer par un exemple fictif ou anonymisé.

## Avant chaque journal

- [ ] Le texte reste factuel et professionnel.
- [ ] Aucune donnée personnelle inutile.
- [ ] Aucun nom d'employeur/client dans un contexte technique.
- [ ] Les apprentissages sont présentés comme labs personnels ou scénarios pédagogiques.

## Avant chaque lab

- [ ] Les commandes sont sûres et non destructives.
- [ ] Aucun credential requis.
- [ ] Aucun output brut réel n'est publié.
- [ ] Les résultats sont fictifs, anonymisés ou remplacés par placeholders.
- [ ] Les limites et risques sont documentés.

## Avant de publier sur LinkedIn

- [ ] Le post est court et sobre.
- [ ] Le texte ne sur-vend pas l'expérience.
- [ ] Aucun screenshot sensible.
- [ ] Aucun détail d'infrastructure réelle.
- [ ] Les hashtags restent raisonnables.

## Avant screenshots

- [ ] Masquer usernames, hostnames, IPs, IDs cloud et chemins locaux.
- [ ] Vérifier qu'aucun onglet, favori, notification ou URL sensible n'est visible.
- [ ] Préférer une transcription anonymisée si la capture est trop riche.

## Avant push

- [ ] `bash scripts/validate-structure.sh`
- [ ] `bash scripts/security-scan.sh`
- [ ] `git diff --check`
- [ ] `git status --short --branch`
- [ ] Push normal uniquement, sans force.
