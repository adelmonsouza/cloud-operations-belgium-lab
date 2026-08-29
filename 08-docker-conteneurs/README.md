# Docker et conteneurs

## Objectif du module

Comprendre le runtime Docker, le cycle de vie d'un conteneur, la publication de ports et les premiers contrôles HTTP utiles en Cloud Operations.

## Pourquoi ce module est important pour Cloud Operations

Les conteneurs rapprochent l'administration système de l'exploitation applicative. Un profil Cloud Operations doit savoir vérifier le runtime, lancer un service isolé, observer ses logs, comprendre son exposition réseau et distinguer un service running d'un service arrêté.

Ce module vise à transformer une connaissance théorique en capacité opérationnelle démontrable.

## Compétences visées

- Distinguer Docker CLI, daemon, image et conteneur.
- Comprendre un mapping de ports local.
- Vérifier un service HTTP avec `curl`.
- Observer les logs du conteneur concerné.
- Documenter un cycle de vie sans toucher à des workloads non concernés.
- Préparer une transition vers Docker Compose et les pratiques de conteneurisation.

## Labs disponibles

| Lab | Sujet | Statut |
|---|---|---|
| [Lab 01](labs/lab-01-nginx-local-port-mapping.md) | Nginx local, mapping de port et vérification HTTP | Publié |

## Evidences disponibles

- [Evidence 01 - Nginx local et mapping de port](evidence/evidence-01-nginx-local-port-mapping.md)

## Notes disponibles

- [Docker Nginx local](notes/docker-nginx-local.md)

## Questions d'entretien

Voir [interview-questions.md](interview-questions.md).

## Lien vers les templates

Voir `../templates/` pour les modèles de lab et d'evidence.

## Statut initial

En cours. Le premier lab local est documenté avec des résultats public-safe.

## Prochaine étape

Jour 09 : diagnostiquer des échecs de mapping de ports et distinguer daemon indisponible, conteneur arrêté et service non publié.

## English Summary

This module introduces Docker runtime checks, container lifecycle, local port publishing and HTTP verification.
