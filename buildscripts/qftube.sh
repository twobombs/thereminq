#!/bin/bash
#
qube=$(<cube.dec)
echo "qube repeat size:" $qube

rm measuredmqube.fhex && rm measuredvolqube.fhex && rm  square10xqube.fhex && rm square10zqube.fhex && rm displacexqube.hex && rm dummyqube.hex 

paste -d '\n' $(yes square10x.fhex|head -$qube) > square10qube.fhex

yes measuredq.fhex | head -n $(cat cube.dec) | xargs cat> measuredqqube.fhex
yes measuredm.fhex | head -n $(cat cube.dec) | xargs cat> measuredmqube.fhex
yes measuredvol.fhex | head -n $(cat cube.dec) | xargs cat> measuredvolqube.fhex

yes square10x.fhex | head -n $(cat cube.dec) | xargs cat> square10xqube.fhex
yes square10z.fhex | head -n $(cat cube.dec) | xargs cat> square10zqube.fhex

yes displacex.hex | head -n $(cat cube.dec) | xargs cat> displacexqube.hex
yes dummy.hex | head -n $(cat cube.dec) | xargs cat> dummyqube.hex

# qsizing
cat pointsqubed.dec
wc -l square10qube.fhex
wc -l measuredmqube.fhex
wc -l measuredvolqube.fhex
wc -l square10xqube.fhex
wc -l square10zqube.fhex
wc -l displacexqube.hex
wc -l dummyqube.hex

rm tipsy-qube.hex && rm tipsy-qube.bin && rm tipsy-qube_hexdump.bin

# assemble/weave first float hex, convert to bin
paste time.hex pointsqubed.hex ndim.hex nsph.hex ndark.hex pointsqubed.hex version.hex measuredvolqube.fhex square10zqube.fhex square10qube.fhex measuredmqube.fhex displacexqube.hex displacexqube.hex displacexqube.hex dummyqube.hex dummyqube.hex square10qube.fhex square10xqube.fhex > tipsy-qube.hex
# convert float hex string data as a bin file
xxd -r -p tipsy-qube.hex tipsy-qube.bin
# aaaand convert to little indian
hexdump -v -e '1/4 "%08x"' -e '"\n"' tipsy-qube.bin | xxd -r -p >tipsy-qube_hexdump.bin

# remove unreusable reproduceable artifacts
rm measuredmqube.fhex && rm measuredvolqube.fhex && rm square10qube.fhex && rm square10xqube.fhex && rm square10zqube.fhex && rm displacexqube.hex && rm dummyqube.hex && rm tipsy-qube.hex && rm tipsy-qube.bin
