# Newsletter smart #2 — Ouverture des commandes (novembre 2026)

Reproduction HTML email de la maquette `newsletter smart #2 05-11-26.png`
(dossier `~/Projects/Smart/Newsletter-Novembre`, livrée par WeTransfer le 05/11/2026).

- `index.html` : email table-based, styles inline, boutons VML pour Outlook, responsive (< 620 px).
- `assets/img/` : visuels optimisés, régénérables avec `bash build/optimize-images.sh`.

## Liens
| Élément | URL |
|---|---|
| « Commander la smart #2 » (les 2 boutons) | https://fr.smart.com/fr/models/hashtag-two/order-request/ |
| « S'inscrire à la newsletter » | https://fr.smart.com/fr/models/hashtag-two/ |

URL confirmées par le client le 05/11/2026 (titres de page vérifiés :
« Précommandez dès maintenant la nouvelle smart #2 | smart » et
« smart #2 – Voiture 2 places électrique | L'actu | smart »).

## Périmètre

L'envoi est géré par le client. Restent donc de son côté, hors de ce dépôt :
l'**objet** de l'email et les **mentions légales** (prix « à partir de 19 990 € »,
autonomie 290 km / WLTP), absentes de la maquette.

Le **preheader** présent en haut du `body` est une proposition rédigée ici,
à conserver ou à remplacer par le client.

## Écart assumé avec la maquette

La maquette écrit « 19 990€ » sans espace avant le symbole. L'email applique la règle
typographique française : `19&nbsp;990&nbsp;€`. À arbitrer avec le client.

## Typo
Maquette : **Yorkten Slab Condensed** (titres et textes courants) + **Avenir Next**
(intertitre « La nouvelle smart #2 100 % électrique, a de quoi surprendre : »).
Yorkten est une police Adobe Fonts, licence non embarquable → l'email charge
**Zilla Slab** (Google Fonts, la plus proche en chasse) avec Georgia en repli
(Outlook, Gmail), et Avenir Next → Avenir / Helvetica / Arial.

Zilla Slab étant moins condensée que Yorkten, le titre principal passe sur deux lignes
(une seule dans la maquette) et les colonnes de finitions ont une ligne de plus.

## Recadrages
Les quatre visuels HD sont recadrés aux proportions relevées sur la maquette
(1882 px de large), avec calage sur la position de la voiture :

| Visuel | Maquette | Email (2x) |
|---|---|---|
| smart #2 rouge, pleine largeur | 1882 × 1356 | `hero-rouge.jpg` 1280 × 922 |
| smart #2 en charge, colonne droite | 747 × 770 | `charge.jpg` 508 × 524 |
| Intérieur cuir cognac, colonne gauche | 864 × 654 | `interieur.jpg` 588 × 444 |
| smart #2 en ville, pleine largeur | 1882 × 810 | `urbain.jpg` 1280 × 552 |

## Zones agent
Cellules vides en haut et en bas, repérées par les commentaires `ZONE AGENT`,
comme pour les newsletters #2 Concept et septembre.

## Mise en ligne
- `index.html` : `src` **relatives** (`assets/img/...`) pour la preview locale et GitHub Pages.
- `Newsletter-smart-2-Commandes.html` : **version d'envoi**, images en URL absolues
  jsDelivr pinnées sur un SHA de commit (fichier autonome).

Régénérer la version d'envoi après un changement de visuel (commit + push d'abord) :

```
sed "s#src=\"assets/img/#src=\"https://cdn.jsdelivr.net/gh/GillesETOUBLEAU/smart-newsletter-concept2@<sha>/2026-11-smart2/assets/img/#g" index.html > Newsletter-smart-2-Commandes.html
```
