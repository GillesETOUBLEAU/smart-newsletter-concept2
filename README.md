# Newsletter smart #2 Concept

Newsletter HTML email-ready annonçant le **smart Concept #2**, reproduisant fidèlement la maquette de référence `DRAFT NEWS V5`. Le dépôt sert à la fois de **source du HTML** et de **CDN des assets** (images + polices) consommés par l'email via [jsDelivr](https://www.jsdelivr.com/).

- **Preview live :** GitHub Pages (voir l'onglet *Settings → Pages* du dépôt)
- **Email :** [`index.html`](index.html) — table-based, styles inline, compatible Outlook/Gmail/Apple Mail

## Assets servis via jsDelivr

Les images et polices sont référencées en URL absolue (obligatoire en email) depuis un **SHA de commit figé**
(`84fdaff7cdff022108ff429a49eca73f4b249425`) :

```
https://cdn.jsdelivr.net/gh/GillesETOUBLEAU/smart-newsletter-concept2@<sha>/assets/img/<fichier>
https://cdn.jsdelivr.net/gh/GillesETOUBLEAU/smart-newsletter-concept2@<sha>/assets/fonts/<fichier>
```

> Un SHA de commit est **immuable** et mis en cache **de façon permanente** par jsDelivr → les URLs dans l'email ne cassent jamais.
> (Un tag `vX` ne convient pas ici : jsDelivr le normalise en version semver et la résolution peut être instable.)
>
> **Si tu modifies un asset**, commit le changement, récupère le nouveau SHA (`git rev-parse HEAD`),
> puis remplace le SHA dans les URLs de `index.html` (sinon le CDN continuera de servir l'ancienne version).

## Personnalisation par agent / concession

Deux zones sont à remplir pour chaque agent (repérées par des commentaires `ZONE AGENT` dans `index.html`
et stylées en vert) :

| Zone | Emplacement | Contenu |
|------|-------------|---------|
| **ZONE PERSO AGENT** | bandeau du haut | nom de l'agent / accroche personnalisée |
| **Liens de l'agent** | pied de page | liens (site, prise de RDV, contact…) |

Les boutons CTA (`href="#"`) pointent vers `#` : remplacer par les URLs réelles
(inscription newsletter, réservation d'essai), idéalement avec le tracking de la plateforme d'envoi.

## Régénérer les assets (depuis la racine du dépôt)

```bash
# Images HD -> JPEG email (~100-250 Ko) : sources dans ../VERSION. DEF IMAGE DEF
bash build/optimize-images.sh

# Polices de marque smart .otf -> .woff2 : sources dans ../SMART
python3 build/convert-fonts.py
```

Dépendances : ImageMagick (`magick`), Python + `fontTools` + `brotli`.

## Notes

- **Polices :** les polices de marque `FOR smart Sans` / `FOR smart Next` sont chargées via `@font-face`.
  Apple Mail, iOS Mail et la preview navigateur les affichent ; Outlook (moteur Word) et Gmail retombent
  sur **Arial** — comportement normal et attendu en email.
- **Titres éditoriaux** (« L'icône est de retour ! », « Un design unique », « Une technologie avancée ») :
  serif web-safe (`Times New Roman` / `Georgia`), comme la maquette V5.
- **Corrections de copie** vs la maquette (coquilles évidentes corrigées) : « le nouveau **véhicule** deux places »,
  « officiellement **présentée** », bouton « **M'inscrire** à la Newsletter ».
- **Logo smart** : extrait de la maquette V5 (`assets/img/smart-logo.png`). À remplacer par le fichier officiel si disponible.
- **Visuel ECA** : châssis détouré du fond noir d'origine vers un fond blanc (conforme à la V5).
