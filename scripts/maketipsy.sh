#!/bin/bash
#
# this bash script was made with the help of unicorns and fairydust
# do not touch this code unless you want to change the way this universe works

# convert qrack logfiles into ascii hex and split in q and m
#
echo "reading qrack output in /var/log/qrack"
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
# make real and tipsy scaling 
# cube dimensions and convert value to hex for header

echo "original amount of measured values" $points
echo "view will be "$square "x" $square

# determine coordinate scaling factor 
tipsymax=4294967295
tipsy=$(($tipsymax/$square))
echo "tipsy scaling factor " $tipsy

# determine quantum register scaling factor
# number of qubits mask is hardcoded to 0xFFFFFFFF, 32 qbits
tipsyq=$(($tipsymax/32))
echo "tipsy quantum factor " $tipsyq

# resize number of points via dim and make hex
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
echo "clipped values:" $delta
wc -l measured.hex

# split in q and m results from clipped measured.hex
awk '{ print > (NR % 2 ? "measuredq.hex" : "measuredm.hex") }' measured.hex

# create default array row and make it hex
seq 0 $square > square.dec
printf '%08X\n' $(< square.dec) > square.hex

# create tipsy scale array row and make it hex
seq 0 $tipsy $tipsymax > squaretipsy.dec
printf '%08X\n' $(< squaretipsy.dec) > squaretipsy.hex

# default ID is 2
yes 02 | head -n `cat points.dec` > id.hex
yes 02000000 | head -n `cat points.dec` > idlong.hex

# make x coordinates, cut offsets, convert to hex
for i in `cat square.dec` ; do yes $(($i*$tipsy)) | head -n $square; done > square10x.dec
head -n -$square square10x.dec > square10xdelta.dec
mv square10xdelta.dec square10x.dec

# convert x-coordinates outcome to hex
printf '%08X\n' $(< square10x.dec) > square10x.hex

# make z coordinates in hex on tipsy scale and cut it to size
for i in `cat square.dec` ; do cat squaretipsy.hex ; done > square10z.hex
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

# convert relevant rows to FloatHEX and fork
for a in $(< measured.dec); do ./root/.local/bin/crackNum -f sp $a | grep "Hex layout" | tail -c 10 | tr -d ' ' ; done > measured.flex &

echo "size checks:"
cat points.dec
wc -l square10x.hex
wc -l measuredm.hex
wc -l square10z.hex
wc -l measuredq.hex
wc -l dummy.hex
wc -l idlong.hex
wc -l displacex.hex
wc -l displacey.hex
wc -l displacez.hex

# assemble/weave final hex, convert to bin
paste time.hex points.hex ndim.hex nsph.hex ndark.hex points.hex version.hex measuredq.hex square10x.hex measuredm.hex square10z.hex displacex.hex displacey.hex displacez.hex dummy.hex dummy.hex square10x.hex square10z.hex > tipsy.hex 

# convert hex string data a bin file
xxd -r -p tipsy.hex tipsy.bin
# aaaand convert to little indian
hexdump -v -e '1/4 "%08x"' -e '"\n"' tipsy.bin | xxd -r -p >tipsy_hexdump.bin

echo " "
echo "done"
