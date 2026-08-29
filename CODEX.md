# Règles Codex - Cloud Operations Belgium Lab

## Mission du dépôt

Ce dépôt public documente un laboratoire professionnel Cloud Operations orienté Belgique. Il sert à préparer une formation francophone Administrateur Systèmes et Cloud, construire des preuves techniques propres et soutenir un portfolio GitHub/CV/LinkedIn.

## Règles de sécurité absolues

- Ne jamais inclure de secret, token, mot de passe, clé API ou clé privée.
- Ne jamais inclure de donnée Accenture, client, employeur ou système interne.
- Ne jamais inventer une expérience professionnelle réelle.
- Ne jamais créer de ressource cloud réelle depuis ce dépôt sans instruction explicite hors documentation.
- Ne jamais publier d'output brut non relu.
- Ne jamais faire `git push --force` ou `git reset --hard`.

## Données interdites

- Identifiants cloud réels.
- Tenant IDs, subscription IDs, account IDs ou usernames réels.
- IP publique personnelle.
- Logs réels non nettoyés.
- Screenshots sensibles.
- Tickets réels.
- Noms de clients, projets internes ou environnements professionnels.

## Placeholders obligatoires

Utiliser ces placeholders pour tout exemple ou evidence :

- `<LOCAL_IP_ANONYMIZED>`
- `<PUBLIC_IP_REDACTED>`
- `<TENANT_ID_REDACTED>`
- `<SUBSCRIPTION_ID_REDACTED>`
- `<ACCOUNT_ID_REDACTED>`
- `<USERNAME_REDACTED>`
- `<HOSTNAME_REDACTED>`
- `<RESOURCE_GROUP_EXAMPLE>`
- `<FAKE_COMPANY_EXAMPLE>`

## Labs Azure/AWS

- Utiliser des scénarios fictifs et pédagogiques.
- Ne pas committer de credentials CLI.
- Ne pas publier tenant, subscription, account ID ou resource ID réel.
- Documenter les coûts potentiels avant tout lab cloud réel.
- Préférer des outputs anonymisés ou exemples synthétiques.

## Screenshots

- Masquer noms, e-mails, IDs, IPs, chemins locaux et informations cloud.
- Ne jamais publier de screenshot brut.
- Préférer une transcription anonymisée si la capture contient trop de contexte.

## Logs et evidence

- Nettoyer toute sortie avant commit.
- Remplacer les valeurs sensibles par placeholders.
- Expliquer ce que la preuve démontre sans exposer un environnement réel.
- Garder les outputs bruts dans un espace privé, jamais dans ce dépôt public.

## Terraform

- Ne jamais committer `.terraform/`, state, variables sensibles ou plans contenant IDs réels.
- Utiliser des noms de ressources fictifs.
- Relire les plans avant de les transformer en evidence.

## GitHub Actions

- Les workflows doivent rester simples, publics et sans secrets.
- Ne pas ajouter de dépendances externes payantes.
- Exécuter validation structurelle et scan sécurité.
- Ne jamais imprimer de variable sensible dans les logs CI.

## Commits

- Commits courts, explicites et centrés sur un objectif.
- Vérifier `git status`, validation structurelle et security scan avant commit.
- Ne pas mélanger contenu brut privé et contenu public nettoyé.

## Prompts

- Ne jamais coller de secret, token, output cloud réel ou ticket professionnel dans un prompt.
- Utiliser des placeholders et scénarios fictifs.
- Demander une approche public-safe quand un doute existe.

## Checklist avant modification

- [ ] Comprendre le module concerné.
- [ ] Vérifier que le contenu prévu est pédagogique ou anonymisé.
- [ ] Identifier les preuves attendues.
- [ ] Prévoir les placeholders nécessaires.

## Checklist avant commit

- [ ] `bash scripts/validate-structure.sh`
- [ ] `bash scripts/security-scan.sh`
- [ ] `git diff --check`
- [ ] Relecture des fichiers modifiés.
- [ ] Aucun output brut ou screenshot sensible.

## Checklist avant push

- [ ] Working tree propre après commit.
- [ ] Remote `origin` correct.
- [ ] Aucun secret détecté.
- [ ] Aucun fichier sensible ajouté.
- [ ] Push normal uniquement, sans force.

## Si un secret est détecté

1. Arrêter immédiatement.
2. Ne pas pousser.
3. Supprimer la valeur du contenu public.
4. Si le secret a déjà été commité, le considérer compromis.
5. Révoquer ou faire tourner le secret à la source.
6. Nettoyer l'historique si nécessaire avant toute publication.

## Règle d'honnêteté professionnelle

Ce dépôt peut démontrer une progression, des labs personnels et une capacité de documentation. Il ne doit jamais transformer un exercice personnel en fausse expérience client ou production.
