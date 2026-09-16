#!/usr/bin/env bash
# Visuels HD -> JPEG email (largeur retina 2x du gabarit 640px).
# Usage : depuis 2026-09-mondial/  ->  bash build/optimize-images.sh
set -euo pipefail
SRC="../../../Newsletter-Septembre/newsletter smart #2/newsletter smart #2 16-09-26 AI/Links"
OUT="assets/img"
mkdir -p "$OUT"
# jpg <source> <sortie> <opérations...>
jpg() { local in="$1" out="$2"; shift 2; magick "$in" "$@" -strip -interlace Plane -sampling-factor 4:2:0 -quality 80 "$out"; }

# Fresque Paris (Brusk) : 4:5 pleine largeur
jpg "$SRC/smart#2_2026_mural_PAR_motif5_1080x1350.jpg" "$OUT/mural-paris.jpg" -resize "1080x>"
# Fresque Melbourne : source 3:2 -> recadrage 16:9 centré (même ratio que Hong Kong)
jpg "$SRC/smart#2_2026_mural_MEL_main_7904x5272.jpg" "$OUT/mural-melbourne.jpg" -gravity center -crop 7904x4446+0+0 +repage -resize 632x
# Fresque Hong Kong : 16:9
jpg "$SRC/smart#2_2026_mural_HKG_main_1920x1080.jpg" "$OUT/mural-hongkong.jpg" -resize 632x
# Reveal Pékin : bande ~2.1:1 (projecteurs en haut, reflet en bas), comme la maquette
jpg "$SRC/668880-smart_concepthashtag2_brand event beijing_reveal2-f4c25a-original-1776797403.jpg" "$OUT/reveal.jpg" -crop 4000x1900+0+250 +repage -resize 1280x

for f in "$OUT"/*.jpg; do echo "  -> $f ($(du -h "$f" | cut -f1), $(magick identify -format '%wx%h' "$f"))"; done
