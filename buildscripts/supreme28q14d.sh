#!/bin/bash
# this script fetches and converts the 28q14d sycamore results
# and places those values in a tipsy AdS/CFT-style tincan graph 
# a regular PC with 16 cores/threads will take ~24 hours to complete
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
wget https://datadryad.org/stash/downloads/file_stream/693522
tar -xvzf 693522 && cd n28_m14
cat measure* > measured_supreme_28q14d.txt

# the following scripts splices the workload into 10 separate 2-thread workloads. scale accordingly.
# oneliner is: while read number; do echo $((2#$number)) ; done < measured_supreme_28q14d.txt > measured_supreme_28q14d.dec
#
# convert measured binary result to decimal for conversion and placement
# 
while read number; do echo $((2#$number)) ; done < measurements_n28_m14_s0_e0_pEFGH.txt > measured_supreme_n28_m14_s0_e0_pEFGH.dec &
while read number; do echo $((2#$number)) ; done < measurements_n28_m14_s0_e6_pEFGH.txt > measured_supreme_n28_m14_s0_e6_pEFGH.dec &
while read number; do echo $((2#$number)) ; done < measurements_n28_m14_s1_e0_pEFGH.txt > measured_supreme_n28_m14_s1_e0_pEFGH.dec &
while read number; do echo $((2#$number)) ; done < measurements_n28_m14_s1_e6_pEFGH.txt > measured_supreme_n28_m14_s1_e6_pEFGH.dec &
while read number; do echo $((2#$number)) ; done < measurements_n28_m14_s2_e0_pEFGH.txt > measured_supreme_n28_m14_s2_e0_pEFGH.dec &
while read number; do echo $((2#$number)) ; done < measurements_n28_m14_s2_e6_pEFGH.txt > measured_supreme_n28_m14_s2_e6_pEFGH.dec &
while read number; do echo $((2#$number)) ; done < measurements_n28_m14_s3_e0_pEFGH.txt > measured_supreme_n28_m14_s3_e0_pEFGH.dec &
while read number; do echo $((2#$number)) ; done < measurements_n28_m14_s3_e6_pEFGH.txt > measured_supreme_n28_m14_s3_e6_pEFGH.dec &
while read number; do echo $((2#$number)) ; done < measurements_n28_m14_s4_e0_pEFGH.txt > measured_supreme_n28_m14_s4_e0_pEFGH.dec &
while read number; do echo $((2#$number)) ; done < measurements_n28_m14_s4_e6_pEFGH.txt > measured_supreme_n28_m14_s4_e6_pEFGH.dec
while read number; do echo $((2#$number)) ; done < measurements_n28_m14_s5_e0_pEFGH.txt > measured_supreme_n28_m14_s5_e0_pEFGH.dec &
while read number; do echo $((2#$number)) ; done < measurements_n28_m14_s5_e6_pEFGH.txt > measured_supreme_n28_m14_s5_e6_pEFGH.dec &
while read number; do echo $((2#$number)) ; done < measurements_n28_m14_s6_e0_pEFGH.txt > measured_supreme_n28_m14_s6_e0_pEFGH.dec &
while read number; do echo $((2#$number)) ; done < measurements_n28_m14_s6_e6_pEFGH.txt > measured_supreme_n28_m14_s6_e6_pEFGH.dec &
while read number; do echo $((2#$number)) ; done < measurements_n28_m14_s7_e0_pEFGH.txt > measured_supreme_n28_m14_s7_e0_pEFGH.dec &
while read number; do echo $((2#$number)) ; done < measurements_n28_m14_s7_e6_pEFGH.txt > measured_supreme_n28_m14_s7_e6_pEFGH.dec &
while read number; do echo $((2#$number)) ; done < measurements_n28_m14_s8_e0_pEFGH.txt > measured_supreme_n28_m14_s8_e0_pEFGH.dec &
while read number; do echo $((2#$number)) ; done < measurements_n28_m14_s8_e6_pEFGH.txt > measured_supreme_n28_m14_s8_e6_pEFGH.dec &
while read number; do echo $((2#$number)) ; done < measurements_n28_m14_s9_e0_pEFGH.txt > measured_supreme_n28_m14_s9_e0_pEFGH.dec &
while read number; do echo $((2#$number)) ; done < measurements_n28_m14_s9_e6_pEFGH.txt > measured_supreme_n28_m14_s9_e6_pEFGH.dec
# while read number; do echo $((2#$number)) ; done < measured_supreme_28q14d.txt > measured_supreme_28q14d.dec
echo "binary to decimal conversion done"

# calculate decimal x-y coordinates for placement
# one-liners:
# awk '{x=28*-sin($1*0.000000084); print x;}' measured_supreme_28q14d.dec > measured_supreme_28q14d_x.dec
# awk '{y=28*-cos($1*0.000000084); print y;}' measured_supreme_28q14d.dec > measured_supreme_28q14d_y.dec
#
# seprate in 4 x/y blocks: again a 10+ threads split
#
echo "starting cos/sin x/y calculations"
awk '{x=28*-sin($1*0.000000084); print x;}' measured_supreme_n28_m14_s0_e0_pEFGH.dec > measured_supreme_n28_m14_s0_e0_x.dec &
awk '{y=28*-cos($1*0.000000084); print y;}' measured_supreme_n28_m14_s0_e0_pEFGH.dec > measured_supreme_n28_m14_s0_e0_y.dec &
#
awk '{x=28*-sin($1*0.000000084); print x;}' measured_supreme_n28_m14_s0_e6_pEFGH.dec > measured_supreme_n28_m14_s0_e6_x.dec &
awk '{y=28*-cos($1*0.000000084); print y;}' measured_supreme_n28_m14_s0_e6_pEFGH.dec > measured_supreme_n28_m14_s0_e6_y.dec &
#
awk '{x=28*-sin($1*0.000000084); print x;}' measured_supreme_n28_m14_s1_e0_pEFGH.dec > measured_supreme_n28_m14_s1_e0_x.dec &
awk '{y=28*-cos($1*0.000000084); print y;}' measured_supreme_n28_m14_s1_e0_pEFGH.dec > measured_supreme_n28_m14_s1_e0_y.dec &
#
awk '{x=28*-sin($1*0.000000084); print x;}' measured_supreme_n28_m14_s1_e6_pEFGH.dec > measured_supreme_n28_m14_s1_e6_x.dec &
awk '{y=28*-cos($1*0.000000084); print y;}' measured_supreme_n28_m14_s1_e6_pEFGH.dec > measured_supreme_n28_m14_s1_e6_y.dec &
#
awk '{x=28*-sin($1*0.000000084); print x;}' measured_supreme_n28_m14_s2_e0_pEFGH.dec > measured_supreme_n28_m14_s2_e0_x.dec &
awk '{y=28*-cos($1*0.000000084); print y;}' measured_supreme_n28_m14_s2_e0_pEFGH.dec > measured_supreme_n28_m14_s2_e0_y.dec
#
awk '{x=28*-sin($1*0.000000084); print x;}' measured_supreme_n28_m14_s2_e6_pEFGH.dec > measured_supreme_n28_m14_s2_e6_x.dec &
awk '{y=28*-cos($1*0.000000084); print y;}' measured_supreme_n28_m14_s2_e6_pEFGH.dec > measured_supreme_n28_m14_s2_e6_y.dec &
#
awk '{x=28*-sin($1*0.000000084); print x;}' measured_supreme_n28_m14_s3_e0_pEFGH.dec > measured_supreme_n28_m14_s3_e0_x.dec &
awk '{y=28*-cos($1*0.000000084); print y;}' measured_supreme_n28_m14_s3_e0_pEFGH.dec > measured_supreme_n28_m14_s3_e0_y.dec &
#
awk '{x=28*-sin($1*0.000000084); print x;}' measured_supreme_n28_m14_s3_e6_pEFGH.dec > measured_supreme_n28_m14_s3_e6_x.dec &
awk '{y=28*-cos($1*0.000000084); print y;}' measured_supreme_n28_m14_s3_e6_pEFGH.dec > measured_supreme_n28_m14_s3_e6_y.dec &
#
awk '{x=28*-sin($1*0.000000084); print x;}' measured_supreme_n28_m14_s4_e0_pEFGH.dec > measured_supreme_n28_m14_s4_e0_x.dec &
awk '{y=28*-cos($1*0.000000084); print y;}' measured_supreme_n28_m14_s4_e0_pEFGH.dec > measured_supreme_n28_m14_s4_e0_y.dec &
#
awk '{x=28*-sin($1*0.000000084); print x;}' measured_supreme_n28_m14_s4_e6_pEFGH.dec > measured_supreme_n28_m14_s4_e6_x.dec &
awk '{y=28*-cos($1*0.000000084); print y;}' measured_supreme_n28_m14_s4_e6_pEFGH.dec > measured_supreme_n28_m14_s4_e6_y.dec
#
awk '{x=28*-sin($1*0.000000084); print x;}' measured_supreme_n28_m14_s5_e0_pEFGH.dec > measured_supreme_n28_m14_s5_e0_x.dec &
awk '{y=28*-cos($1*0.000000084); print y;}' measured_supreme_n28_m14_s5_e0_pEFGH.dec > measured_supreme_n28_m14_s5_e0_y.dec &
#
awk '{x=28*-sin($1*0.000000084); print x;}' measured_supreme_n28_m14_s5_e6_pEFGH.dec > measured_supreme_n28_m14_s5_e6_x.dec &
awk '{y=28*-cos($1*0.000000084); print y;}' measured_supreme_n28_m14_s5_e6_pEFGH.dec > measured_supreme_n28_m14_s5_e6_y.dec &
#
awk '{x=28*-sin($1*0.000000084); print x;}' measured_supreme_n28_m14_s6_e0_pEFGH.dec > measured_supreme_n28_m14_s6_e0_x.dec &
awk '{y=28*-cos($1*0.000000084); print y;}' measured_supreme_n28_m14_s6_e0_pEFGH.dec > measured_supreme_n28_m14_s6_e0_y.dec &
#
awk '{x=28*-sin($1*0.000000084); print x;}' measured_supreme_n28_m14_s6_e6_pEFGH.dec > measured_supreme_n28_m14_s6_e6_x.dec &
awk '{y=28*-cos($1*0.000000084); print y;}' measured_supreme_n28_m14_s6_e6_pEFGH.dec > measured_supreme_n28_m14_s6_e6_y.dec &
#
awk '{x=28*-sin($1*0.000000084); print x;}' measured_supreme_n28_m14_s7_e0_pEFGH.dec > measured_supreme_n28_m14_s7_e0_x.dec &
awk '{y=28*-cos($1*0.000000084); print y;}' measured_supreme_n28_m14_s7_e0_pEFGH.dec > measured_supreme_n28_m14_s7_e0_y.dec
#
awk '{x=28*-sin($1*0.000000084); print x;}' measured_supreme_n28_m14_s7_e6_pEFGH.dec > measured_supreme_n28_m14_s7_e6_x.dec &
awk '{y=28*-cos($1*0.000000084); print y;}' measured_supreme_n28_m14_s7_e6_pEFGH.dec > measured_supreme_n28_m14_s7_e6_y.dec &
#
awk '{x=28*-sin($1*0.000000084); print x;}' measured_supreme_n28_m14_s8_e0_pEFGH.dec > measured_supreme_n28_m14_s8_e0_x.dec &
awk '{y=28*-cos($1*0.000000084); print y;}' measured_supreme_n28_m14_s8_e0_pEFGH.dec > measured_supreme_n28_m14_s8_e0_y.dec &
#
awk '{x=28*-sin($1*0.000000084); print x;}' measured_supreme_n28_m14_s8_e6_pEFGH.dec > measured_supreme_n28_m14_s8_e6_x.dec &
awk '{y=28*-cos($1*0.000000084); print y;}' measured_supreme_n28_m14_s8_e6_pEFGH.dec > measured_supreme_n28_m14_s8_e6_y.dec &
#
awk '{x=28*-sin($1*0.000000084); print x;}' measured_supreme_n28_m14_s9_e0_pEFGH.dec > measured_supreme_n28_m14_s9_e0_x.dec &
awk '{y=28*-cos($1*0.000000084); print y;}' measured_supreme_n28_m14_s9_e0_pEFGH.dec > measured_supreme_n28_m14_s9_e0_y.dec &
#
awk '{x=28*-sin($1*0.000000084); print x;}' measured_supreme_n28_m14_s9_e6_pEFGH.dec > measured_supreme_n28_m14_s9_e6_x.dec &
awk '{y=28*-cos($1*0.000000084); print y;}' measured_supreme_n28_m14_s9_e6_pEFGH.dec > measured_supreme_n28_m14_s9_e6_y.dec
#
echo "wait for all cos/sin tasks to finish"
sleep 20
#
# convert coordinates from dec to float hex ( divided into 4 parts to keep below the 16 cores requirement )
# 2 one-liners :
# for a in $(< measured_supreme_n28_m14_x.dec); do /root/.local/bin/crackNum -f sp $(echo $a) | grep "Hex layout" ; done > ../measured_supreme_n28_m14_x.flex &
# for a in $(< measured_supreme_n28_m14_y.dec); do /root/.local/bin/crackNum -f sp $(echo $a) | grep "Hex layout" ; done > ../measured_supreme_n28_m14_y.flex &
#
echo"starting the long march"
for a in $(< measured_supreme_n28_m14_s0_e0_x.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > ../measured_supreme_n28_m14_s0_e0_x.flex &
for a in $(< measured_supreme_n28_m14_s0_e0_y.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > ../measured_supreme_n28_m14_s0_e0_y.flex &
#
for a in $(< measured_supreme_n28_m14_s0_e6_x.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > ../measured_supreme_n28_m14_s0_e6_x.flex &
for a in $(< measured_supreme_n28_m14_s0_e6_y.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > ../measured_supreme_n28_m14_s0_e6_y.flex &
#
for a in $(< measured_supreme_n28_m14_s1_e0_x.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > ../measured_supreme_n28_m14_s1_e0_x.flex &
for a in $(< measured_supreme_n28_m14_s1_e0_y.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > ../measured_supreme_n28_m14_s1_e0_y.flex &
#
for a in $(< measured_supreme_n28_m14_s1_e6_x.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > ../measured_supreme_n28_m14_s1_e6_x.flex &
for a in $(< measured_supreme_n28_m14_s1_e6_y.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > ../measured_supreme_n28_m14_s1_e6_y.flex &
#
for a in $(< measured_supreme_n28_m14_s2_e0_x.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > ../measured_supreme_n28_m14_s2_e0_x.flex &
for a in $(< measured_supreme_n28_m14_s2_e0_y.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > ../measured_supreme_n28_m14_s2_e0_y.flex
#
echo " 25% "
#
for a in $(< measured_supreme_n28_m14_s2_e6_x.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > ../measured_supreme_n28_m14_s2_e6_x.flex &
for a in $(< measured_supreme_n28_m14_s2_e6_y.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > ../measured_supreme_n28_m14_s2_e6_y.flex &
#
for a in $(< measured_supreme_n28_m14_s3_e0_x.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > ../measured_supreme_n28_m14_s3_e0_x.flex &
for a in $(< measured_supreme_n28_m14_s3_e0_y.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > ../measured_supreme_n28_m14_s3_e0_y.flex &
#
for a in $(< measured_supreme_n28_m14_s3_e6_x.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > ../measured_supreme_n28_m14_s3_e6_x.flex &
for a in $(< measured_supreme_n28_m14_s3_e6_y.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > ../measured_supreme_n28_m14_s3_e6_y.flex &
#
for a in $(< measured_supreme_n28_m14_s4_e0_x.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > ../measured_supreme_n28_m14_s4_e0_x.flex &
for a in $(< measured_supreme_n28_m14_s4_e0_y.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > ../measured_supreme_n28_m14_s4_e0_y.flex &
#
for a in $(< measured_supreme_n28_m14_s4_e6_x.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > ../measured_supreme_n28_m14_s4_e6_x.flex &
for a in $(< measured_supreme_n28_m14_s4_e6_y.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > ../measured_supreme_n28_m14_s4_e6_y.flex

echo "halfway coordinate transformation"
#
for a in $(< measured_supreme_n28_m14_s5_e0_x.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > ../measured_supreme_n28_m14_s5_e0_x.flex &
for a in $(< measured_supreme_n28_m14_s5_e0_y.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > ../measured_supreme_n28_m14_s5_e0_y.flex &
#
for a in $(< measured_supreme_n28_m14_s5_e6_x.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > ../measured_supreme_n28_m14_s5_e6_x.flex &
for a in $(< measured_supreme_n28_m14_s5_e6_y.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > ../measured_supreme_n28_m14_s5_e6_y.flex &
#
for a in $(< measured_supreme_n28_m14_s6_e0_x.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > ../measured_supreme_n28_m14_s6_e0_x.flex &
for a in $(< measured_supreme_n28_m14_s6_e0_y.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > ../measured_supreme_n28_m14_s6_e0_y.flex &
#
for a in $(< measured_supreme_n28_m14_s6_e6_x.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > ../measured_supreme_n28_m14_s6_e6_x.flex &
for a in $(< measured_supreme_n28_m14_s6_e6_y.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > ../measured_supreme_n28_m14_s6_e6_y.flex &
#
for a in $(< measured_supreme_n28_m14_s7_e0_x.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > ../measured_supreme_n28_m14_s7_e0_x.flex &
for a in $(< measured_supreme_n28_m14_s7_e0_y.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > ../measured_supreme_n28_m14_s7_e0_y.flex
#
echo " 75% "
#
for a in $(< measured_supreme_n28_m14_s7_e6_x.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > ../measured_supreme_n28_m14_s7_e6_x.flex &
for a in $(< measured_supreme_n28_m14_s7_e6_y.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > ../measured_supreme_n28_m14_s7_e6_y.flex &
#
for a in $(< measured_supreme_n28_m14_s8_e0_x.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > ../measured_supreme_n28_m14_s8_e0_x.flex &
for a in $(< measured_supreme_n28_m14_s8_e0_y.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > ../measured_supreme_n28_m14_s8_e0_y.flex &
#
for a in $(< measured_supreme_n28_m14_s8_e6_x.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > ../measured_supreme_n28_m14_s8_e6_x.flex &
for a in $(< measured_supreme_n28_m14_s8_e6_y.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > ../measured_supreme_n28_m14_s8_e6_y.flex &
#
for a in $(< measured_supreme_n28_m14_s9_e0_x.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > ../measured_supreme_n28_m14_s9_e0_x.flex &
for a in $(< measured_supreme_n28_m14_s9_e0_y.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > ../measured_supreme_n28_m14_s9_e0_y.flex &
#
for a in $(< measured_supreme_n28_m14_s9_e6_x.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > ../measured_supreme_n28_m14_s9_e6_x.flex &
for a in $(< measured_supreme_n28_m14_s9_e6_y.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > ../measured_supreme_n28_m14_s9_e6_y.flex
#
echo  "240 secs for tasks to finish"
sleep 240

wc -l ../measured_supreme_n28_m14_s*

# merge results into one file
cat ../measured_supreme_n28_m14_s?_e?_x* > ../measured_supreme_n28d14_x.flex
cat ../measured_supreme_n28_m14_s?_e?_y* > ../measured_supreme_n28d14_y.flex
#
# convert to hex
grep "Hex layout" ../measured_supreme_n28d14_x.flex | tr -d ' ' | tr -d 'Hexlayout:' > ../measured_supreme_n28d14_x.fhex
grep "Hex layout" ../measured_supreme_n28d14_y.flex | tr -d ' ' | tr -d 'Hexlayout:' > ../measured_supreme_n28d14_y.fhex
#
# this also needs at least 16 cores / 16 threads to fully execute 
# oneliner: for a in $(< measured_supreme28q14d.dec); do /root/.local/bin/crackNum -f sp $(echo $a) | grep "Hex layout" ; done > ../n28_m14.flex
#
echo "starting dec to float hex conversion" 
for a in $(< measurements_n28_m14_s0_e0_pEFGH.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > ../n28_m14_s0_e0_pEFGH.flex &
for a in $(< measurements_n28_m14_s0_e6_pEFGH.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > ../n28_m14_s0_e6_pEFGH.flex &
for a in $(< measurements_n28_m14_s1_e0_pEFGH.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > ../n28_m14_s1_e0_pEFGH.flex &
for a in $(< measurements_n28_m14_s1_e6_pEFGH.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > ../n28_m14_s1_e6_pEFGH.flex &
for a in $(< measurements_n28_m14_s2_e0_pEFGH.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > ../n28_m14_s2_e0_pEFGH.flex &
for a in $(< measurements_n28_m14_s2_e6_pEFGH.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > ../n28_m14_s2_e6_pEFGH.flex &
for a in $(< measurements_n28_m14_s3_e0_pEFGH.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > ../n28_m14_s3_e0_pEFGH.flex &
for a in $(< measurements_n28_m14_s3_e6_pEFGH.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > ../n28_m14_s3_e6_pEFGH.flex &
for a in $(< measurements_n28_m14_s4_e0_pEFGH.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > ../n28_m14_s4_e0_pEFGH.flex &
for a in $(< measurements_n28_m14_s4_e6_pEFGH.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > ../n28_m14_s4_e6_pEFGH.flex
#
echo "halfway value conversion"
#
for a in $(< measurements_n28_m14_s5_e0_pEFGH.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > ../n28_m14_s5_e0_pEFGH.flex &
for a in $(< measurements_n28_m14_s5_e6_pEFGH.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > ../n28_m14_s5_e6_pEFGH.flex &
for a in $(< measurements_n28_m14_s6_e0_pEFGH.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > ../n28_m14_s6_e0_pEFGH.flex &
for a in $(< measurements_n28_m14_s6_e6_pEFGH.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > ../n28_m14_s6_e6_pEFGH.flex &
for a in $(< measurements_n28_m14_s7_e0_pEFGH.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > ../n28_m14_s7_e0_pEFGH.flex &
for a in $(< measurements_n28_m14_s7_e6_pEFGH.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > ../n28_m14_s7_e6_pEFGH.flex &
for a in $(< measurements_n28_m14_s8_e0_pEFGH.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > ../n28_m14_s8_e0_pEFGH.flex &
for a in $(< measurements_n28_m14_s8_e0_pEFGH.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > ../n28_m14_s8_e6_pEFGH.flex &
for a in $(< measurements_n28_m14_s9_e0_pEFGH.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > ../n28_m14_s9_e0_pEFGH.flex &
for a in $(< measurements_n28_m14_s9_e6_pEFGH.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > ../n28_m14_s9_e6_pEFGH.flex
echo "ready"

echo  "240 secs for tasks to finish"
sleep 240

wc -l ../n28_m14_s*

# merge results into one file
cat ../n28_m14_s* > ../28q14d.flex
cd .. 
# rm -R /n28_m14

# conversion of raw crackNum output to hex in fork
echo "filter to one fHEX file"
grep "Hex layout" 28q14d.flex | tr -d ' ' | tr -d 'Hexlayout:' > 28q14d.fhex
echo "done"

#
# make z-coordinates based on amount of values
# lending from former coordinates calculations
head -n $(wc -l < 28q14d.fhex) square10xqube.fhex > measured_supreme_n28d14_d.fhex
head -n $(wc -l < 28q14d.fhex) square10zqube.fhex > measured_supreme_n28d14_z.fhex

# create ID and void displacement vectors
yes 02 | head -n $(wc -l < 28q14d.fhex) > id28q14d.fhex
yes 00000000 | head -n $(wc -l < 28q14d.fhex) > displace28q14d.fhex
#
#
echo $(wc -l < 28q14d.fhex ) > points28q14d.dec
printf '%08X\n' $(< points28q14d.dec) > points28q14d.hex
#
# assemble/weave hex, convert to bin
paste time.hex points28q14d.hex ndim.hex nsph.hex ndark.hex points28q14d.hex version.hex 28q14d.fhex measured_supreme_n28d14_x.fhex measured_supreme_n28d14_y.fhex measured_supreme_n28d14_z.fhex displace28q14d.hex displace28q14d.hex displace28q14d.hex displace28q14d.hex displace28q14d.hex measured_supreme_n28_m14_x.fhex measured_supreme_n28d14_z.fhex > tipsy-28q14d.hex
# convert float hex string data as a bin file
xxd -r -p tipsy-28q14d.hex tipsy-28q14d.bin
# aaaand convert to little indian
hexdump -v -e '1/4 "%08x"' -e '"\n"' tipsy-28q14d.bin | xxd -r -p >tipsy-28q14d_hexdump.bin
