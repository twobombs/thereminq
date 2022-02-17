#!/bin/bash
# this script converts 45000k of the s0e0 12q/28q-14d sycamore results
# and places those values in a tipsy AdS/CFT-style concentric tincan graph 
# a regular PC with 16 cores/threads will take ~6 hours to complete
# results of this calculation will be placed in the qracknet-graph repo
# 
# we fetch the sycamore 12 to 28 qbit over 14 depth results and extract it for filter-feed processing
#
tar -xvzf /thereminq/miscfiles/sycamore_rings.tar.gz && cd sycamore_rings
cat measure* > measured_supreme_12-28q14d.txt
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
# make z-coordinates based on amount of values ( same as in sycamore_spheres )
#
seq 1 10000 > z10k.dec
awk '{x=12*-cos($1*0.0003); print x;}' z10k.dec > z10kcos.dec
awk '{x=12*-sin($1*0.0003)+90; print x;}' z10k.dec > z10k2cos.dec
#

# the following scripts splices the workload into 10 separate 2-thread workloads. scale accordingly.
# oneliner is: while read number; do echo $((2#$number)) ; done < measured_supreme*.txt > measured_supreme_12-28q14d.dec
#
# convert measured binary result to decimal for conversion and placement
# 
while read number; do echo $((2#$number)) ; done < measurements_n12_m14_s0_e0_pEFGH.txt > measured_supreme_n12_m14_s0_e0_pEFGH.dec &
while read number; do echo $((2#$number)) ; done < measurements_n14_m14_s0_e0_pEFGH.txt > measured_supreme_n14_m14_s0_e0_pEFGH.dec &
while read number; do echo $((2#$number)) ; done < measurements_n16_m14_s0_e0_pEFGH.txt > measured_supreme_n16_m14_s0_e0_pEFGH.dec &
while read number; do echo $((2#$number)) ; done < measurements_n18_m14_s0_e0_pEFGH.txt > measured_supreme_n18_m14_s0_e0_pEFGH.dec &
while read number; do echo $((2#$number)) ; done < measurements_n20_m14_s0_e0_pEFGH.txt > measured_supreme_n20_m14_s0_e0_pEFGH.dec &
while read number; do echo $((2#$number)) ; done < measurements_n22_m14_s0_e0_pEFGH.txt > measured_supreme_n22_m14_s0_e0_pEFGH.dec &
while read number; do echo $((2#$number)) ; done < measurements_n24_m14_s0_e0_pEFGH.txt > measured_supreme_n24_m14_s0_e0_pEFGH.dec &
while read number; do echo $((2#$number)) ; done < measurements_n26_m14_s0_e0_pEFGH.txt > measured_supreme_n26_m14_s0_e0_pEFGH.dec &
while read number; do echo $((2#$number)) ; done < measurements_n28_m14_s0_e0_pEFGH.txt > measured_supreme_n28_m14_s0_e0_pEFGH.dec
#
echo "binary to decimal conversion done"
#
# calculate decimal x-y coordinates for placement
# one-liners:
# awk '{x=28*-sin($1*0.000000084); print x;}' measured_supreme_*.dec > measured_supreme_12-28q14d_x.dec
# awk '{y=28*-cos($1*0.000000084); print y;}' measured_supreme_*.dec > measured_supreme_12-28q14d_y.dec
#
# seprate in 4 x/y blocks: again a 10+ threads split
#
echo "starting cos/sin x/y calculations"
awk '{x=12*-sin($1*0.087912088); print x;}' measured_supreme_n12_m14_s0_e0_pEFGH.dec > measured_supreme_n12_m14_s0_e0_x.dec &
awk '{y=12*-cos($1*0.087912088); print y;}' measured_supreme_n12_m14_s0_e0_pEFGH.dec > measured_supreme_n12_m14_s0_e0_y.dec &
#
awk '{x=14*-sin($1*0.021973997); print x;}' measured_supreme_n14_m14_s0_e0_pEFGH.dec > measured_supreme_n14_m14_s0_e0_x.dec &
awk '{y=14*-cos($1*0.021973997); print y;}' measured_supreme_n14_m14_s0_e0_pEFGH.dec > measured_supreme_n14_m14_s0_e0_y.dec &
#
awk '{x=16*-sin($1*0.0055); print x;}' measured_supreme_n16_m14_s0_e0_pEFGH.dec > measured_supreme_n16_m14_s0_e0_x.dec &
awk '{y=16*-cos($1*0.0055); print y;}' measured_supreme_n16_m14_s0_e0_pEFGH.dec > measured_supreme_n16_m14_s0_e0_y.dec &
#
awk '{x=18*-sin($1*0.001373296); print x;}' measured_supreme_n18_m14_s0_e0_pEFGH.dec > measured_supreme_n18_m14_s0_e0_x.dec &
awk '{y=18*-cos($1*0.001373296); print y;}' measured_supreme_n18_m14_s0_e0_pEFGH.dec > measured_supreme_n18_m14_s0_e0_y.dec &
#
awk '{x=20*-sin($1*0.000343323); print x;}' measured_supreme_n20_m14_s0_e0_pEFGH.dec > measured_supreme_n20_m14_s0_e0_x.dec &
awk '{y=20*-cos($1*0.000343323); print y;}' measured_supreme_n20_m14_s0_e0_pEFGH.dec > measured_supreme_n20_m14_s0_e0_y.dec &
#
awk '{x=22*-sin($1*0.000085831); print x;}' measured_supreme_n22_m14_s0_e0_pEFGH.dec > measured_supreme_n22_m14_s0_e0_x.dec &
awk '{y=22*-cos($1*0.000085831); print y;}' measured_supreme_n22_m14_s0_e0_pEFGH.dec > measured_supreme_n22_m14_s0_e0_y.dec &
#
awk '{x=24*-sin($1*0.000021458); print x;}' measured_supreme_n24_m14_s0_e0_pEFGH.dec > measured_supreme_n24_m14_s0_e0_x.dec &
awk '{y=24*-cos($1*0.000021458); print y;}' measured_supreme_n24_m14_s0_e0_pEFGH.dec > measured_supreme_n24_m14_s0_e0_y.dec &
#
awk '{x=26*-sin($1*0.000005364); print x;}' measured_supreme_n26_m14_s0_e0_pEFGH.dec > measured_supreme_n26_m14_s0_e0_x.dec &
awk '{y=26*-cos($1*0.000005364); print y;}' measured_supreme_n26_m14_s0_e0_pEFGH.dec > measured_supreme_n26_m14_s0_e0_y.dec &
#
awk '{x=28*-sin($1*0.000001341); print x;}' measured_supreme_n28_m14_s0_e0_pEFGH.dec > measured_supreme_n28_m14_s0_e0_x.dec &
awk '{y=28*-cos($1*0.000001341); print y;}' measured_supreme_n28_m14_s0_e0_pEFGH.dec > measured_supreme_n28_m14_s0_e0_y.dec
#
#
# convert coordinates from dec to float hex ( divided into 4 parts to keep below the 16 cores requirement )
# 2 one-liners :
# for a in $(< measured_supreme_n??_m14_x.dec); do /root/.local/bin/crackNum -f sp $(echo $a) | grep "Hex layout" ; done > measured_supreme_n12-28_m14_x.flex &
# for a in $(< measured_supreme_n??_m14_y.dec); do /root/.local/bin/crackNum -f sp $(echo $a) | grep "Hex layout" ; done > measured_supreme_n12-28_m14_y.flex &
#
echo "starting the long march"
for a in $(< measured_supreme_n12_m14_s0_e0_x.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > measured_supreme_n12_m14_s0_e0_x.flex &
for a in $(< measured_supreme_n12_m14_s0_e0_y.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > measured_supreme_n12_m14_s0_e0_y.flex &
#
for a in $(< measured_supreme_n14_m14_s0_e0_x.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > measured_supreme_n14_m14_s0_e0_x.flex &
for a in $(< measured_supreme_n14_m14_s0_e0_y.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > measured_supreme_n14_m14_s0_e0_y.flex &
#
for a in $(< measured_supreme_n16_m14_s0_e0_x.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > measured_supreme_n16_m14_s0_e0_x.flex &
for a in $(< measured_supreme_n16_m14_s0_e0_y.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > measured_supreme_n16_m14_s0_e0_y.flex &
#
for a in $(< measured_supreme_n18_m14_s0_e0_x.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > measured_supreme_n18_m14_s0_e0_x.flex &
for a in $(< measured_supreme_n18_m14_s0_e0_y.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > measured_supreme_n18_m14_s0_e0_y.flex &
#
for a in $(< measured_supreme_n20_m14_s0_e0_x.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > measured_supreme_n20_m14_s0_e0_x.flex &
for a in $(< measured_supreme_n20_m14_s0_e0_y.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > measured_supreme_n20_m14_s0_e0_y.flex &
#
for a in $(< measured_supreme_n22_m14_s0_e0_x.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > measured_supreme_n22_m14_s0_e0_x.flex &
for a in $(< measured_supreme_n22_m14_s0_e0_y.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > measured_supreme_n22_m14_s0_e0_y.flex &
#
for a in $(< measured_supreme_n24_m14_s0_e0_x.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > measured_supreme_n24_m14_s0_e0_x.flex &
for a in $(< measured_supreme_n24_m14_s0_e0_y.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > measured_supreme_n24_m14_s0_e0_y.flex &
#
for a in $(< measured_supreme_n26_m14_s0_e0_x.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > measured_supreme_n26_m14_s0_e0_x.flex &
for a in $(< measured_supreme_n26_m14_s0_e0_y.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > measured_supreme_n26_m14_s0_e0_y.flex &
#
for a in $(< measured_supreme_n28_m14_s0_e0_x.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > measured_supreme_n28_m14_s0_e0_x.flex &
for a in $(< measured_supreme_n28_m14_s0_e0_y.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > measured_supreme_n28_m14_s0_e0_y.flex &
#
# this measured value conversion also needs at least 16 cores / 16 threads to fully execute 
# oneliner: for a in $(< measured_supreme28q14d.dec); do /root/.local/bin/crackNum -f sp $(echo $a) | grep "Hex layout" ; done > ../n28_m14.flex
#
echo "starting dec to float hex conversion" 
for a in $(< measured_supreme_n12_m14_s0_e0_pEFGH.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > n12_m14_s0_e0_pEFGH.flex &
for a in $(< measured_supreme_n14_m14_s0_e0_pEFGH.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > n14_m14_s0_e0_pEFGH.flex &
for a in $(< measured_supreme_n16_m14_s0_e0_pEFGH.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > n16_m14_s0_e0_pEFGH.flex &
for a in $(< measured_supreme_n18_m14_s0_e0_pEFGH.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > n18_m14_s0_e0_pEFGH.flex &
for a in $(< measured_supreme_n20_m14_s0_e0_pEFGH.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > n20_m14_s0_e0_pEFGH.flex &
for a in $(< measured_supreme_n22_m14_s0_e0_pEFGH.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > n22_m14_s0_e0_pEFGH.flex &
for a in $(< measured_supreme_n24_m14_s0_e0_pEFGH.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > n24_m14_s0_e0_pEFGH.flex &
for a in $(< measured_supreme_n26_m14_s0_e0_pEFGH.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > n26_m14_s0_e0_pEFGH.flex &
for a in $(< measured_supreme_n28_m14_s0_e0_pEFGH.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > n28_m14_s0_e0_pEFGH.flex
#
# z coordinates are also float-ed
#
for a in $(< z10kcos.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > z10k.flex
for a in $(< z10k2cos.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > z10k2.flex
#
echo "ready"
#
echo  "300 secs for tasks to finish"
sleep 300
wc -l measured_supreme_n??_m14_s0_e0*.flex
#
# merge x/y results into one file
cat measured_supreme_n??_m14_s0_e0_x.flex > measured_supreme_n12-28d14_x.flex
cat measured_supreme_n??_m14_s0_e0_y.flex > measured_supreme_n12-28d14_y.flex
#
# convert to hex
grep "Hex layout" measured_supreme_n12-28d14_x.flex | tr -d ' ' | tr -d 'Hexlayout:' > measured_supreme_n12-28d14_x.fhex
grep "Hex layout" measured_supreme_n12-28d14_y.flex | tr -d ' ' | tr -d 'Hexlayout:' > measured_supreme_n12-28d14_y.fhex
#

wc -l n??_m14_s0_e0_pEFGH.flex

# merge results into one file
cat n??_m14_s0_e0_pEFGH.flex > 12-28q14d.flex

# conversion of raw crackNum output to hex in fork
echo "filter to one fHEX file"
grep "Hex layout" 12-28q14d.flex | tr -d ' ' | tr -d 'Hexlayout:' > 12-28q14d.fhex
echo "done"
#
# convert z results to hex
grep "Hex layout" z10k.flex | tr -d ' ' | tr -d 'Hexlayout:' > z10k.fhex
grep "Hex layout" z10k2.flex | tr -d ' ' | tr -d 'Hexlayout:' > z10k2.fhex
#
# 9x z10k coordinate system
# for 2x9 datasets
for i in {1..9};do cat z10k.fhex >> z10k9.fhex; done
for i in {1..9};do cat z10k2.fhex >> z10k2-9.fhex; done
#
#
# 50x z10k coordinate system
# for 2x50 datasets
for i in {1..45};do cat z10k.fhex >> z10k45.fhex; done
for i in {1..45};do cat z10k2.fhex >> z10k2-45.fhex; done
#
#
# create ID and void displacement vectors
yes 02 | head -n $(wc -l < 12-28q14d.fhex) > id12-28q14d.fhex
yes 00000000 | head -n $(wc -l < 12-28q14d.fhex) > displace12-28q14d.fhex
#
#
echo $(wc -l < 12-28q14d.fhex ) > points12-28q14d.dec
printf '%08X\n' $(< points12-28q14d.dec) > points12-28q14d.hex
#
# assemble/weave hex, convert to bin
paste time.hex points28q14d.hex ndim.hex nsph.hex ndark.hex points12-28q14d.hex version.hex 12-28q14d.fhex measured_supreme_n12-28d14_x.fhex measured_supreme_n12-28d14_y.fhex z10k45.fhex displace12-28q14d.hex displace12-28q14d.hex displace12-28q14d.hex displace12-28q14d.hex displace12-28q14d.hex measured_supreme_n12-28_m14_x.fhex z10k45.fhex > tipsy-12-28q14d.hex
# convert float hex string data as a bin file
xxd -r -p tipsy-12-28q14d.hex tipsy-12-28q14d.bin
# aaaand convert to little indian
hexdump -v -e '1/4 "%08x"' -e '"\n"' tipsy-12-28q14d.bin | xxd -r -p >tipsy-12-28q14d_hexdump.bin
