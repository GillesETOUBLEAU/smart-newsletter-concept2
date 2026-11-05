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

## Mention légale du prix

Le prix du titre porte un astérisque — « à partir de 19 990 €* » — renvoyant
à la mention « *Voir conditions sur smart.com », placée sous le CTA
« S’inscrire à la newsletter » (12 px, gris #4a4a4a, sur le fond grège).
Ajout du 05/11/2026 : la maquette n'en comportait pas.

## Périmètre

L'envoi est géré par le client. Restent donc de son côté, hors de ce dépôt :
l'**objet** de l'email et toute **mention légale complémentaire** (bonus, date
de validité, version concernée, autonomie 290 km / WLTP).

Le **preheader** présent en haut du `body` est une proposition rédigée ici,
à conserver ou à remplacer par le client.

## Écart assumé avec la maquette

La maquette écrit « 19 990€ » sans espace avant le symbole. L'email applique la règle
typographique française : `19&nbsp;990&nbsp;€`. À arbitrer avec le client.

## Typo
La maquette est composée **intégralement en FOR smart Next**, le slab corporate
smart — titre, intertitres, textes courants, boutons. Vérifié par comparaison des
tracés avec la fonte installée : ce n'est ni Yorkten Slab Condensed ni Avenir Next,
contrairement à ce qui avait été supposé en septembre.

L'email charge donc la vraie police de marque, en `woff2` servi par jsDelivr depuis
`assets/fonts/` à la racine du dépôt (fichiers inchangés depuis la newsletter de
juin, pin `263e3fe`) :

| Graisse | Fichier | Poids |
| --- | --- | --- |
| 400 | `FORsmartNext-Regular.woff2` | 44 ko |
| 700 | `FORsmartNext-Bold.woff2` | 44 ko |

La fonte n'existe qu'en 400 et 700 : les `font-weight:600` sont passés à **700**
et les titres de finition (Pure / Pure+ / Premium) de 500 à **400**, conformément
à la maquette.

### Titre sur une seule ligne
La police de marque étant plus étroite que la substitution Zilla Slab, le titre
tient désormais sur **une ligne comme la maquette** : 28 px, le `<br class="br-d">`
retiré. Largeurs mesurées pour 600 px disponibles dans le conteneur :

| Police rendue | Largeur du titre | Lignes |
| --- | --- | --- |
| FOR smart Next | 579 px | 1 |
| Georgia (repli) | 577 px | 1 |
| Times New Roman (si le repli saute) | 521 px | 1 |

Une insécable lie « à » à « partir » : en mobile (26 px, deux lignes) la césure
tombe après « disponible » et non sur la préposition.

### Ce que verront les destinataires
- **FOR smart Next** : Apple Mail, Mail iOS, Outlook pour Mac, Samsung Mail,
  Thunderbird.
- **Georgia** (repli) : Gmail web / iOS / Android, Outlook Windows, Yahoo — ces
  clients ignorent `@font-face`. Georgia reste un serif, la couleur de page est
  préservée. Un bloc conditionnel `<!--[if mso]>` impose Georgia à Outlook Windows,
  qui sinon retomberait sur Times New Roman.

Compromis exposé à la cliente le 05/11/2026 : elle demande la police de marque
malgré la dégradation sur une partie du parc.

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
