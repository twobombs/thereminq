#!/bin/bash
# this script converts 2x90k of the s0e0 12q/28q-14d sycamore/qrack results
# and places those values in a tipsy bubble sphere graph 
# results of this calculation will be placed in the qracknet-graph repo
# 
# create dir and enter
mkdir sycamore_sphere && cd sycamore_sphere
#
# ==== here starts tipsy header declarations ======
# T = time
echo "0000000000000000" > time.hex
echo "00030000" > ndim.hex
echo "00000000" > nsph.hex
echo "00000000" > ndark.hex
echo "00010000" > version.hex

# ==== here end tipsy special declarations =========
#
# create a spere with z axis coordinate cos-system
#
seq 1 10000 > z10k.dec
awk '{x=28*-cos($1*0.0003); print x;}' z10k.dec > z10kcos.dec
awk '{x=28*-cos($1*0.0003)+90; print x;}' z10k.dec > z10k2cos.dec
#
# then we fetch the sycamore 12 to 28 qbit over 14 depth results and extract it for filter-feed processing
#
tar -xvzf /thereminq/miscfiles/qrack-supreme12-28q14d10k.tar.gz
cd qrack-supreme12-28q14d10k
#
# splice and convert for multithreaded processing
head -n 10000 supreme_12q14d_results.txt | tr , '\n' | grep -v test > supreme_12q14d_results.dec
head -n 10000 supreme_14q14d_results.txt | tr , '\n' | grep -v test > supreme_14q14d_results.dec
head -n 10000 supreme_16q14d_results.txt | tr , '\n' | grep -v test > supreme_16q14d_results.dec
head -n 10000 supreme_18q14d_results.txt | tr , '\n' | grep -v test > supreme_18q14d_results.dec
head -n 10000 supreme_20q14d_results.txt | tr , '\n' | grep -v test > supreme_20q14d_results.dec
head -n 10000 supreme_22q14d_results.txt | tr , '\n' | grep -v test > supreme_22q14d_results.dec
head -n 10000 supreme_24q14d_results.txt | tr , '\n' | grep -v test > supreme_24q14d_results.dec
head -n 10000 supreme_26q14d_results.txt | tr , '\n' | grep -v test > supreme_26q14d_results.dec
head -n 10000 supreme_28q14d_results.txt | tr , '\n' | grep -v test > supreme_28q14d_results.dec
#
# split number of qbits and results
awk '{ print > (NR % 2 ? "measuredq12.dec" : "measuredm12.dec") }' supreme_12q14d_results.dec
awk '{ print > (NR % 2 ? "measuredq14.dec" : "measuredm14.dec") }' supreme_14q14d_results.dec
awk '{ print > (NR % 2 ? "measuredq16.dec" : "measuredm16.dec") }' supreme_16q14d_results.dec
awk '{ print > (NR % 2 ? "measuredq18.dec" : "measuredm18.dec") }' supreme_18q14d_results.dec
awk '{ print > (NR % 2 ? "measuredq20.dec" : "measuredm20.dec") }' supreme_20q14d_results.dec
awk '{ print > (NR % 2 ? "measuredq22.dec" : "measuredm22.dec") }' supreme_22q14d_results.dec
awk '{ print > (NR % 2 ? "measuredq24.dec" : "measuredm24.dec") }' supreme_24q14d_results.dec
awk '{ print > (NR % 2 ? "measuredq26.dec" : "measuredm26.dec") }' supreme_26q14d_results.dec
awk '{ print > (NR % 2 ? "measuredq28.dec" : "measuredm28.dec") }' supreme_28q14d_results.dec
#
#
#
echo "starting cos/sin x/y calculations"
awk '{x=12*-sin($1*0.087912088); print x;}' measuredm12.dec > measuredm12x.dec &
awk '{y=12*-cos($1*0.087912088); print y;}' measuredm12.dec > measuredm12y.dec &
#
awk '{x=14*-sin($1*0.087912088); print x;}' measuredm14.dec > measuredm14x.dec &
awk '{y=14*-cos($1*0.087912088); print y;}' measuredm14.dec > measuredm14y.dec &
#
awk '{x=16*-sin($1*0.087912088); print x;}' measuredm14.dec > measuredm14x.dec &
awk '{y=16*-cos($1*0.087912088); print y;}' measuredm14.dec > measuredm14y.dec &
#
awk '{x=18*-sin($1*0.087912088); print x;}' measuredm16.dec > measuredm16x.dec &
awk '{y=18*-cos($1*0.087912088); print y;}' measuredm16.dec > measuredm16y.dec &
#
awk '{x=20*-sin($1*0.087912088); print x;}' measuredm18.dec > measuredm18x.dec &
awk '{y=20*-cos($1*0.087912088); print y;}' measuredm18.dec > measuredm18y.dec &
#
awk '{x=22*-sin($1*0.087912088); print x;}' measuredm20.dec > measuredm20x.dec &
awk '{y=22*-cos($1*0.087912088); print y;}' measuredm20.dec > measuredm20y.dec &
#
awk '{x=24*-sin($1*0.087912088); print x;}' measuredm22.dec > measuredm22x.dec &
awk '{y=24*-cos($1*0.087912088); print y;}' measuredm22.dec > measuredm22y.dec &
#
awk '{x=26*-sin($1*0.087912088); print x;}' measuredm24.dec > measuredm24x.dec &
awk '{y=26*-cos($1*0.087912088); print y;}' measuredm24.dec > measuredm24y.dec &
#
awk '{x=28*-sin($1*0.087912088); print x;}' measuredm26.dec > measuredm26x.dec &
awk '{y=28*-cos($1*0.087912088); print y;}' measuredm26.dec > measuredm26y.dec &
#
awk '{x=28*-sin($1*0.087912088); print x;}' measuredm28.dec > measuredm28x.dec
awk '{y=28*-cos($1*0.087912088); print y;}' measuredm28.dec > measuredm28y.dec
#
#
# convert to float hex
#
for a in $(< measuredm12x.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a*12) | grep "Hex layout" ; done > ../measuredm12x.flex &
for a in $(< measuredm12y.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a*12) | grep "Hex layout" ; done > ../measuredm12y.flex &
#
for a in $(< measuredm14x.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a*14) | grep "Hex layout" ; done > ../measuredm14x.flex &
for a in $(< measuredm14y.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a*14) | grep "Hex layout" ; done > ../measuredm14y.flex &
#
for a in $(< measuredm16x.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a*16) | grep "Hex layout" ; done > ../measuredm16x.flex &
for a in $(< measuredm16y.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a*16) | grep "Hex layout" ; done > ../measuredm16y.flex &
#
for a in $(< measuredm18x.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a*18) | grep "Hex layout" ; done > ../measuredm18x.flex &
for a in $(< measuredm18y.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a*18) | grep "Hex layout" ; done > ../measuredm18y.flex &
#
for a in $(< measuredm20x.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a*20) | grep "Hex layout" ; done > ../measuredm20x.flex &
for a in $(< measuredm20y.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a*20) | grep "Hex layout" ; done > ../measuredm20y.flex &
#
for a in $(< measuredm22x.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a*22) | grep "Hex layout" ; done > ../measuredm22x.flex &
for a in $(< measuredm22y.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a*22) | grep "Hex layout" ; done > ../measuredm22y.flex &
#
for a in $(< measuredm24x.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a*24) | grep "Hex layout" ; done > ../measuredm24x.flex &
for a in $(< measuredm24y.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a*24) | grep "Hex layout" ; done > ../measuredm24y.flex
#
for a in $(< measuredm26x.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a*26) | grep "Hex layout" ; done > ../measuredm26x.flex &
for a in $(< measuredm26y.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a*26) | grep "Hex layout" ; done > ../measuredm26y.flex &
#
for a in $(< measuredm28x.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a*28) | grep "Hex layout" ; done > ../measuredm28x.flex &
for a in $(< measuredm28y.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a*28) | grep "Hex layout" ; done > ../measuredm28y.flex &
#
# convert qbit weigth
#
for a in $(< measuredq12.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a*12) | grep "Hex layout" ; done > ../measuredq12.flex &
for a in $(< measuredq14.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a*14) | grep "Hex layout" ; done > ../measuredq14.flex &
for a in $(< measuredq16.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a*16) | grep "Hex layout" ; done > ../measuredq16.flex &
for a in $(< measuredq18.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a*18) | grep "Hex layout" ; done > ../measuredq18.flex &
for a in $(< measuredq20.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a*20) | grep "Hex layout" ; done > ../measuredq20.flex &
for a in $(< measuredq22.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a*22) | grep "Hex layout" ; done > ../measuredq22.flex &
for a in $(< measuredq24.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a*24) | grep "Hex layout" ; done > ../measuredq24.flex &
for a in $(< measuredq26.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a*26) | grep "Hex layout" ; done > ../measuredq26.flex &
for a in $(< measuredq28.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a*28) | grep "Hex layout" ; done > ../measuredq28.flex &
#
# z coordinates are also float-ed
#
for a in $(< ../z10kcos.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > z10k.flex
for a in $(< ../z10k2cos.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > z10k2.flex
#
# merge results into one file
cat ../measuredm??x* > ../measuredmx.flex
cat ../measuredm??y* > ../measuredmy.flex
#
# convert x y to hex
grep "Hex layout" ../measuredmx.flex | tr -d ' ' | tr -d 'Hexlayout:' > ../measuredmx.fhex
grep "Hex layout" ../measuredmy.flex | tr -d ' ' | tr -d 'Hexlayout:' > ../measuredmy.fhex
#
# convert z results to hex
grep "Hex layout" z10k.flex | tr -d ' ' | tr -d 'Hexlayout:' > ../z10k.fhex
grep "Hex layout" z10k2.flex | tr -d ' ' | tr -d 'Hexlayout:' > ../z10k2.fhex
#
# multiply the z coordinate system by 9 to fit the amount of points
seq 1 9 | xargs -Inone cat ../z10k.fhex >> measuredz.fhex
#
# merge q results into one file
cat ../measuredq??.flex > ../measuredq.flex
#
grep "Hex layout" ../measuredq.flex | tr -d ' ' | tr -d 'Hexlayout:' > ../measuredq.fhex
#
# the next part needs to be doublechecked for use in this script
#
cd ..
# create ID and void displacement vectors
yes 02 | head -n $(wc -l < measuredq.fhex) > id.fhex
yes 00000000 | head -n $(wc -l < measuredq.fhex) > displace.fhex
#
# was points is nu measuredq....
echo $(wc -l < measuredq.fhex ) > pointsq.dec
printf '%08X\n' $(< measuredq.dec) > pointsq.hex
#
# assemble/weave hex, convert to bin
paste time.hex pointsq.hex ndim.hex nsph.hex ndark.hex pointsq.hex version.hex measuredq.fhex measuredx.fhex measuredy.fhex measuredz.fhex displace.fhex displace.fhex displace.fhex displace.fhex displace.fhex measuredx.fhex measuredz.fhex > tipsy.hex
# convert float hex string data as a bin file
xxd -r -p tipsy.hex tipsy.bin
# aaaand convert to little indian
hexdump -v -e '1/4 "%08x"' -e '"\n"' tipsy.bin | xxd -r -p >tipsy_hexdump.bin
#
