TOPCOLOR="ff6505"
TOPALPHA="80"

G2LCOLOR="ff053f"
G2LALPHA="30"

G3LCOLOR="3fff05"
G3LALPHA="30"

BOTCOLOR="057aff"
BOTALPHA="80"

SILKCOLOR="ffffff"
SILKALPHA="ff"

OUTLCOLOR="ffffff"
OUTLALPHA="ff"

TPADCOLOR="00ff00"
TPADALPHA="ff"
BPADCOLOR="0000ff"
BPADALPHA="ff"

gerbv -x png -o catfood_copper.png -w 1280x1280 -B 0 \
    catfood.GTL -f \#${TOPCOLOR}${TOPALPHA} \
    catfood.G2L -f \#${G2LCOLOR}${G2LALPHA} \
    catfood.G3L -f \#${G3LCOLOR}${G3LALPHA} \
    catfood.GBL -f \#${BOTCOLOR}${BOTALPHA} \
    catfood.GKO -f \#${OUTLCOLOR}${OUTLALPHA}

gerbv -x png -o catfood_silk.png -w 1280x1280 -B 0 \
    catfood.GKO -f \#${OUTLCOLOR}${OUTLALPHA} \
    catfood.GTO -f \#${SILKCOLOR}${SILKALPHA}

gerbv -x png -o catfood_pads.png -w 1280x1280 -B 0 \
    catfood.GKO -f \#${OUTLCOLOR}${OUTLALPHA} \
    catfood.GTP -f \#${TPADCOLOR}${TPADALPHA} \
    catfood.GBP -f \#${BPADCOLOR}${BPADALPHA}

convert catfood_silk.png -transparent black catfood_silk_alpha.png
convert catfood_pads.png -transparent black catfood_pads_alpha.png

composite -gravity center catfood_silk_alpha.png catfood_copper.png cf.png
composite -gravity center catfood_pads_alpha.png cf.png catfood.png

