#!/bin/bash

TOPDIR=${TOPDIR:-$(git rev-parse --show-toplevel)}
SRCDIR=${SRCDIR:-$TOPDIR/src}
MANDIR=${MANDIR:-$TOPDIR/doc/man}

CASTLED=${CASTLED:-$SRCDIR/castled}
CASTLECLI=${CASTLECLI:-$SRCDIR/castle-cli}
CASTLETX=${CASTLETX:-$SRCDIR/castle-tx}
CASTLEQT=${CASTLEQT:-$SRCDIR/qt/castle-qt}

[ ! -x $CASTLED ] && echo "$CASTLED not found or not executable." && exit 1

# The autodetected version git tag can screw up manpage output a little bit
BTCVER=($($CASTLECLI --version | head -n1 | awk -F'[ -]' '{ print $6, $7 }'))

# Create a footer file with copyright content.
# This gets autodetected fine for castled if --version-string is not set,
# but has different outcomes for castle-qt and castle-cli.
echo "[COPYRIGHT]" > footer.h2m
$CASTLED --version | sed -n '1!p' >> footer.h2m

for cmd in $CASTLED $CASTLECLI $CASTLETX $CASTLEQT; do
  cmdname="${cmd##*/}"
  help2man -N --version-string=${BTCVER[0]} --include=footer.h2m -o ${MANDIR}/${cmdname}.1 ${cmd}
  sed -i "s/\\\-${BTCVER[1]}//g" ${MANDIR}/${cmdname}.1
done

rm -f footer.h2m
