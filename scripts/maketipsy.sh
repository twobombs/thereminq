#!/bin/bash

# convert logfiles into ascii hex and split in q and m
./convert_measured_values.sh > measured.hex
awk '{ print > (NR % 2 ? "measuredq.hex" : "measuredm.hex") }' measured.hex

# count the total amount of lines with values
wc -l measured.hex | tr " " "\n"| grep -v measured.hex > rows.dec

# derive the amount of measured points for array dimension declaration
rows=$(<rows.dec)
echo $(( rows / 2 )) > points.dec
printf '%08X\n' $(< points.dec) > points.hex

# dim a square by making a real sqr of the amount of points
points=$(<points.dec)
pointssqr=$(echo "$points" | awk '{print sqrt($1)}')
square=$( echo $pointssqr | awk '{printf "%.0f\n", $1}')

# announce and declare the cube dimensions
echo $square "x" $square
echo $square > cube.dec

# create default array row and make it hex
seq 0 $square > square.dec
printf '%08X\n' $(< square.dec) > square.hex

# default ID is 2
yes 02 | head -n `cat points.dec` > id.hex

# make xz coordinates and convert to hex
for i in `cat square.dec` ; do seq 1 $square | xargs -i -- echo $i; done > square10x.dec
for i in `cat square.dec` ; do cat square.hex ; done > square10z.hex

printf '%08X\n' $(< square10x.dec) > square10x.hex

# add velocity nullpointers for xyz displacements
yes 00000000 | head -n `cat points.dec` > displacex.hex
cp displacex.hex displacey.hex
cp displacex.hex displacez.hex

# assemble/weave final hex, convert to bin
# add header data in front of measured bin data

paste id.hex square10x.hex measuredm.hex square10z.hex measuredq.hex displacex.hex displacey.hex displacez.hex > xyzmxyz.hex

cat points.hex xyzmxyz.hex > tipsy.hex

# convert hex string data a bin file
xxd -r -p bonsai.hex bonsai.bin
