#!/bin/bash
# this script converts 2x90k of the s0e0 12q/28q-14d sycamore/qrack results
# and places those values in a tipsy bubble sphere graph 
# results of this calculation will be placed in the qracknet-graph repo
# 
# create dir and enter
mkdir sycamore_sphere && cd sycamore_sphere
# then we fetch the sycamore 12 to 28 qbit over 14 depth results and extract it for filter-feed processing
#
tar -xvzf /thereminq/miscfiles/qrack-supreme12-28q14d10k.tar.gz
cd qrack-supreme12-28q14d10k
#
#
# ==== here starts tipsy header declarations ======
# T = time
echo "0000000000000000" > time.hex
echo "00030000" > ndim.hex
echo "00000000" > nsph.hex
echo "00000000" > ndark.hex
echo "00010000" > version.hex
#
# ==== here end tipsy special declarations =========
#
# create a spere with z axis coordinate cos-system
#
seq 1 10000 > z10k.dec
awk -v OFMT='%f' '{x=12*cos($1*0.0003); print x;}' z10k.dec > z10kcos.dec
awk -v OFMT='%f' '{x=12*sin($1*0.0003); print x;}' z10k.dec > z10k2cos.dec
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
echo "starting cos/sin x/y calculations"
awk '{x=6*sin($1*0.087912088); print x;}' measuredm12.dec > measuredm12x.dec &
awk '{y=6*cos($1*0.087912088); print y;}' measuredm12.dec > measuredm12y.dec &
#
awk '{x=7*sin($1*0.087912088); print x;}' measuredm14.dec > measuredm14x.dec &
awk '{y=7*cos($1*0.087912088); print y;}' measuredm14.dec > measuredm14y.dec &
#
awk '{x=8*sin($1*0.087912088); print x;}' measuredm16.dec > measuredm16x.dec &
awk '{y=8*cos($1*0.087912088); print y;}' measuredm16.dec > measuredm16y.dec &
#
awk '{x=9*sin($1*0.087912088); print x;}' measuredm18.dec > measuredm18x.dec &
awk '{y=9*cos($1*0.087912088); print y;}' measuredm18.dec > measuredm18y.dec &
#
awk '{x=10*sin($1*0.087912088); print x;}' measuredm20.dec > measuredm20x.dec &
awk '{y=10*cos($1*0.087912088); print y;}' measuredm20.dec > measuredm20y.dec &
#
awk '{x=11*sin($1*0.087912088); print x;}' measuredm22.dec > measuredm22x.dec &
awk '{y=11*cos($1*0.087912088); print y;}' measuredm22.dec > measuredm22y.dec &
#
awk '{x=12*sin($1*0.087912088); print x;}' measuredm24.dec > measuredm24x.dec &
awk '{y=12*cos($1*0.087912088); print y;}' measuredm24.dec > measuredm24y.dec &
#
awk '{x=13*sin($1*0.087912088); print x;}' measuredm26.dec > measuredm26x.dec &
awk '{y=13*cos($1*0.087912088); print y;}' measuredm26.dec > measuredm26y.dec &
#
awk '{x=14*sin($1*0.087912088); print x;}' measuredm28.dec > measuredm28x.dec
awk '{y=14*cos($1*0.087912088); print y;}' measuredm28.dec > measuredm28y.dec
#
#
# subtract z coordinate from x/y points for spheres
paste -d+ measuredm12x.dec z10kcos.dec > measuredbc12x.dec
paste -d+ measuredm12y.dec z10k2cos.dec > measuredbc12y.dec
#
cat measuredbc12x.dec | bc > measuredc12x.dec
cat measuredbc12y.dec | bc > measuredc12y.dec
#
paste -d+ measuredm14x.dec z10kcos.dec > measuredbc14x.dec
paste -d+ measuredm14y.dec z10k2cos.dec > measuredbc14y.dec
#
cat measuredbc14x.dec | bc > measuredc14x.dec
cat measuredbc14y.dec | bc > measuredc14y.dec
#
paste -d+ measuredm16x.dec z10kcos.dec > measuredbc16x.dec
paste -d+ measuredm16y.dec z10k2cos.dec > measuredbc16y.dec
#
cat measuredbc16x.dec | bc > measuredc16x.dec
cat measuredbc16y.dec | bc > measuredc16y.dec
#
paste -d+ measuredm18x.dec z10kcos.dec > measuredbc18x.dec
paste -d+ measuredm18y.dec z10k2cos.dec > measuredbc18y.dec
#
cat measuredbc18x.dec | bc > measuredc18x.dec
cat measuredbc18y.dec | bc > measuredc18y.dec
#
paste -d+ measuredm20x.dec z10kcos.dec > measuredbc20x.dec
paste -d+ measuredm20y.dec z10k2cos.dec > measuredbc20y.dec
#
cat measuredbc20x.dec | bc > measuredc20x.dec
cat measuredbc20y.dec | bc > measuredc20y.dec
#
paste -d+ measuredm22x.dec z10kcos.dec > measuredbc22x.dec
paste -d+ measuredm22y.dec z10k2cos.dec > measuredbc22y.dec
#
cat measuredbc22x.dec | bc > measuredc22x.dec
cat measuredbc22y.dec | bc > measuredc22y.dec
#
paste -d+ measuredm24x.dec z10kcos.dec > measuredbc24x.dec
paste -d+ measuredm24y.dec z10k2cos.dec > measuredbc24y.dec
#
cat measuredbc24x.dec | bc > measuredc24x.dec
cat measuredbc24y.dec | bc > measuredc24y.dec
#
paste -d+ measuredm26x.dec z10kcos.dec > measuredbc26x.dec
paste -d+ measuredm26y.dec z10k2cos.dec > measuredbc26y.dec
#
cat measuredbc26x.dec | bc > measuredc26x.dec
cat measuredbc26y.dec | bc > measuredc26y.dec
#
paste -d+ measuredm28x.dec z10kcos.dec > measuredbc28x.dec
paste -d+ measuredm28y.dec z10k2cos.dec > measuredbc28y.dec
#
cat measuredbc28x.dec | bc > measuredc28x.dec
cat measuredbc28y.dec | bc > measuredc28y.dec
#
# convert q,m,x,y to float hex
#
#
for a in $(< measuredm12x.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > measuredm12x.flex &
for a in $(< measuredm12y.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > measuredm12y.flex &
#
for a in $(< measuredm14x.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > measuredm14x.flex &
for a in $(< measuredm14y.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > measuredm14y.flex &
#
for a in $(< measuredm16x.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > measuredm16x.flex &
for a in $(< measuredm16y.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > measuredm16y.flex &
#
for a in $(< measuredm18x.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > measuredm18x.flex &
for a in $(< measuredm18y.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > measuredm18y.flex &
#
for a in $(< measuredm20x.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > measuredm20x.flex &
for a in $(< measuredm20y.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > measuredm20y.flex &
#
for a in $(< measuredm22x.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > measuredm22x.flex &
for a in $(< measuredm22y.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > measuredm22y.flex &
#
for a in $(< measuredm24x.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > measuredm24x.flex &
for a in $(< measuredm24y.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > measuredm24y.flex &
#
for a in $(< measuredm26x.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > measuredm26x.flex &
for a in $(< measuredm26y.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > measuredm26y.flex &
#
for a in $(< measuredm28x.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > measuredm28x.flex &
for a in $(< measuredm28y.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > measuredm28y.flex &
#
#
for a in $(< measuredc12x.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > measuredc12x.flex &
for a in $(< measuredc12y.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > measuredc12y.flex &
#
for a in $(< measuredc14x.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > measuredc14x.flex &
for a in $(< measuredc14y.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > measuredc14y.flex &
#
for a in $(< measuredc16x.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > measuredc16x.flex &
for a in $(< measuredc16y.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > measuredc16y.flex &
#
for a in $(< measuredc18x.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > measuredc18x.flex &
for a in $(< measuredc18y.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > measuredc18y.flex &
#
for a in $(< measuredc20x.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > measuredc20x.flex &
for a in $(< measuredc20y.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > measuredc20y.flex &
#
for a in $(< measuredc22x.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > measuredc22x.flex &
for a in $(< measuredc22y.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > measuredc22y.flex &
#
for a in $(< measuredc24x.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > measuredc24x.flex &
for a in $(< measuredc24y.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > measuredc24y.flex &
#
for a in $(< measuredc26x.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > measuredc26x.flex &
for a in $(< measuredc26y.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > measuredc26y.flex &
#
for a in $(< measuredc28x.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > measuredc28x.flex &
for a in $(< measuredc28y.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > measuredc28y.flex &
#
# convert qbit weigth
#
for a in $(< measuredq12.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > measuredq12.flex &
for a in $(< measuredq14.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > measuredq14.flex &
for a in $(< measuredq16.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > measuredq16.flex &
for a in $(< measuredq18.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > measuredq18.flex &
for a in $(< measuredq20.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > measuredq20.flex &
for a in $(< measuredq22.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > measuredq22.flex &
for a in $(< measuredq24.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > measuredq24.flex &
for a in $(< measuredq26.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > measuredq26.flex &
for a in $(< measuredq28.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > measuredq28.flex &
#
# z coordinates are also float-ed - part a integrated here in main compute line b/c of speed
#
for a in $(< z10kcos.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > z10k.flex &
#
# convert qbit mass
#
for a in $(< measuredm12.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a*40000 | bc -l) | grep "Hex layout" ; done > measuredm12.flex &
for a in $(< measuredm14.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a*2441 | bc -l) | grep "Hex layout" ; done > measuredm14.flex &
for a in $(< measuredm16.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a*610 | bc -l) | grep "Hex layout" ; done > measuredm16.flex &
for a in $(< measuredm18.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a*153 | bc -l) | grep "Hex layout" ; done > measuredm18.flex &
for a in $(< measuredm20.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a*38 | bc -l) | grep "Hex layout" ; done > measuredm20.flex &
for a in $(< measuredm22.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a*9.5 | bc -l) | grep "Hex layout" ; done > measuredm22.flex &
for a in $(< measuredm24.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a*2.4 | bc -l) | grep "Hex layout" ; done > measuredm24.flex &
for a in $(< measuredm26.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a/1.6 | bc -l) | grep "Hex layout" ; done > measuredm26.flex &
for a in $(< measuredm28.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a/6.7 | bc -l) | grep "Hex layout" ; done > measuredm28.flex
#
# z coordinates are also float-ed - part b
#
for a in $(< z10k2cos.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > z10k2.flex
#
# merge results into one file
#
cat measuredm??x.flex > measuredmx.flex
cat measuredm??y.flex > measuredmy.flex
#
cat measuredc??x.flex > measuredcx.flex
cat measuredc??y.flex > measuredcy.flex

#
cat measuredm??.flex > measuredm.flex
#
# convert x y to hex
grep "Hex layout" measuredmx.flex | tr -d ' ' | tr -d 'Hexlayout:' > measuredmx.fhex
grep "Hex layout" measuredmy.flex | tr -d ' ' | tr -d 'Hexlayout:' > measuredmy.fhex
#
# convert x y to hex
grep "Hex layout" measuredcx.flex | tr -d ' ' | tr -d 'Hexlayout:' > measuredcx.fhex
grep "Hex layout" measuredcy.flex | tr -d ' ' | tr -d 'Hexlayout:' > measuredcy.fhex
#
# convert z results to hex
grep "Hex layout" z10k.flex | tr -d ' ' | tr -d 'Hexlayout:' > z10k.fhex
grep "Hex layout" z10k2.flex | tr -d ' ' | tr -d 'Hexlayout:' > z10k2.fhex
#
# convert m to hex
grep "Hex layout" measuredm.flex | tr -d ' ' | tr -d 'Hexlayout:' > measuredm.fhex
#
#
# 9x z10k coordiate system
# for 2x9 datasets
for i in {1..9};do cat z10k.fhex >> z10k9.fhex; done
for i in {1..9};do cat z10k2.fhex >> z10k2-9.fhex; done

# multiply the z coordinate system by 9 to fit the amount of points
# >> does this work ?? <<
seq 1 9 | xargs -Inone cat z10k.fhex >> measuredz.fhex
#
# merge q results into one file
cat measuredq??.flex > measuredq.flex
#
grep "Hex layout" measuredq.flex | tr -d ' ' | tr -d 'Hexlayout:' > measuredq.fhex
#
# the next part needs to be doublechecked for use in this script
# we do not go back to the main buildscripts dir
# cd ..
#
# create ID and void displacement vectors
yes 02 | head -n $(wc -l < measuredq.fhex) > id.fhex
yes 00000000 | head -n $(wc -l < measuredq.fhex) > displace.fhex
#
# was points is nu measuredq....
echo $(wc -l < measuredq.fhex ) > pointsq.dec
printf '%08X\n' $(< pointsq.dec) > pointsq.hex
#
# assemble/weave hex, convert to bin
paste time.hex pointsq.hex ndim.hex nsph.hex ndark.hex pointsq.hex version.hex measuredm.fhex measuredmx.fhex measuredmy.fhex z10k9.fhex displace.fhex displace.fhex displace.fhex displace.fhex displace.fhex measuredmx.fhex z10k9.fhex > sycamore_spheres_tipsy.hex
# convert float hex string data as a bin file
xxd -r -p sycamore_spheres_tipsy.hex sycamore_spheres_tipsy.bin
# aaaand convert to little indian
hexdump -v -e '1/4 "%08x"' -e '"\n"' sycamore_spheres_tipsy.bin | xxd -r -p >sycamore_spheres_tipsy_hexdump.bin
#
# assemble/weave hex, convert to bin
paste time.hex pointsq.hex ndim.hex nsph.hex ndark.hex pointsq.hex version.hex measuredm.fhex measuredcx.fhex measuredcy.fhex z10k2-9.fhex displace.fhex displace.fhex displace.fhex displace.fhex displace.fhex measuredcx.fhex z10k9.fhex > sycamore_spheres_tipsy_bowl.hex
# convert float hex string data as a bin file
xxd -r -p sycamore_spheres_tipsy_bowl.hex sycamore_spheres_tipsy_bowl.bin
# aaaand convert to little indian
hexdump -v -e '1/4 "%08x"' -e '"\n"' sycamore_spheres_tipsy_bowl.bin | xxd -r -p >sycamore_spheres_tipsy_bowl_hexdump.bin
#
