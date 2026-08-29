# Evidence 01 - Diagnostic réseau local

## Type de preuve

Evidence pédagogique anonymisée.

## Module

`01-reseaux-tcp-ip`

## Date

2026-08-29

## Objectif

Montrer la capacité à collecter et interpréter des signaux réseau de base sans publier de données sensibles.

## Commandes exécutées

Commandes prévues pour le lab :

```bash
hostname
ifconfig
ipconfig getifaddr en0
netstat -rn
ping -c 4 1.1.1.1
dig example.com
traceroute example.com
```

## Résultats anonymisés attendus

```text
Hostname: <HOSTNAME_ANONYMIZED>
Local IPv4: <LOCAL_IP_ANONYMIZED>
Default gateway: <DEFAULT_GATEWAY_ANONYMIZED>
Interface status: <INTERFACE_STATUS_EXAMPLE>
External connectivity: <PING_RESULT_EXAMPLE>
Packet loss: <PACKET_LOSS_EXAMPLE>
Latency: <LATENCY_EXAMPLE_MS>
DNS result: <DNS_RESULT_EXAMPLE>
Traceroute hops: <ROUTE_HOP_ANONYMIZED>
```

Ces valeurs sont des placeholders. Elles ne représentent pas les résultats réels d'une machine personnelle, d'un employeur ou d'un client.

## Données sensibles vérifiées : oui

- Aucun nom de client.
- Aucune donnée Accenture.
- Aucun nom de machine réel.
- Aucune IP publique personnelle.
- Aucun identifiant cloud.
- Aucun token, secret, mot de passe ou fichier `.env`.
- Aucun screenshot sensible.

## Ce que cette preuve démontre

- Compréhension des bases TCP/IP.
- Capacité à utiliser des commandes réseau macOS sûres.
- Capacité à distinguer IP, route, DNS, latence et perte de paquets.
- Capacité à anonymiser une preuve technique avant publication.
- Méthode de diagnostic utile pour Cloud Operations.

## Comment réutiliser cette preuve dans un entretien

Cette preuve peut soutenir une réponse à la question : "Comment commencez-vous le diagnostic d'un problème réseau ?"

Réponse possible : commencer par identifier la configuration locale, vérifier la route par défaut, tester une destination IP indépendante du DNS, tester la résolution DNS, puis observer le chemin réseau. L'objectif est de formuler une hypothèse technique avant l'escalade.
