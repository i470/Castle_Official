#!/bin/bash
# create multiresolution windows icon
#mainnet
ICON_SRC=../../src/qt/res/icons/castle.png
ICON_DST=../../src/qt/res/icons/castle.ico
convert ${ICON_SRC} -resize 16x16 castle-16.png
convert ${ICON_SRC} -resize 32x32 castle-32.png
convert ${ICON_SRC} -resize 48x48 castle-48.png
convert ${ICON_SRC} -resize 256x256 castle-256.png
convert castle-16.png castle-32.png castle-48.png castle-256.png ${ICON_DST}
#testnet
ICON_SRC=../../src/qt/res/icons/castle_testnet.png
ICON_DST=../../src/qt/res/icons/castle_testnet.ico
convert ${ICON_SRC} -resize 16x16 castle-16.png
convert ${ICON_SRC} -resize 32x32 castle-32.png
convert ${ICON_SRC} -resize 48x48 castle-48.png
convert ${ICON_SRC} -resize 256x256 castle-256.png
convert castle-16.png castle-32.png castle-48.png castle-256.png ${ICON_DST}
rm castle-16.png castle-32.png castle-48.png castle-256.png
