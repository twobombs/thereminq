#!/bin/bash
# this script converts 4500k of the s0e0 12q/28q-14d sycamore results
# and places those values in a tipsy AdS/CFT-style concentric tincan graph 
# a regular PC with 16 cores/threads will take ~12 hours to complete
# results of this calculation will be placed in the qracknet-graph repo
# 
# ==== here starts tipsy header declarations ======

# T = time
echo "0000000000000000" > time.hex
echo "00030000" > ndim.hex
echo "00000000" > nsph.hex
echo "00000000" > ndark.hex
echo "00010000" > version.hex

# ==== here end tipsy special declarations =========

# we fetch the sycamore 28 qbit over 14 depth and extract it for filter-feed processing
#
tar -xvzf ../../miscfiles/supreme_rings.tar.gz ./ && cd supreme_rings
cat measure* > measured_supreme_12-28q14d.txt

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
awk '{x=28*-sin($1*0.000000084); print x;}' measured_supreme_n12_m14_s0_e0_pEFGH.dec > measured_supreme_n12_m14_s0_e0_x.dec &
awk '{y=28*-cos($1*0.000000084); print y;}' measured_supreme_n12_m14_s0_e0_pEFGH.dec > measured_supreme_n12_m14_s0_e0_y.dec &
#
awk '{x=28*-sin($1*0.000000084); print x;}' measured_supreme_n14_m14_s0_e0_pEFGH.dec > measured_supreme_n14_m14_s0_e0_x.dec &
awk '{y=28*-cos($1*0.000000084); print y;}' measured_supreme_n14_m14_s0_e0_pEFGH.dec > measured_supreme_n14_m14_s0_e0_y.dec &
#
awk '{x=28*-sin($1*0.000000084); print x;}' measured_supreme_n16_m14_s0_e0_pEFGH.dec > measured_supreme_n16_m14_s0_e0_x.dec &
awk '{y=28*-cos($1*0.000000084); print y;}' measured_supreme_n16_m14_s0_e0_pEFGH.dec > measured_supreme_n16_m14_s0_e0_y.dec &
#
awk '{x=28*-sin($1*0.000000084); print x;}' measured_supreme_n18_m14_s0_e0_pEFGH.dec > measured_supreme_n18_m14_s0_e0_x.dec &
awk '{y=28*-cos($1*0.000000084); print y;}' measured_supreme_n18_m14_s0_e0_pEFGH.dec > measured_supreme_n18_m14_s0_e0_y.dec &
#
awk '{x=28*-sin($1*0.000000084); print x;}' measured_supreme_n20_m14_s0_e0_pEFGH.dec > measured_supreme_n20_m14_s0_e0_x.dec
awk '{y=28*-cos($1*0.000000084); print y;}' measured_supreme_n20_m14_s0_e0_pEFGH.dec > measured_supreme_n20_m14_s0_e0_y.dec &
#
awk '{x=28*-sin($1*0.000000084); print x;}' measured_supreme_n22_m14_s0_e0_pEFGH.dec > measured_supreme_n22_m14_s0_e0_x.dec &
awk '{y=28*-cos($1*0.000000084); print y;}' measured_supreme_n22_m14_s0_e0_pEFGH.dec > measured_supreme_n22_m14_s0_e0_y.dec &
#
awk '{x=28*-sin($1*0.000000084); print x;}' measured_supreme_n24_m14_s0_e0_pEFGH.dec > measured_supreme_n24_m14_s0_e0_x.dec &
awk '{y=28*-cos($1*0.000000084); print y;}' measured_supreme_n24_m14_s0_e0_pEFGH.dec > measured_supreme_n24_m14_s0_e0_y.dec &
#
awk '{x=28*-sin($1*0.000000084); print x;}' measured_supreme_n26_m14_s0_e0_pEFGH.dec > measured_supreme_n26_m14_s0_e0_x.dec &
awk '{y=28*-cos($1*0.000000084); print y;}' measured_supreme_n26_m14_s0_e0_pEFGH.dec > measured_supreme_n26_m14_s0_e0_y.dec &
#
awk '{x=28*-sin($1*0.000000084); print x;}' measured_supreme_n28_m14_s0_e0_pEFGH.dec > measured_supreme_n28_m14_s0_e0_x.dec &
awk '{y=28*-cos($1*0.000000084); print y;}' measured_supreme_n28_m14_s0_e0_pEFGH.dec > measured_supreme_n28_m14_s0_e0_y.dec
#
#
# convert coordinates from dec to float hex ( divided into 4 parts to keep below the 16 cores requirement )
# 2 one-liners :
# for a in $(< measured_supreme_n??_m14_x.dec); do /root/.local/bin/crackNum -f sp $(echo $a) | grep "Hex layout" ; done > ../measured_supreme_n12-28_m14_x.flex &
# for a in $(< measured_supreme_n??_m14_y.dec); do /root/.local/bin/crackNum -f sp $(echo $a) | grep "Hex layout" ; done > ../measured_supreme_n12-28_m14_y.flex &
#
echo"starting the long march"
for a in $(< measured_supreme_n12_m14_s0_e0_x.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > ../measured_supreme_n12_m14_s0_e0_x.flex &
for a in $(< measured_supreme_n12_m14_s0_e0_y.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > ../measured_supreme_n12_m14_s0_e0_y.flex &
#
for a in $(< measured_supreme_n14_m14_s0_e0_x.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > ../measured_supreme_n14_m14_s0_e0_x.flex &
for a in $(< measured_supreme_n14_m14_s0_e0_y.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > ../measured_supreme_n14_m14_s0_e0_y.flex &
#
for a in $(< measured_supreme_n16_m14_s0_e0_x.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > ../measured_supreme_n16_m14_s0_e0_x.flex &
for a in $(< measured_supreme_n16_m14_s0_e0_y.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > ../measured_supreme_n16_m14_s0_e0_y.flex &
#
for a in $(< measured_supreme_n18_m14_s0_e0_x.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > ../measured_supreme_n18_m14_s0_e0_x.flex &
for a in $(< measured_supreme_n18_m14_s0_e0_y.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > ../measured_supreme_n18_m14_s0_e0_y.flex &
#
for a in $(< measured_supreme_n20_m14_s0_e0_x.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > ../measured_supreme_n20_m14_s0_e0_x.flex
for a in $(< measured_supreme_n20_m14_s0_e0_y.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > ../measured_supreme_n20_m14_s0_e0_y.flex &
#
for a in $(< measured_supreme_n22_m14_s0_e0_x.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > ../measured_supreme_n22_m14_s0_e0_x.flex &
for a in $(< measured_supreme_n22_m14_s0_e0_y.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > ../measured_supreme_n22_m14_s0_e0_y.flex &
#
for a in $(< measured_supreme_n24_m14_s0_e0_x.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > ../measured_supreme_n24_m14_s0_e0_x.flex &
for a in $(< measured_supreme_n24_m14_s0_e0_y.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > ../measured_supreme_n24_m14_s0_e0_y.flex &
#
for a in $(< measured_supreme_n26_m14_s0_e0_x.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > ../measured_supreme_n26_m14_s0_e0_x.flex &
for a in $(< measured_supreme_n26_m14_s0_e0_y.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > ../measured_supreme_n26_m14_s0_e0_y.flex &
#
for a in $(< measured_supreme_n28_m14_s0_e0_x.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > ../measured_supreme_n28_m14_s0_e0_x.flex &
for a in $(< measured_supreme_n28_m14_s0_e0_y.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > ../measured_supreme_n28_m14_s0_e0_y.flex
#
echo  "240 secs for tasks to finish"
sleep 240
wc -l ../measured_supreme_n??_m14_s*

# merge results into one file
cat ../measured_supreme_n??_m14_s0_e0_x* > ../measured_supreme_n12-28d14_x.flex
cat ../measured_supreme_n??_m14_s0_e0_y* > ../measured_supreme_n12-28d14_y.flex
#
# convert to hex
grep "Hex layout" ../measured_supreme_n12-28d14_x.flex | tr -d ' ' | tr -d 'Hexlayout:' > ../measured_supreme_n12-28d14_x.fhex
grep "Hex layout" ../measured_supreme_n12-28d14_y.flex | tr -d ' ' | tr -d 'Hexlayout:' > ../measured_supreme_n12-28d14_y.fhex
#
# this measured value conversion also needs at least 16 cores / 16 threads to fully execute 
# oneliner: for a in $(< measured_supreme28q14d.dec); do /root/.local/bin/crackNum -f sp $(echo $a) | grep "Hex layout" ; done > ../n28_m14.flex
#
echo "starting dec to float hex conversion" 
for a in $(< measurements_n12_m14_s0_e0_pEFGH.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a*12) | grep "Hex layout" ; done > ../n12_m14_s0_e0_pEFGH.flex &
for a in $(< measurements_n14_m14_s0_e0_pEFGH.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a*14) | grep "Hex layout" ; done > ../n14_m14_s0_e0_pEFGH.flex &
for a in $(< measurements_n16_m14_s0_e0_pEFGH.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a*16) | grep "Hex layout" ; done > ../n16_m14_s0_e0_pEFGH.flex &
for a in $(< measurements_n18_m14_s0_e0_pEFGH.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a*18) | grep "Hex layout" ; done > ../n18_m14_s0_e0_pEFGH.flex &
for a in $(< measurements_n20_m14_s0_e0_pEFGH.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a*20) | grep "Hex layout" ; done > ../n20_m14_s0_e0_pEFGH.flex &
for a in $(< measurements_n22_m14_s0_e0_pEFGH.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a*22) | grep "Hex layout" ; done > ../n22_m14_s0_e0_pEFGH.flex &
for a in $(< measurements_n24_m14_s0_e0_pEFGH.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a*24) | grep "Hex layout" ; done > ../n24_m14_s0_e0_pEFGH.flex &
for a in $(< measurements_n26_m14_s0_e0_pEFGH.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a*26) | grep "Hex layout" ; done > ../n26_m14_s0_e0_pEFGH.flex &
for a in $(< measurements_n28_m14_s0_e0_pEFGH.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a*28) | grep "Hex layout" ; done > ../n28_m14_s0_e0_pEFGH.flex
#
echo "ready"

echo  "240 secs for tasks to finish"
sleep 240

wc -l ../n??_m14_s0_e0*

# merge results into one file
cat ../n??_m14_s* > ../12-28q14d.flex
cd .. 

# conversion of raw crackNum output to hex in fork
echo "filter to one fHEX file"
grep "Hex layout" 12-28q14d.flex | tr -d ' ' | tr -d 'Hexlayout:' > 12-28q14d.fhex
echo "done"

#
# make z-coordinates based on amount of values
# lending from former coordinates calculations
head -n $(wc -l < 12-28q14d.fhex) square10xqube.fhex > measured_supreme_n12-28d14_d.fhex
head -n $(wc -l < 12-28q14d.fhex) square10zqube.fhex > measured_supreme_n12-28d14_z.fhex
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
paste time.hex points28q14d.hex ndim.hex nsph.hex ndark.hex points12-28q14d.hex version.hex 12-28q14d.fhex measured_supreme_n12-28d14_x.fhex measured_supreme_n12-28d14_y.fhex measured_supreme_n12-28d14_z.fhex displace12-28q14d.hex displace12-28q14d.hex displace12-28q14d.hex displace12-28q14d.hex displace12-28q14d.hex measured_supreme_n12-28_m14_x.fhex measured_supreme_n12-28d14_z.fhex > tipsy-12-28q14d.hex
# convert float hex string data as a bin file
xxd -r -p tipsy-12-28q14d.hex tipsy-12-28q14d.bin
# aaaand convert to little indian
hexdump -v -e '1/4 "%08x"' -e '"\n"' tipsy-12-28q14d.bin | xxd -r -p >tipsy-12-28q14d_hexdump.bin
