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
opt "02_smart_concepthashtag2_beauty_front_hires.jpg"   hero-front.jpg      1280
opt "04_smart_concepthashtag2_beauty_rear_hires.jpg"    tech-rear.jpg        800

# Profil : la source est un portrait (12794x15591) avec la voiture petite au centre.
# Crop paysage serre sur la voiture (avant coupe au bord gauche) pour matcher la maquette V5.
echo "  profil : crop paysage serre sur la voiture..."
magick "$SRC/03_smart_concepthashtag2_beauty_profile_hires.jpg" \
  -crop 5800x3700+3550+5980 +repage -resize "1100x>" -strip -interlace Plane \
  -sampling-factor 4:2:0 -quality 82 "$OUT/design-profile.jpg"
echo "  -> $OUT/design-profile.jpg ($(du -h "$OUT/design-profile.jpg" | cut -f1))"
opt "650454-smart-hashtag5-hashtag3-hashtag1-family-shot-01-3x2-abb87a-original-1770648236.jpg" family-shot.jpg 1280

echo "Interior thumbnails (recadrees au meme ratio 1.7:1 pour s'aligner cote a cote)..."
magick "$SRC/smart_concept_hashtag2_Interior_Sketch.jpg" -crop 12708x7475+71+0 +repage \
  -resize "700x>" -strip -interlace Plane -sampling-factor 4:2:0 -quality 82 "$OUT/interior-dashboard.jpg"
echo "  -> $OUT/interior-dashboard.jpg ($(du -h "$OUT/interior-dashboard.jpg" | cut -f1))"
magick "$SRC/smart_concept_hashtag2_Rome_Interieur_41.jpg" -crop 2000x1176+0+79 +repage \
  -resize "700x>" -strip -interlace Plane -sampling-factor 4:2:0 -quality 82 "$OUT/interior-seat.jpg"
echo "  -> $OUT/interior-seat.jpg ($(du -h "$OUT/interior-seat.jpg" | cut -f1))"

echo "ECA chassis (knock-out fond noir -> blanc, ombre douce conservee)..."
magick "$SRC/smart_hashtag2_ECA.png" -resize "800x>" \
  -fuzz 10% -transparent black -background white -flatten \
  -strip -interlace Plane -quality 88 "$OUT/tech-eca.jpg"
echo "  -> $OUT/tech-eca.jpg ($(du -h "$OUT/tech-eca.jpg" | cut -f1))"

echo "Done. Total img dir:"
du -sh "$OUT"
