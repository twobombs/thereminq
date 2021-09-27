# !/bin/bash
#

# assemble/weave first float hex, convert to bin
paste time.hex points.hex ndim.hex nsph.hex ndark.hex points.hex version.hex measuredvol.fhex square10x.fhex measuredvol.fhex square10z.fhex displacex.hex displacey.hex displacez.hex dummy.hex dummy.hex square10x.hex square10z.hex > tipsy-float.hex
# convert float hex string data as a bin file
xxd -r -p tipsy-float.hex tipsy-float.bin
# aaaand convert to little indian
hexdump -v -e '1/4 "%08x"' -e '"\n"' tipsy-float.bin | xxd -r -p >tipsy-float_hexdump.bin

# assemble/weave second float hex, convert to bin
paste time.hex points.hex ndim.hex nsph.hex ndark.hex points.hex version.hex measuredq.fhex square10x.fhex measuredm.fhex square10z.fhex displacex.hex displacey.hex displacez.hex dummy.hex dummy.hex square10x.hex square10z.hex > tipsy-float-basic.hex
# convert int hex string data as a bin file
xxd -r -p tipsy-float-basic.hex tipsy-float-basic.bin
# aaaand convert to little indian
hexdump -v -e '1/4 "%08x"' -e '"\n"' tipsy-float-basic.bin | xxd -r -p >tipsy-float-basic_hexdump.bin

# doubler - merge the two datasets into one view
cat square10x.fhex square10z.fhex > square10x2.fhex
cat measuredvol.fhex square10x.fhex > measuredm2.fhex
cat square10z.fhex measuredvol.fhex > square10z2.fhex

cat measuredvol.fhex measuredvol.fhex > measuredq2.fhex

cat displacex.hex displacex.hex > displacex2.hex
cat displacey.hex displacey.hex > displacey2.hex
cat displacez.hex displacez.hex > displacez2.hex

cat square10x.hex square10z.hex > square10x2.hex
cat square10z.hex square10x.hex > square10z2.hex
cat dummy.hex dummy.hex > dummy2.hex

# assemble/weave final hex, convert to bin
paste time.hex points2.hex ndim.hex nsph.hex ndark.hex points2.hex version.hex measuredq2.fhex square10x2.fhex measuredm2.fhex square10z2.fhex displacex2.hex displacey2.hex displacez2.hex dummy2.hex dummy2.hex square10x2.fhex square10z2.fhex > tipsy-doubler.hex

# convert int hex string data as a bin file
xxd -r -p tipsy-doubler.hex tipsy-doubler.bin
# aaaand convert to little indian
hexdump -v -e '1/4 "%08x"' -e '"\n"' tipsy-doubler.bin | xxd -r -p >tipsy-doubler_hexdump.bin
