#!/bin/bash

# convert logfiles into ascii hex and split in q and m
./convert_measured_values.sh > measured.hex
awk '{ print > (NR % 2 ? "measuredq.hex" : "measuredm.hex") }' measured.hex


# ==== here starts tipsy special declarations ======

# T = time
echo "0000000000000000" > time.hex
echo "00030000" > ndim.hex
echo "00000000" > nsph.hex
echo "00000000" > ndark.hex
echo "00010000" > version.hex

# ==== here end tipsy special declarations =========

# count the total amount of lines with values
wc -l measured.hex | tr " " "\n"| grep -v measured.hex > rows.dec

# derive the amount of measured points for array dimension declaration
rows=$(<rows.dec)
echo $(( rows / 2 )) > points.dec

# dim a square by making a real sqr of the amount of points
points=$(<points.dec)
pointssqr=$(echo "$points" | awk '{print sqrt($1)}')
square=$( echo $pointssqr | awk '{printf "%.0f\n", $1}')
echo $square > cube.dec

# announce and declare raw point and the real cube dimensions
echo "original amount of measured values" $points
echo "view will be "$square "x" $square
echo $((square * square)) > points.dec
points=$(<points.dec)
echo "amount of measured values clipped:" $points
echo "conversion to tipsy started....."

# clip measured.hex to dim specs
clipped=$((points * 2))
delta=$((rows - clipped))
head -n -$delta measured.hex > measured2.hex
mv measured2.hex measured.hex
wc -l measured.hex

# create default array row and make it hex
seq 0 $square > square.dec
printf '%08X\n' $(< square.dec) > square.hex

# default ID is 2
yes 02 | head -n `cat points.dec` > id.hex

# make xz coordinates and convert to hex
time for i in `cat square.dec` ; do seq 1 $square | xargs -i -- echo $i; done > square10x.dec
for i in `cat square.dec` ; do cat square.hex ; done > square10z.hex

printf '%08X\n' $(< square10x.dec) > square10x.hex

# add velocity nullpointers for xyz displacements
yes 00000000 | head -n `cat points.dec` > displacex.hex
cp displacex.hex displacey.hex
cp displacex.hex displacez.hex

# assemble/weave final hex, convert to bin
# add header data in front of measured bin data

echo " "
wc -l square10x.hex
wc -l measuredm.hex
wc -l square10z.hex
wc -l measuredm.hex
wc -l displacex.hex
wc -l displacey.hex
wc -l displacez.hex

paste points.hex ndim.hex ndark.hex points.hex version.hex square10x.hex measuredm.hex square10z.hex measuredq.hex displacex.hex displacey.hex displacez.hex > xyzmxyz.hex

# add time.hex in front of header+data

cat time.hex xyzmxyz.hex > tipsy.hex

# convert hex string data a bin file
xxd -r -p tipsy.hex tipsy.bin

echo " "
echo "done"