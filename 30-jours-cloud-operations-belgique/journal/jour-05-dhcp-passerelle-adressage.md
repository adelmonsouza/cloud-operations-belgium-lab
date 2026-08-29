# Jour 05 - DHCP, passerelle et adressage

## Objectif du jour

Comprendre comment une machine obtient une adresse IP, comment identifier sa passerelle par défaut, et comment diagnostiquer un problème d'attribution réseau dans un contexte Cloud Operations / Administrateur Systèmes et Cloud.

## Pourquoi DHCP et la passerelle sont importants en Cloud Operations

DHCP et la passerelle par défaut déterminent si une machine peut communiquer correctement sur son réseau local et sortir vers d'autres réseaux. En Cloud Operations, beaucoup d'incidents apparemment applicatifs commencent par une adresse incorrecte, une passerelle absente, un bail expiré ou une route par défaut incohérente.

## Concepts étudiés

- DHCP : service qui attribue automatiquement une configuration réseau.
- Adresse IP : identifiant logique utilisé pour communiquer sur un réseau.
- Masque de sous-réseau : définit la partie réseau et la partie hôte d'une adresse.
- Bail DHCP : durée pendant laquelle une adresse est attribuée à une machine.
- Passerelle par défaut : routeur utilisé pour joindre les réseaux distants.
- Route par défaut : entrée de routage utilisée lorsqu'aucune route plus spécifique n'existe.
- Conflit d'adresse IP : deux machines utilisent la même adresse.
- Absence d'adresse IP : la machine n'a pas reçu de configuration exploitable.
- Adresse APIPA / link-local : adresse automatique, souvent `169.254.x.x`, utilisée quand DHCP ne répond pas.

## Mini-lab réalisé

Création du lab `01-reseaux-tcp-ip/labs/lab-04-dhcp-passerelle-adressage.md`, basé sur des commandes macOS sûres et des résultats entièrement anonymisés.

## Tableau symptôme / commande / signal / hypothèse / action

| Symptôme | Commande | Signal | Hypothèse | Action suivante |
|---|---|---|---|---|
| Pas d'adresse IP | `ipconfig getifaddr en0` | Aucun résultat | Interface inactive ou DHCP indisponible | Vérifier interface et bail DHCP |
| Adresse link-local | `ifconfig en0` | `<APIPA_ADDRESS_EXAMPLE>` | DHCP ne répond pas | Vérifier service DHCP ou réseau local |
| Pas de passerelle | `ipconfig getoption en0 router` | Aucun routeur retourné | Option DHCP manquante ou bail incorrect | Vérifier configuration DHCP |
| Masque incohérent | `ipconfig getoption en0 subnet_mask` | `<SUBNET_MASK_EXAMPLE>` inattendu | Mauvais scope DHCP | Vérifier scope et sous-réseau |
| Route par défaut absente | `netstat -rn` | Pas de route `default` | Passerelle non reçue ou routage cassé | Comparer DHCP et table de routage |
| Conflit IP suspect | `ifconfig en0` | Adresse changeante ou connectivité instable | Adresse dupliquée ou bail incorrect | Vérifier attribution et logs réseau |

## Scénario fictif

Une machine de `<FAKE_COMPANY_EXAMPLE>` reçoit une adresse incorrecte ou ne reçoit pas de passerelle. Elle peut parfois joindre son réseau local, mais ne peut pas accéder aux services externes ou cloud pédagogiques. Le diagnostic doit déterminer si le problème vient du bail DHCP, du masque, de la passerelle ou de la route par défaut.

## Erreurs fréquentes

- Diagnostiquer DNS avant de vérifier que la machine possède une adresse IP valide.
- Oublier la route par défaut.
- Publier une vraie adresse IP locale, un hostname ou un resolver interne.
- Confondre adresse link-local et adresse réseau valide.
- Conclure à une panne cloud alors que la passerelle locale est absente.

## Lien avec incident management

Un incident d'adressage doit être documenté avec le symptôme, l'adresse anonymisée, le masque, la passerelle, la route par défaut, l'impact et l'action suivante. Ces éléments facilitent l'escalade vers réseau, poste de travail, sécurité ou cloud platform.

## Question d'entretien en français

Comment diagnostiqueriez-vous une machine qui reçoit une adresse IP mais ne peut pas accéder à Internet ?

## Question d'entretien en anglais

How would you troubleshoot a machine that receives an IP address but has no default gateway?

## Preuve ajoutée

Ajout de `01-reseaux-tcp-ip/notes/dhcp-passerelle-adressage.md`, `lab-04-dhcp-passerelle-adressage.md` et `evidence-04-dhcp-passerelle-adressage.md`.

## Prochaine action

Créer le Jour 06 sur ports, firewall et vérification de connectivité applicative avec des exemples public-safe.
