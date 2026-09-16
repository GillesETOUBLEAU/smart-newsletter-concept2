# Newsletter smart #2 — Fresques murales & jeu Mondial de l'Auto (septembre 2026)

Reproduction HTML email de la maquette `smart_Newsletter_V3_def.jpg` (dossier `Newsletter-Septembre`).

- `index.html` : email table-based, styles inline, boutons VML pour Outlook, responsive (< 620 px).
- `assets/img/` : visuels optimisés, régénérables avec `bash build/optimize-images.sh`.

## Liens
| Élément | URL |
|---|---|
| Fresque Paris + « Découvrir la campagne… » | https://fr.smart.com/fr/models/hashtag-two/street-art-project/ |
| Visuel reveal + « Obtenir une invitation » | https://fr.smart.com/fr/event/paris-2026/ (URL indiquée dans le règlement) |
| « S'inscrire à la newsletter » | https://fr.smart.com/fr/models/hashtag-two/ |
| « conditions générales de participation » | PDF du règlement (s7.future.smart.com) |

## Typo
La maquette utilise **Yorkten Slab Condensed** (Adobe Fonts, licence non embarquable) et **Avenir Next** pour la mention.
L'email charge **Zilla Slab** (Google Fonts), la plus proche en chasse, avec Georgia en repli (Outlook, Gmail).

## Zones agent
Cellules vides en haut et en bas, repérées par les commentaires `ZONE AGENT`, comme pour la newsletter #2 Concept.

## Mise en ligne
- `index.html` : `src` **relatives** (`assets/img/...`) pour la preview locale et GitHub Pages.
- `Newsletter-smart-2-Mondial.html` : **version d'envoi**, images en URL absolues jsDelivr pinnées sur le SHA
  `04e8521efb8336792a563856670c4000937bd242` (fichier autonome).

Si un visuel change : commit + push, puis régénérer la version d'envoi avec le nouveau SHA :
`sed "s#src=\"assets/img/#src=\"https://cdn.jsdelivr.net/gh/GillesETOUBLEAU/smart-newsletter-concept2@<sha>/2026-09-mondial/assets/img/#g" index.html > Newsletter-smart-2-Mondial.html`
