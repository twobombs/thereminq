#!/bin/bash
#
# we fetch the sycamore 28 qbit over 14 depth and extract it for filter-feed processing
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
while read number; do echo $((2#$number)) ; done < measurements_n28_m14_s9_e6_pEFGH.txt > measurements_n28_m14_s9_e6_pEFGH.dec &
# while read number; do echo $((2#$number)) ; done < measured_supreme_28q14d.txt > measured_supreme_28q14d.dec
echo "binary to decimal conversion done"

# calculate decimal x-y coordinates for placement
# awk '{x=28*-sin($1*0.000000084); print x;}' measured_supreme_28q14d.dec > measured_supreme_28q14d_x.dec
# awk '{y=28*-cos($1*0.000000084); print y;}' measured_supreme_28q14d.dec > measured_supreme_28q14d_y.dec

# this also needs at least 20 cores / 40 threads to fully execute 
# oneliner: for a in $(< measured_supreme28q14d.dec); do /root/.local/bin/crackNum -f sp $(echo $a) | grep "Hex layout" ; done > ../n28_m14.flex
#
echo "starting dec to float hex conversion" 
for a in $(< measurements_n28_m14_s0_e0_pEFGH.dec); do /root/.local/bin/crackNum -f sp $(echo $a) | grep "Hex layout" ; done > ../n28_m14_s0_e0_pEFGH.flex &
# for a in $(< measurements_n28_m14_s0_e6_pEFGH.dec); do /root/.local/bin/crackNum -f sp $(echo $a) | grep "Hex layout" ; done > ../n28_m14_s0_e6_pEFGH.flex &
for a in $(< measurements_n28_m14_s1_e0_pEFGH.dec); do /root/.local/bin/crackNum -f sp $(echo $a) | grep "Hex layout" ; done > ../n28_m14_s1_e0_pEFGH.flex &
# for a in $(< measurements_n28_m14_s1_e6_pEFGH.dec); do /root/.local/bin/crackNum -f sp $(echo $a) | grep "Hex layout" ; done > ../n28_m14_s1_e6_pEFGH.flex &
for a in $(< measurements_n28_m14_s2_e0_pEFGH.dec); do /root/.local/bin/crackNum -f sp $(echo $a) | grep "Hex layout" ; done > ../n28_m14_s2_e0_pEFGH.flex &
# for a in $(< measurements_n28_m14_s2_e6_pEFGH.dec); do /root/.local/bin/crackNum -f sp $(echo $a) | grep "Hex layout" ; done > ../n28_m14_s0_e6_pEFGH.flex &
for a in $(< measurements_n28_m14_s3_e0_pEFGH.dec); do /root/.local/bin/crackNum -f sp $(echo $a) | grep "Hex layout" ; done > ../n28_m14_s3_e0_pEFGH.flex &
# for a in $(< measurements_n28_m14_s3_e6_pEFGH.dec); do /root/.local/bin/crackNum -f sp $(echo $a) | grep "Hex layout" ; done > ../n28_m14_s3_e6_pEFGH.flex &
for a in $(< measurements_n28_m14_s4_e0_pEFGH.dec); do /root/.local/bin/crackNum -f sp $(echo $a) | grep "Hex layout" ; done > ../n28_m14_s4_e0_pEFGH.flex &
# for a in $(< measurements_n28_m14_s4_e6_pEFGH.dec); do /root/.local/bin/crackNum -f sp $(echo $a) | grep "Hex layout" ; done > ../n28_m14_s4_e6_pEFGH.flex &
for a in $(< measurements_n28_m14_s5_e0_pEFGH.dec); do /root/.local/bin/crackNum -f sp $(echo $a) | grep "Hex layout" ; done > ../n28_m14_s5_e0_pEFGH.flex &
# for a in $(< measurements_n28_m14_s5_e6_pEFGH.dec); do /root/.local/bin/crackNum -f sp $(echo $a) | grep "Hex layout" ; done > ../n28_m14_s5_e6_pEFGH.flex &
for a in $(< measurements_n28_m14_s6_e0_pEFGH.dec); do /root/.local/bin/crackNum -f sp $(echo $a) | grep "Hex layout" ; done > ../n28_m14_s6_e0_pEFGH.flex &
# for a in $(< measurements_n28_m14_s6_e6_pEFGH.dec); do /root/.local/bin/crackNum -f sp $(echo $a) | grep "Hex layout" ; done > ../n28_m14_s6_e6_pEFGH.flex &
for a in $(< measurements_n28_m14_s7_e0_pEFGH.dec); do /root/.local/bin/crackNum -f sp $(echo $a) | grep "Hex layout" ; done > ../n28_m14_s7_e0_pEFGH.flex &
# for a in $(< measurements_n28_m14_s7_e6_pEFGH.dec); do /root/.local/bin/crackNum -f sp $(echo $a) | grep "Hex layout" ; done > ../n28_m14_s7_e6_pEFGH.flex &
for a in $(< measurements_n28_m14_s8_e0_pEFGH.dec); do /root/.local/bin/crackNum -f sp $(echo $a) | grep "Hex layout" ; done > ../n28_m14_s8_e0_pEFGH.flex &
# for a in $(< measurements_n28_m14_s8_e0_pEFGH.dec); do /root/.local/bin/crackNum -f sp $(echo $a) | grep "Hex layout" ; done > ../n28_m14_s8_e6_pEFGH.flex &
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
