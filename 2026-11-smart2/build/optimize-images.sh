#!/usr/bin/env bash
# Visuels HD -> JPEG email (largeur retina 2x du gabarit 640 px).
# Usage : depuis 2026-11-smart2/  ->  bash build/optimize-images.sh
# Les recadrages reproduisent les proportions relevées sur la maquette
# « newsletter smart #2 05-11-26.png » (1882 px de large) :
#   bande rouge   1882x1356 pleine largeur   -> 640x461
#   photo charge   747x770  colonne droite   -> 254x262
#   photo intérieur 864x654 colonne gauche   -> 294x222
#   bande urbaine 1882x810  pleine largeur   -> 640x276
set -euo pipefail
SRC="../../../Newsletter-Novembre/Links"
OUT="assets/img"
mkdir -p "$OUT"
jpg() { local in="$1" out="$2"; shift 2; magick "$in" "$@" -strip -interlace Plane -sampling-factor 4:2:0 -quality 80 "$out"; }

# 1. smart #2 rouge de profil, fond studio : recadrage calé sur la maquette (voiture = 61 % de la largeur)
jpg "$SRC/exterior_beauty_012_EU_sRGB.jpg" "$OUT/hero-rouge.jpg" \
    -crop 14748x10626+4884+7576 +repage -resize 1280x
# 2. smart #2 dorée en charge : portrait 5584x8368 -> 0.970:1 (colonne droite)
jpg "$SRC/exterior_feature_002_EU_sRGB.jpg" "$OUT/charge.jpg" \
    -crop 5584x5756+0+656 +repage -resize 508x
# 3. Intérieur cuir cognac : 8221x5486 -> 1.324:1 (colonne gauche)
jpg "$SRC/smart_HB11_World Premier_still_outdoor_interior_beautiy_001.jpg" "$OUT/interieur.jpg" \
    -crop 7263x5486+479+0 +repage -resize 588x
# 4. smart #2 dorée en ville : 8368x5584 -> 2.319:1 (bande pleine largeur)
jpg "$SRC/smart_HB11_World Premier_stills_outdoor_static_015_EU.jpg" "$OUT/urbain.jpg" \
    -crop 8368x3608+0+988 +repage -resize 1280x

for f in "$OUT"/*.jpg; do echo "  -> $f ($(du -h "$f" | cut -f1), $(magick identify -format '%wx%h' "$f"))"; done
