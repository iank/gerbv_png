TOPCOLOR="ff6505"
TOPALPHA="80"

G1LCOLOR="20A39E"
G1LALPHA="30"

G2LCOLOR="ff053f"
G2LALPHA="30"

G3LCOLOR="3fff05"
G3LALPHA="30"

G4LCOLOR="EF5B5B"
G4LALPHA="30"

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

gerbv -x png -o FROGSBORO_copper.png -w 1280x1280 -B 0 \
    FROGSBORO.GTL -f \#${TOPCOLOR}${TOPALPHA} \
    FROGSBORO.G1 -f \#${G1LCOLOR}${G1LALPHA} \
    FROGSBORO.G2 -f \#${G2LCOLOR}${G2LALPHA} \
    FROGSBORO.G3 -f \#${G3LCOLOR}${G3LALPHA} \
    FROGSBORO.G4 -f \#${G4LCOLOR}${G4LALPHA} \
    FROGSBORO.GBL -f \#${BOTCOLOR}${BOTALPHA} \
    FROGSBORO.GKO -f \#${OUTLCOLOR}${OUTLALPHA}

gerbv -x png -o FROGSBORO_silk.png -w 1280x1280 -B 0 \
    FROGSBORO.GKO -f \#${OUTLCOLOR}${OUTLALPHA} \
    FROGSBORO.GTO -f \#${SILKCOLOR}${SILKALPHA}

gerbv -x png -o FROGSBORO_pads.png -w 1280x1280 -B 0 \
    FROGSBORO.GKO -f \#${OUTLCOLOR}${OUTLALPHA} \
    FROGSBORO.GTP -f \#${TPADCOLOR}${TPADALPHA} \
    FROGSBORO.GBP -f \#${BPADCOLOR}${BPADALPHA}

convert FROGSBORO_silk.png -transparent black FROGSBORO_silk_alpha.png
convert FROGSBORO_pads.png -transparent black FROGSBORO_pads_alpha.png

composite -gravity center FROGSBORO_pads_alpha.png FROGSBORO_copper.png cf.png
composite -gravity center FROGSBORO_silk_alpha.png cf.png FROGSBORO.png
