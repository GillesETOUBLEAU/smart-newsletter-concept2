#!/usr/bin/env bash
# Optimise les visuels sources HD (8-25 Mo) en JPEG email-ready (~100-250 Ko).
# Usage : depuis la racine du repo  ->  bash build/optimize-images.sh
set -euo pipefail

SRC="../VERSION. DEF IMAGE DEF"
OUT="assets/img"
mkdir -p "$OUT"

# helper : resize (largeur retina 2x), strip, JPEG progressif q82
opt() { # $1=source  $2=sortie  $3=largeur
  magick "$SRC/$1" -resize "${3}x>" -strip -interlace Plane \
    -sampling-factor 4:2:0 -quality 82 "$OUT/$2"
  echo "  -> $OUT/$2 ($(du -h "$OUT/$2" | cut -f1))"
}

echo "Hero / beauty shots..."
# hero : crop paysage serré sur la face avant (voiture remplit le cadre), comme la V5
echo "  hero-front : crop serré sur la face avant..."
magick "$SRC/02_smart_concepthashtag2_beauty_front_hires.jpg" -crop 5500x3320+2325+2230 +repage \
  -resize "1280x>" -strip -interlace Plane -sampling-factor 4:2:0 -quality 82 "$OUT/hero-front.jpg"
echo "  -> $OUT/hero-front.jpg ($(du -h "$OUT/hero-front.jpg" | cut -f1))"
# tech-rear : source portrait, voiture au centre -> crop paysage 4:3 serre sur la voiture
echo "  tech-rear : crop paysage 4:3 serre sur la voiture..."
magick "$SRC/04_smart_concepthashtag2_beauty_rear_hires.jpg" -crop 7200x5400+1775+5450 +repage \
  -resize "800x>" -strip -interlace Plane -sampling-factor 4:2:0 -quality 82 "$OUT/tech-rear.jpg"
echo "  -> $OUT/tech-rear.jpg ($(du -h "$OUT/tech-rear.jpg" | cut -f1))"

# Profil : source portrait (12794x15591), voiture au centre. Crop paysage PLEINE LARGEUR
# avec gris studio a gauche (pour le texte superpose) et la voiture a droite -> fond du bloc "design".
echo "  profil : crop paysage pleine largeur (gris a gauche, voiture a droite)..."
magick "$SRC/03_smart_concepthashtag2_beauty_profile_hires.jpg" \
  -crop 9600x5714+0+4968 +repage -resize "1280x>" -strip -interlace Plane \
  -sampling-factor 4:2:0 -quality 82 "$OUT/design-profile.jpg"
echo "  -> $OUT/design-profile.jpg ($(du -h "$OUT/design-profile.jpg" | cut -f1))"
# family-shot : crop en bande paysage serrée sur les 3 SUV (peu de ciel/sol), comme la V5
echo "  family-shot : crop bande paysage sur les 3 SUV..."
magick "$SRC/650454-smart-hashtag5-hashtag3-hashtag1-family-shot-01-3x2-abb87a-original-1770648236.jpg" \
  -crop 7582x1720+0+1690 +repage -resize "1280x>" -strip -interlace Plane \
  -sampling-factor 4:2:0 -quality 82 "$OUT/family-shot.jpg"
echo "  -> $OUT/family-shot.jpg ($(du -h "$OUT/family-shot.jpg" | cut -f1))"

echo "Interior thumbnails (recadrees au meme ratio 1.7:1 pour s'aligner cote a cote)..."
magick "$SRC/smart_concept_hashtag2_Interior_Sketch.jpg" -crop 12708x7475+71+0 +repage \
  -resize "700x>" -strip -interlace Plane -sampling-factor 4:2:0 -quality 82 "$OUT/interior-dashboard.jpg"
echo "  -> $OUT/interior-dashboard.jpg ($(du -h "$OUT/interior-dashboard.jpg" | cut -f1))"
magick "$SRC/smart_concept_hashtag2_Rome_Interieur_41.jpg" -crop 2000x1176+0+79 +repage \
  -resize "700x>" -strip -interlace Plane -sampling-factor 4:2:0 -quality 82 "$OUT/interior-seat.jpg"
echo "  -> $OUT/interior-seat.jpg ($(du -h "$OUT/interior-seat.jpg" | cut -f1))"

echo "ECA chassis (crop 4:3 + knock-out fond noir -> blanc, meme hauteur que tech-rear)..."
magick "$SRC/smart_hashtag2_ECA.png" -crop 2200x1650+0+275 +repage \
  -fuzz 10% -transparent black -background white -flatten \
  -resize "800x>" -strip -interlace Plane -quality 88 "$OUT/tech-eca.jpg"
echo "  -> $OUT/tech-eca.jpg ($(du -h "$OUT/tech-eca.jpg" | cut -f1))"

echo "Done. Total img dir:"
du -sh "$OUT"
