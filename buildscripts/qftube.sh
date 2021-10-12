 !/bin/bash
qube=$(<cube.dec)
echo "qube repeat size:" $qube

paste -d '\n' $(yes square10x.fhex|head -$qube) > square10qube.fhex

tee -a $(yes measuredmqube.fhex|head -$qube) <measuredm.fhex >/dev/null
tee -a $(yes square10xqube.fhex|head -$qube) <square10x.fhex >/dev/null
tee -a $(yes square10zqube.fhex|head -$qube) <square10z.fhex >/dev/null
tee -a $(yes displacexqube.hex|head -$qube) <displacex.hex >/dev/null
tee -a $(yes dummyqube.hex|head -$qube) <dummy.hex >/dev/null

# assemble/weave first float hex, convert to bin
paste time.hex pointsqubed.hex ndim.hex nsph.hex ndark.hex pointsqubed.hex version.hex measuredmqube.fhex square10xqube.fhex square10qube.fhex square10zqube.fhex displacexqube.hex displacexqube.hex displacexqube.hex dummyqube.hex dummyqube.hex square10qube.fhex square10xqube.fhex > tipsy-qube.hex
# convert float hex string data as a bin file
xxd -r -p tipsy-qube.hex tipsy-qube.bin
# aaaand convert to little indian
hexdump -v -e '1/4 "%08x"' -e '"\n"' tipsy-qube.bin | xxd -r -p >tipsy-qube_hexdump.bin
