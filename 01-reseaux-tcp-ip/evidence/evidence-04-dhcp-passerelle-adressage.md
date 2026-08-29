# Evidence 04 - DHCP, passerelle et adressage

## Type de preuve

Evidence réseau public-safe et anonymisée.

## Module

`01-reseaux-tcp-ip`

## Date

2026-08-29

## Objectif

Démontrer une méthode de diagnostic d'attribution réseau sans publier de données réelles de machine, d'employeur, de client ou d'environnement cloud.

## Commandes documentées

```bash
ipconfig getifaddr en0
ipconfig getoption en0 router
ipconfig getoption en0 subnet_mask
ipconfig getpacket en0
netstat -rn
ifconfig en0
```

## Résultats anonymisés attendus

```text
Local IP: <LOCAL_IP_ANONYMIZED>
Subnet mask: <SUBNET_MASK_EXAMPLE>
Default gateway: <DEFAULT_GATEWAY_ANONYMIZED>
DHCP lease: <DHCP_LEASE_EXAMPLE>
Route default: <ROUTE_ENTRY_EXAMPLE>
Interface status: <INTERFACE_STATUS_EXAMPLE>
APIPA/link-local example: <APIPA_ADDRESS_EXAMPLE>
```

## Tableau de preuve

| Élément observé | Valeur public-safe | Interprétation |
|---|---|---|
| Adresse IP | `<LOCAL_IP_ANONYMIZED>` | Vérifie si la machine a reçu une adresse. |
| Masque | `<SUBNET_MASK_EXAMPLE>` | Vérifie le sous-réseau local. |
| Passerelle | `<DEFAULT_GATEWAY_ANONYMIZED>` | Vérifie la sortie vers réseaux distants. |
| Bail DHCP | `<DHCP_LEASE_EXAMPLE>` | Vérifie la source et les options reçues. |
| Route par défaut | `<ROUTE_ENTRY_EXAMPLE>` | Confirme le routage par défaut. |
| Adresse link-local | `<APIPA_ADDRESS_EXAMPLE>` | Signale un possible échec DHCP. |

## Données sensibles vérifiées : oui

- Aucun résultat réel de machine personnelle.
- Aucun hostname réel.
- Aucune IP publique personnelle.
- Aucune donnée Accenture.
- Aucune donnée client ou employeur.
- Aucun identifiant cloud.
- Aucun token, secret, mot de passe ou fichier `.env`.
- Aucun screenshot sensible.

## Ce que cette preuve démontre

- Compréhension du rôle de DHCP.
- Capacité à identifier adresse IP, masque et passerelle.
- Capacité à relier route par défaut et connectivité externe.
- Capacité à reconnaître un symptôme d'échec DHCP ou APIPA/link-local.
- Discipline d'anonymisation avant publication.

## Comment réutiliser cette preuve en entretien

Cette preuve peut soutenir une réponse à la question : "Que vérifiez-vous quand une machine reçoit une adresse IP mais ne peut pas accéder aux services externes ?"

Réponse possible : vérifier l'adresse, le masque, la passerelle reçue via DHCP, la route par défaut et les signes de conflit ou d'adresse link-local. Ensuite, documenter les signaux avant d'escalader vers réseau ou infrastructure.
