#!/usr/bin/env python3
"""Convertit les polices de marque smart .otf -> .woff2 (web/email).
Usage : depuis la racine du repo  ->  python3 build/convert-fonts.py
Necessite fontTools + brotli (deja installes)."""
import os
from fontTools.ttLib import TTFont

SRC = "../SMART"
OUT = "assets/fonts"
os.makedirs(OUT, exist_ok=True)

FONTS = [
    "FORsmartNext-Regular.otf",
    "FORsmartNext-Bold.otf",
    "FORsmartSans-Regular.otf",
    "FORsmartSans-Bold.otf",
]

for name in FONTS:
    src = os.path.join(SRC, name)
    dst = os.path.join(OUT, os.path.splitext(name)[0] + ".woff2")
    f = TTFont(src)
    f.flavor = "woff2"
    f.save(dst)
    print(f"  -> {dst} ({os.path.getsize(dst)//1024} Ko)")

print("Done.")
