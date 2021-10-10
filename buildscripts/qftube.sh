# !/bin/bash
#

qube=$(<cube.dec)
echo "qube repeat size:" $qube

paste -d '\n' $(yes square10x.fhex|head -$qube) > square10qube.fhex

for i in 'cat cube.dec' ; do cat measuredm.fhex ; done > measuredmqube.fhex


# assemble/weave first float hex, convert to bin
paste time.hex points.hex ndim.hex nsph.hex ndark.hex pointsqubed.hex version.hex measuredmqube.fhex square10xqube.fhex square10qube.fhex square10zqube.fhex displacexqube.hex displaceyqube.hex displacezqube.hex dummyqube.hex dummyqube.hex square10xqube.hex square10zqube.hex > tipsy-qube.hex


# convert float hex string data as a bin file
xxd -r -p tipsy-float.hex tipsy-qube.bin
# aaaand convert to little indian
hexdump -v -e '1/4 "%08x"' -e '"\n"' tipsy-qube.bin | xxd -r -p >tipsy-qube_hexdump.bin
