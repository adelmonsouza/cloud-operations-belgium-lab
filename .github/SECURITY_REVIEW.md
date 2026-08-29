# Security Review Avant Push Public

## Git status

- [ ] `git status --short --branch` ne montre aucun fichier inattendu.
- [ ] Les changements sont cohérents avec l'objectif du commit.

## Validation script

- [ ] `bash scripts/validate-structure.sh` réussit.

## Secret scan local

- [ ] `bash scripts/security-scan.sh` réussit.
- [ ] Aucun motif critique n'est détecté.

## Sensitive file scan

- [ ] Aucun fichier `.env`, clé, certificat, state Terraform ou credentials JSON.

## Evidence review

- [ ] Les preuves sont anonymisées.
- [ ] Aucun output brut réel n'est ajouté.
- [ ] Les placeholders sont utilisés.

## Screenshot review

- [ ] Aucun screenshot sensible.
- [ ] Les noms, e-mails, IDs, IPs et chemins sont masqués.

## Employer/client data review

- [ ] Aucune donnée Accenture.
- [ ] Aucun nom client.
- [ ] Aucun ticket réel.
- [ ] Aucun système interne.

## Cloud identifiers review

- [ ] Aucun tenant ID réel.
- [ ] Aucun subscription ID réel.
- [ ] Aucun account ID réel.
- [ ] Aucun resource ID réel.

## Final approval

- [ ] Le contenu est public-safe.
- [ ] Le scénario est fictif, pédagogique ou anonymisé.
- [ ] Le push peut être fait sans force.
