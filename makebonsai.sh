#!/bin/bash

# convert logfiles into ascii hex
./convert_measured_values.sh > measured.hex

# count the total amount of lines
wc -l measured.hex | tr " " "\n"| grep -v measured.hex > rows.dec

# derive the amount of points for array dimension declaration
rows=$(<rows.dec)
echo $(( rows / 2 )) > points.dec
printf '%08X\n' $(< points.dec) > points.hex

# add header data in front of measured data
cat points.hex measured.hex > bonsai.hex

# make hex string data a bin file
xxd -r -p bonsai.hex bonsai.bin
