#!/bin/bash

# convert logfiles into ascii hex and split in q and m
./convert_measured_values.sh > measured.hex
# awk '{ print > (NR % 2 ? "measuredq.hex" : "measuredm.hex") }' measured.hex

# ==== here starts tipsy header declarations ======

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

# dim a square by making a real sqr of the amount of points with margin
points=$(<points.dec)
pointssqr=$(echo "$points" | awk '{print sqrt($1)}')

# integer the sqrt, subtract margin
square=$( echo $pointssqr | awk '{printf "%.0f\n", $1}')
margin=$(( 1 ))
square=$((square - margin))
echo $square > cube.dec

# announce and declare raw points
# make real cube dimensions and convert value to hex for header
echo "original amount of measured values" $points
echo "view will be "$square "x" $square
echo $((square * square)) > points.dec
points=$(<points.dec)
printf '%08X\n' $(< points.dec) > points.hex

echo "amount of measured values clipped:" $points
echo "conversion to tipsy started....."

# clip measured.hex to dim specs
clipped=$((points * 2))
delta=$((rows - clipped))
head -n -$delta measured.hex > measured2.hex
mv measured2.hex measured.hex

# announce result and delta
echo $delta
wc -l measured.hex

# split in q and m results from clipped measured.hex
awk '{ print > (NR % 2 ? "measuredq.hex" : "measuredm.hex") }' measured.hex

# create default array row and make it hex
seq 0 $square > square.dec
printf '%08X\n' $(< square.dec) > square.hex

# default ID is 2
yes 02 | head -n `cat points.dec` > id.hex
yes 02000000 | head -n `cat points.dec` > idlong.hex

# make xz coordinates, cut offsets, convert to hex
for i in `cat square.dec` ; do yes $i | head -n $square; done > square10x.dec
head -n -$square square10x.dec > square10xdelta.dec
mv square10xdelta.dec square10x.dec
printf '%08X\n' $(< square10x.dec) > square10x.hex

for i in `cat square.dec` ; do cat square.hex ; done > square10z.hex
head -n -$square square10z.hex > square10zdelta.hex
mv square10zdelta.hex square10z.hex
head -n -$square square10z.hex > square10zdelta.hex
mv square10zdelta.hex square10z.hex
head -n -1 square10z.hex > square10zdelta.hex
mv square10zdelta.hex square10z.hex

# add velocity nullpointers for xyz displacements
yes 00000000 | head -n `cat points.dec` > displacex.hex
cp displacex.hex displacey.hex
cp displacex.hex displacez.hex
cp displacex.hex dummy.hex

# assemble/weave final hex, convert to bin
# add header data in front of measured bin data

echo " "
cat points.dec
wc -l square10x.hex
wc -l measuredm.hex
wc -l square10z.hex
wc -l measuredm.hex
wc -l dummy.hex
wc -l idlong.hex
wc -l displacex.hex
wc -l displacey.hex
wc -l displacez.hex

# convert points.hex from AB to BA format
# tail -c 5 points.hex > pointsvar.hex
# head -c 4 points.hex >> pointsvar.hex
# cat pointsvar.hex |  tr -d "\n" > points.hex

paste points.hex ndim.hex nsph.hex ndark.hex points.hex version.hex measuredq.hex square10x.hex measuredm.hex square10z.hex displacex.hex displacey.hex displacez.hex dummy.hex dummy.hex square10x.hex square10z.hex > xyzmxyz.hex

# add time.hex in front of header+data

cat time.hex xyzmxyz.hex > tipsy.hex

# convert hex string data a bin file
xxd -r -p tipsy.hex tipsy.bin
# aaaand convert to little indian
hexdump -v -e '1/4 "%08x"' -e '"\n"' tipsy.bin | xxd -r -p >tipsy_hexdump.bin


echo " "
echo "done"
