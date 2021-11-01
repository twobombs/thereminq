#!/bin/bash
# this script fetches and converts the 28q14d sycamore results
# and places those values in a tipsy AdS/CFT-style tincan graph 
# a regular PC with 20 cores/threads will take ~24 hours to complete
# results of this calculation will be placed in the qracknet repo
# 
# we fetch the sycamore 28 qbit over 14 depth and extract it for filter-feed processing
#
wget https://datadryad.org/stash/downloads/file_stream/693522
tar -xvzf 693522 && cd n28_m14
cat measure* > measured_supreme_28q14d.txt

# the following scripts splices the workload into 20 separate 2-thread workloads. scale accordingly.
# oneliner is: while read number; do echo $((2#$number)) ; done < measured_supreme_28q14d.txt > measured_supreme_28q14d.dec
#
# convert measured binary result to decimal for conversion and placement
# 
while read number; do echo $((2#$number)) ; done < measurements_n28_m14_s0_e0_pEFGH.txt > measurements_n28_m14_s0_e0_pEFGH.dec &
while read number; do echo $((2#$number)) ; done < measurements_n28_m14_s0_e6_pEFGH.txt > measurements_n28_m14_s0_e6_pEFGH.dec &
while read number; do echo $((2#$number)) ; done < measurements_n28_m14_s1_e0_pEFGH.txt > measurements_n28_m14_s1_e0_pEFGH.dec &
while read number; do echo $((2#$number)) ; done < measurements_n28_m14_s1_e6_pEFGH.txt > measurements_n28_m14_s1_e6_pEFGH.dec &
while read number; do echo $((2#$number)) ; done < measurements_n28_m14_s2_e0_pEFGH.txt > measurements_n28_m14_s2_e0_pEFGH.dec &
while read number; do echo $((2#$number)) ; done < measurements_n28_m14_s2_e6_pEFGH.txt > measurements_n28_m14_s2_e6_pEFGH.dec &
while read number; do echo $((2#$number)) ; done < measurements_n28_m14_s3_e0_pEFGH.txt > measurements_n28_m14_s3_e0_pEFGH.dec &
while read number; do echo $((2#$number)) ; done < measurements_n28_m14_s3_e6_pEFGH.txt > measurements_n28_m14_s3_e6_pEFGH.dec &
while read number; do echo $((2#$number)) ; done < measurements_n28_m14_s4_e0_pEFGH.txt > measurements_n28_m14_s4_e0_pEFGH.dec &
while read number; do echo $((2#$number)) ; done < measurements_n28_m14_s4_e6_pEFGH.txt > measurements_n28_m14_s4_e6_pEFGH.dec &
while read number; do echo $((2#$number)) ; done < measurements_n28_m14_s5_e0_pEFGH.txt > measurements_n28_m14_s5_e0_pEFGH.dec &
while read number; do echo $((2#$number)) ; done < measurements_n28_m14_s5_e6_pEFGH.txt > measurements_n28_m14_s5_e6_pEFGH.dec &
while read number; do echo $((2#$number)) ; done < measurements_n28_m14_s6_e0_pEFGH.txt > measurements_n28_m14_s6_e0_pEFGH.dec &
while read number; do echo $((2#$number)) ; done < measurements_n28_m14_s6_e6_pEFGH.txt > measurements_n28_m14_s6_e6_pEFGH.dec &
while read number; do echo $((2#$number)) ; done < measurements_n28_m14_s7_e0_pEFGH.txt > measurements_n28_m14_s7_e0_pEFGH.dec &
while read number; do echo $((2#$number)) ; done < measurements_n28_m14_s7_e6_pEFGH.txt > measurements_n28_m14_s7_e6_pEFGH.dec &
while read number; do echo $((2#$number)) ; done < measurements_n28_m14_s8_e0_pEFGH.txt > measurements_n28_m14_s8_e0_pEFGH.dec &
while read number; do echo $((2#$number)) ; done < measurements_n28_m14_s8_e6_pEFGH.txt > measurements_n28_m14_s8_e6_pEFGH.dec &
while read number; do echo $((2#$number)) ; done < measurements_n28_m14_s9_e0_pEFGH.txt > measurements_n28_m14_s9_e0_pEFGH.dec &
while read number; do echo $((2#$number)) ; done < measurements_n28_m14_s9_e6_pEFGH.txt > measurements_n28_m14_s9_e6_pEFGH.dec
# while read number; do echo $((2#$number)) ; done < measured_supreme_28q14d.txt > measured_supreme_28q14d.dec
echo "binary to decimal conversion done"

# calculate decimal x-y coordinates for placement
# one-liners:
# awk '{x=28*-sin($1*0.000000084); print x;}' measured_supreme_28q14d.dec > measured_supreme_28q14d_x.dec
# awk '{y=28*-cos($1*0.000000084); print y;}' measured_supreme_28q14d.dec > measured_supreme_28q14d_y.dec
#
# seprate in 2 x/y blocks: again a 40+ threads split
#
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
echo "wait for all tasks to finish"
sleep 120
#
# convert coordinates from dec to float hex ( divided into 2 parts to keep below the 20 cores requirement )
# 2 one-liners :
# for a in $(< measured_supreme_n28_m14_x.dec); do /root/.local/bin/crackNum -f sp $(echo $a) | grep "Hex layout" ; done > ../measured_supreme_n28_m14_x.flex &
# for a in $(< measured_supreme_n28_m14_y.dec); do /root/.local/bin/crackNum -f sp $(echo $a) | grep "Hex layout" ; done > ../measured_supreme_n28_m14_y.flex &
#
for a in $(< measured_supreme_n28_m14_s0_e0_x.dec); do /root/.local/bin/crackNum -f sp $(echo $a) | grep "Hex layout" ; done > ../measured_supreme_n28_m14_s0_e0_x.flex &
for a in $(< measured_supreme_n28_m14_s0_e0_y.dec); do /root/.local/bin/crackNum -f sp $(echo $a) | grep "Hex layout" ; done > ../measured_supreme_n28_m14_s0_e0_y.flex &
#
for a in $(< measured_supreme_n28_m14_s0_e6_x.dec); do /root/.local/bin/crackNum -f sp $(echo $a) | grep "Hex layout" ; done > ../measured_supreme_n28_m14_s0_e6_x.flex &
for a in $(< measured_supreme_n28_m14_s0_e6_y.dec); do /root/.local/bin/crackNum -f sp $(echo $a) | grep "Hex layout" ; done > ../measured_supreme_n28_m14_s0_e6_y.flex &
#
for a in $(< measured_supreme_n28_m14_s1_e0_x.dec); do /root/.local/bin/crackNum -f sp $(echo $a) | grep "Hex layout" ; done > ../measured_supreme_n28_m14_s1_e0_x.flex &
for a in $(< measured_supreme_n28_m14_s1_e0_y.dec); do /root/.local/bin/crackNum -f sp $(echo $a) | grep "Hex layout" ; done > ../measured_supreme_n28_m14_s1_e0_y.flex &
#
for a in $(< measured_supreme_n28_m14_s1_e6_x.dec); do /root/.local/bin/crackNum -f sp $(echo $a) | grep "Hex layout" ; done > ../measured_supreme_n28_m14_s1_e6_x.flex &
for a in $(< measured_supreme_n28_m14_s1_e6_y.dec); do /root/.local/bin/crackNum -f sp $(echo $a) | grep "Hex layout" ; done > ../measured_supreme_n28_m14_s1_e6_y.flex &
#
for a in $(< measured_supreme_n28_m14_s2_e0_x.dec); do /root/.local/bin/crackNum -f sp $(echo $a) | grep "Hex layout" ; done > ../measured_supreme_n28_m14_s2_e0_x.flex &
for a in $(< measured_supreme_n28_m14_s2_e0_y.dec); do /root/.local/bin/crackNum -f sp $(echo $a) | grep "Hex layout" ; done > ../measured_supreme_n28_m14_s2_e0_y.flex
#
echo " 25% "
#
for a in $(< measured_supreme_n28_m14_s2_e6_x.dec); do /root/.local/bin/crackNum -f sp $(echo $a) | grep "Hex layout" ; done > ../measured_supreme_n28_m14_s2_e6_x.flex &
for a in $(< measured_supreme_n28_m14_s2_e6_y.dec); do /root/.local/bin/crackNum -f sp $(echo $a) | grep "Hex layout" ; done > ../measured_supreme_n28_m14_s2_e6_y.flex &
#
for a in $(< measured_supreme_n28_m14_s3_e0_x.dec); do /root/.local/bin/crackNum -f sp $(echo $a) | grep "Hex layout" ; done > ../measured_supreme_n28_m14_s3_e0_x.flex &
for a in $(< measured_supreme_n28_m14_s3_e0_y.dec); do /root/.local/bin/crackNum -f sp $(echo $a) | grep "Hex layout" ; done > ../measured_supreme_n28_m14_s3_e0_y.flex &
#
for a in $(< measured_supreme_n28_m14_s3_e6_x.dec); do /root/.local/bin/crackNum -f sp $(echo $a) | grep "Hex layout" ; done > ../measured_supreme_n28_m14_s3_e6_x.flex &
for a in $(< measured_supreme_n28_m14_s3_e6_y.dec); do /root/.local/bin/crackNum -f sp $(echo $a) | grep "Hex layout" ; done > ../measured_supreme_n28_m14_s3_e6_y.flex &
#
for a in $(< measured_supreme_n28_m14_s4_e0_x.dec); do /root/.local/bin/crackNum -f sp $(echo $a) | grep "Hex layout" ; done > ../measured_supreme_n28_m14_s4_e0_x.flex &
for a in $(< measured_supreme_n28_m14_s4_e0_y.dec); do /root/.local/bin/crackNum -f sp $(echo $a) | grep "Hex layout" ; done > ../measured_supreme_n28_m14_s4_e0_y.flex &
#
for a in $(< measured_supreme_n28_m14_s4_e6_x.dec); do /root/.local/bin/crackNum -f sp $(echo $a) | grep "Hex layout" ; done > ../measured_supreme_n28_m14_s4_e6_x.flex &
for a in $(< measured_supreme_n28_m14_s4_e6_y.dec); do /root/.local/bin/crackNum -f sp $(echo $a) | grep "Hex layout" ; done > ../measured_supreme_n28_m14_s4_e6_y.flex

echo "halfway coordinate transformation"
#
for a in $(< measured_supreme_n28_m14_s5_e0_x.dec); do /root/.local/bin/crackNum -f sp $(echo $a) | grep "Hex layout" ; done > ../measured_supreme_n28_m14_s5_e0_x.flex &
for a in $(< measured_supreme_n28_m14_s5_e0_y.dec); do /root/.local/bin/crackNum -f sp $(echo $a) | grep "Hex layout" ; done > ../measured_supreme_n28_m14_s5_e0_y.flex &
#
for a in $(< measured_supreme_n28_m14_s5_e6_x.dec); do /root/.local/bin/crackNum -f sp $(echo $a) | grep "Hex layout" ; done > ../measured_supreme_n28_m14_s5_e6_x.flex &
for a in $(< measured_supreme_n28_m14_s5_e6_y.dec); do /root/.local/bin/crackNum -f sp $(echo $a) | grep "Hex layout" ; done > ../measured_supreme_n28_m14_s5_e6_y.flex &
#
for a in $(< measured_supreme_n28_m14_s6_e0_x.dec); do /root/.local/bin/crackNum -f sp $(echo $a) | grep "Hex layout" ; done > ../measured_supreme_n28_m14_s6_e0_x.flex &
for a in $(< measured_supreme_n28_m14_s6_e0_y.dec); do /root/.local/bin/crackNum -f sp $(echo $a) | grep "Hex layout" ; done > ../measured_supreme_n28_m14_s6_e0_y.flex &
#
for a in $(< measured_supreme_n28_m14_s6_e6_x.dec); do /root/.local/bin/crackNum -f sp $(echo $a) | grep "Hex layout" ; done > ../measured_supreme_n28_m14_s6_e6_x.flex &
for a in $(< measured_supreme_n28_m14_s6_e6_y.dec); do /root/.local/bin/crackNum -f sp $(echo $a) | grep "Hex layout" ; done > ../measured_supreme_n28_m14_s6_e6_y.flex &
#
for a in $(< measured_supreme_n28_m14_s7_e0_x.dec); do /root/.local/bin/crackNum -f sp $(echo $a) | grep "Hex layout" ; done > ../measured_supreme_n28_m14_s7_e0_x.flex &
for a in $(< measured_supreme_n28_m14_s7_e0_y.dec); do /root/.local/bin/crackNum -f sp $(echo $a) | grep "Hex layout" ; done > ../measured_supreme_n28_m14_s7_e0_y.flex
#
echo " 75% "
#
for a in $(< measured_supreme_n28_m14_s7_e6_x.dec); do /root/.local/bin/crackNum -f sp $(echo $a) | grep "Hex layout" ; done > ../measured_supreme_n28_m14_s7_e6_x.flex &
for a in $(< measured_supreme_n28_m14_s7_e6_y.dec); do /root/.local/bin/crackNum -f sp $(echo $a) | grep "Hex layout" ; done > ../measured_supreme_n28_m14_s7_e6_y.flex &
#
for a in $(< measured_supreme_n28_m14_s8_e0_x.dec); do /root/.local/bin/crackNum -f sp $(echo $a) | grep "Hex layout" ; done > ../measured_supreme_n28_m14_s8_e0_x.flex &
for a in $(< measured_supreme_n28_m14_s8_e0_y.dec); do /root/.local/bin/crackNum -f sp $(echo $a) | grep "Hex layout" ; done > ../measured_supreme_n28_m14_s8_e0_y.flex &
#
for a in $(< measured_supreme_n28_m14_s8_e6_x.dec); do /root/.local/bin/crackNum -f sp $(echo $a) | grep "Hex layout" ; done > ../measured_supreme_n28_m14_s8_e6_x.flex &
for a in $(< measured_supreme_n28_m14_s8_e6_y.dec); do /root/.local/bin/crackNum -f sp $(echo $a) | grep "Hex layout" ; done > ../measured_supreme_n28_m14_s8_e6_y.flex &
#
for a in $(< measured_supreme_n28_m14_s9_e0_x.dec); do /root/.local/bin/crackNum -f sp $(echo $a) | grep "Hex layout" ; done > ../measured_supreme_n28_m14_s9_e0_x.flex &
for a in $(< measured_supreme_n28_m14_s9_e0_y.dec); do /root/.local/bin/crackNum -f sp $(echo $a) | grep "Hex layout" ; done > ../measured_supreme_n28_m14_s9_e0_y.flex &
#
for a in $(< measured_supreme_n28_m14_s9_e6_x.dec); do /root/.local/bin/crackNum -f sp $(echo $a) | grep "Hex layout" ; done > ../measured_supreme_n28_m14_s9_e6_x.flex &
for a in $(< measured_supreme_n28_m14_s9_e6_y.dec); do /root/.local/bin/crackNum -f sp $(echo $a) | grep "Hex layout" ; done > ../measured_supreme_n28_m14_s9_e6_y.flex
#
echo  "120 secs for tasks to finish"
sleep 120

# this also needs at least 20 cores / 40 threads to fully execute 
# oneliner: for a in $(< measured_supreme28q14d.dec); do /root/.local/bin/crackNum -f sp $(echo $a) | grep "Hex layout" ; done > ../n28_m14.flex
#
echo "starting dec to float hex conversion" 
for a in $(< measurements_n28_m14_s0_e0_pEFGH.dec); do /root/.local/bin/crackNum -f sp $(echo $a) | grep "Hex layout" ; done > ../n28_m14_s0_e0_pEFGH.flex &
for a in $(< measurements_n28_m14_s0_e6_pEFGH.dec); do /root/.local/bin/crackNum -f sp $(echo $a) | grep "Hex layout" ; done > ../n28_m14_s0_e6_pEFGH.flex &
for a in $(< measurements_n28_m14_s1_e0_pEFGH.dec); do /root/.local/bin/crackNum -f sp $(echo $a) | grep "Hex layout" ; done > ../n28_m14_s1_e0_pEFGH.flex &
for a in $(< measurements_n28_m14_s1_e6_pEFGH.dec); do /root/.local/bin/crackNum -f sp $(echo $a) | grep "Hex layout" ; done > ../n28_m14_s1_e6_pEFGH.flex &
for a in $(< measurements_n28_m14_s2_e0_pEFGH.dec); do /root/.local/bin/crackNum -f sp $(echo $a) | grep "Hex layout" ; done > ../n28_m14_s2_e0_pEFGH.flex &
for a in $(< measurements_n28_m14_s2_e6_pEFGH.dec); do /root/.local/bin/crackNum -f sp $(echo $a) | grep "Hex layout" ; done > ../n28_m14_s0_e6_pEFGH.flex &
for a in $(< measurements_n28_m14_s3_e0_pEFGH.dec); do /root/.local/bin/crackNum -f sp $(echo $a) | grep "Hex layout" ; done > ../n28_m14_s3_e0_pEFGH.flex &
for a in $(< measurements_n28_m14_s3_e6_pEFGH.dec); do /root/.local/bin/crackNum -f sp $(echo $a) | grep "Hex layout" ; done > ../n28_m14_s3_e6_pEFGH.flex &
for a in $(< measurements_n28_m14_s4_e0_pEFGH.dec); do /root/.local/bin/crackNum -f sp $(echo $a) | grep "Hex layout" ; done > ../n28_m14_s4_e0_pEFGH.flex &
for a in $(< measurements_n28_m14_s4_e6_pEFGH.dec); do /root/.local/bin/crackNum -f sp $(echo $a) | grep "Hex layout" ; done > ../n28_m14_s4_e6_pEFGH.flex
#
echo "halfway value conversion"
#
for a in $(< measurements_n28_m14_s5_e0_pEFGH.dec); do /root/.local/bin/crackNum -f sp $(echo $a) | grep "Hex layout" ; done > ../n28_m14_s5_e0_pEFGH.flex &
for a in $(< measurements_n28_m14_s5_e6_pEFGH.dec); do /root/.local/bin/crackNum -f sp $(echo $a) | grep "Hex layout" ; done > ../n28_m14_s5_e6_pEFGH.flex &
for a in $(< measurements_n28_m14_s6_e0_pEFGH.dec); do /root/.local/bin/crackNum -f sp $(echo $a) | grep "Hex layout" ; done > ../n28_m14_s6_e0_pEFGH.flex &
for a in $(< measurements_n28_m14_s6_e6_pEFGH.dec); do /root/.local/bin/crackNum -f sp $(echo $a) | grep "Hex layout" ; done > ../n28_m14_s6_e6_pEFGH.flex &
for a in $(< measurements_n28_m14_s7_e0_pEFGH.dec); do /root/.local/bin/crackNum -f sp $(echo $a) | grep "Hex layout" ; done > ../n28_m14_s7_e0_pEFGH.flex &
for a in $(< measurements_n28_m14_s7_e6_pEFGH.dec); do /root/.local/bin/crackNum -f sp $(echo $a) | grep "Hex layout" ; done > ../n28_m14_s7_e6_pEFGH.flex &
for a in $(< measurements_n28_m14_s8_e0_pEFGH.dec); do /root/.local/bin/crackNum -f sp $(echo $a) | grep "Hex layout" ; done > ../n28_m14_s8_e0_pEFGH.flex &
for a in $(< measurements_n28_m14_s8_e0_pEFGH.dec); do /root/.local/bin/crackNum -f sp $(echo $a) | grep "Hex layout" ; done > ../n28_m14_s8_e6_pEFGH.flex &
for a in $(< measurements_n28_m14_s9_e0_pEFGH.dec); do /root/.local/bin/crackNum -f sp $(echo $a) | grep "Hex layout" ; done > ../n28_m14_s9_e0_pEFGH.flex
# for a in $(< measurements_n28_m14_s9_e6_pEFGH.dec); do /root/.local/bin/crackNum -f sp $(echo $a) | grep "Hex layout" ; done > ../n28_m14_s9_e6_pEFGH.flex
echo "ready"

echo  "120 secs for tasks to finish"
sleep 120

wc -l ../n28_m14*

# merge results into one file
cat ../n28_m14_* > ../28q14d.flex
cd .. 
# rm -R /n28_m14

# conversion of raw crackNum output to hex in fork
echo "filter to one fHEX file"
grep "Hex layout" 28q14d.flex | tr -d ' ' | tr -d 'Hexlayout:' > 28q14d.fhex
echo "done"
