#!/bin/bash

# convert logfiles into ascii hex
./convert_measured_values.sh > measured.hex

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

echo $square

# create default array row and make it hex
seq 0 $square > square.dec
printf '%08X\n' $(< square.dec) > square.hex

# make xz coordinates and convert to hex
for i in {1..square};do cat square.hex; done > square10x.hex
(awk '{for(j=0; j<=square; j++)print}' square.dec) > square10z.dec
printf '%08X\n' $(< square10z.dec) > square10z.hex

# assemble/weave final hex, convert to bin
# add header data in front of measured bin data

paste square10x.hex square10z.hex > bonsaixz.hex
paste measured.hex measured.hex > bonsaiym.hex
paste bonsaixz.hex bonsaiym.hex > bonsaixyzm.hex

cat points.hex bonsaixyzm.hex > bonsai.hex


# convert hex string data a bin file
xxd -r -p bonsai.hex bonsai.bin
