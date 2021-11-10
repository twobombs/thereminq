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
tipsymax=1048575
tipsy=$(($tipsymax/$square))
echo "tipsy maximum factor " $tipsymax
echo "tipsy scaling factor " $tipsy

# determine quantum register scaling factor
# number of qubits mask is hardcoded to 0xFFFFFFFF, 32 qbits
tipsyq=$(($tipsy/32))
echo "tipsy quantum factor " $tipsyq

# resize number of points via dim and make hex also create doubler points2,3 and qubed
echo $((square * square)) > points.dec
points=$(<points.dec)
echo $((points * 2)) > points2.dec
echo $((points * 3)) > points3.dec
echo $((points * square)) > pointsqubed.dec

printf '%08X\n' $(< points.dec) > points.hex
printf '%08X\n' $(< points2.dec) > points2.hex
printf '%08X\n' $(< points3.dec) > points3.hex
printf '%08X\n' $(< pointsqubed.dec) > pointsqubed.hex

echo "amount of measured values clipped:" $points
echo "conversion to tipsy started....."

# clip measured.hex and measured.dec to dim specs
clipped=$((points * 2))
delta=$((rows - clipped))
# hex part
head -n -$delta measured.hex > measured2.hex
mv measured2.hex measured.hex
# dec part
head -n -$delta measured.dec > measured2.dec
mv measured2.dec measured.dec

# announce result and delta
echo "clipped values:" $delta
wc -l measured.hex

# split in q and m results from clipped measured.hex and measured.dec
awk '{ print > (NR % 2 ? "measuredq.hex" : "measuredm.hex") }' measured.hex
awk '{ print > (NR % 2 ? "measuredq.dec" : "measuredm.dec") }' measured.dec

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
for i in `cat square.dec` ; do yes $(($i*$tipsyq)) | head -n $square; done > square10x.dec
head -n -$square square10x.dec > square10xdelta.dec
mv square10xdelta.dec square10x.dec

# convert x-coordinates outcome to hex
printf '%08X\n' $(< square10x.dec) > square10x.hex

# make z coordinates in hex and dec on tipsy scale and cut it to size
# hex
for i in `cat square.dec` ; do cat squaretipsy.hex ; done > square10z.hex
head -n -$square square10z.hex > square10zdelta.hex
mv square10zdelta.hex square10z.hex
head -n -$square square10z.hex > square10zdelta.hex
mv square10zdelta.hex square10z.hex
head -n -1 square10z.hex > square10zdelta.hex
mv square10zdelta.hex square10z.hex

# dec: first convert
while read number; do echo "ibase=16; $number" | bc; done < squaretipsy.hex > squaretipsy.dec

for i in `cat square.dec` ; do cat squaretipsy.dec ; done > square10z.dec
head -n -$square square10z.dec > square10zdelta.dec
mv square10zdelta.dec square10z.dec
head -n -$square square10z.dec > square10zdelta.dec
mv square10zdelta.dec square10z.dec
head -n -1 square10z.dec > square10zdelta.dec
mv square10zdelta.dec square10z.dec

# calculate total quantum volume output
paste -d* measuredm.dec measuredq.dec | sed 's/$//' | bc > measuredvol.dec

# add velocity nullpointers for xyz displacements
yes 00000000 | head -n `cat points.dec` > displacex.hex
cp displacex.hex displacey.hex
cp displacex.hex displacez.hex
cp displacex.hex dummy.hex

# convert relevant rows to FloatHEX and fork
echo "float conversion started"

for a in $(< measuredm.dec); do /root/.local/bin/crackNum -f sp $(echo $a/$tipsy | bc -l) | grep "Hex layout" ; done > measuredm.flex &
echo "forked 1 of 6 "

for a in $(< square10z.dec); do /root/.local/bin/crackNum -f sp $(echo $a/$tipsy | bc -l) | grep "Hex layout" ; done > square10z.flex &
echo "forked 2 of 6 "

for a in $(< measuredq.dec); do /root/.local/bin/crackNum -f sp $a | grep "Hex layout" ; done > measuredq.flex &
echo "forked 3 of 6 "

for a in $(< square10x.dec); do /root/.local/bin/crackNum -f sp $(echo $a/$tipsy | bc -l) | grep "Hex layout" ; done > square10x.flex &
echo "forked 4 of 6 "

echo "no fork on 5"
for a in $(< measuredvol.dec); do /root/.local/bin/crackNum -f sp $(echo $a/$tipsy | bc -l) | grep "Hex layout" ; done > measuredvol.flex

for a in $(< squaretipsy.dec); do /root/.local/bin/crackNum -f sp $(echo $a/$tipsy | bc -l) | grep "Hex layout" ; done > squaretipsy.flex
echo "last one done - 6 of 6 -"

echo  "20 secs for tasks to finish"
sleep 20

# conversion of raw crackNum output to hex in fork
echo "filter to fHEX"
grep "Hex layout" square10x.flex | tr -d ' ' | tr -d 'Hexlayout:' > square10x.fhex &
grep "Hex layout" squaretipsy.flex | tr -d ' ' | tr -d 'Hexlayout:' > squaretipsy.fhex &
grep "Hex layout" square10z.flex | tr -d ' ' | tr -d 'Hexlayout:' > square10z.fhex &
grep "Hex layout" measuredq.flex | tr -d ' ' | tr -d 'Hexlayout:' > measuredq.fhex &
grep "Hex layout" measuredm.flex | tr -d ' ' | tr -d 'Hexlayout:' > measuredm.fhex
grep "Hex layout" measuredvol.flex | tr -d ' ' | tr -d 'Hexlayout:' > measuredvol.fhex

echo "size checks:"
./sizing.sh

echo "weaving tipsy output formats"
./weave.sh

# echo "setup cube of q/m-stream"
./qftube.sh

echo " "
echo "done"
