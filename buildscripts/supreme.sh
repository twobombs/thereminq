#!/bin/bash
#
# we fetch the sycamore 28 qbit over 14 depth and extract it for filter-feed processing
wget https://datadryad.org/stash/downloads/file_stream/693522
tar -xvzf 693522 && cd n28_m14
cat measure* > measured_supreme_28q14d.txt

while read number; do echo $((2#$number)) ; done < measured_supreme_28q14d.txt > measured_supreme_28q14d.dec

# this needs at least 20 cores to execute
for a in $(< measurements_n28_m14_s0_e0_pEFGH.txt); do /root/.local/bin/crackNum -i28 0b $(echo $a) | grep "Hex layout" ; done > ../n28_m14_s0_e0_pEFGH.flex &
echo "forked 1"
# for a in $(< measurements_n28_m14_s0_e6_pEFGH.txt); do /root/.local/bin/crackNum -i28 0b $(echo $a) | grep "Hex layout" ; done > ../n28_m14_s0_e6_pEFGH.flex &
# echo "forked 2"
for a in $(< measurements_n28_m14_s1_e0_pEFGH.txt); do /root/.local/bin/crackNum -i28 0b $(echo $a) | grep "Hex layout" ; done > ../n28_m14_s1_e0_pEFGH.flex &
echo "forked 3"
# for a in $(< measurements_n28_m14_s1_e6_pEFGH.txt); do /root/.local/bin/crackNum -i28 0b $(echo $a) | grep "Hex layout" ; done > ../n28_m14_s1_e6_pEFGH.flex &
# echo "forked 4"
for a in $(< measurements_n28_m14_s2_e0_pEFGH.txt); do /root/.local/bin/crackNum -i28 0b $(echo $a) | grep "Hex layout" ; done > ../n28_m14_s2_e0_pEFGH.flex &
echo "forked 5"
# for a in $(< measurements_n28_m14_s2_e6_pEFGH.txt); do /root/.local/bin/crackNum -i28 0b $(echo $a) | grep "Hex layout" ; done > ../n28_m14_s0_e6_pEFGH.flex &
# echo "forked 6"
for a in $(< measurements_n28_m14_s3_e0_pEFGH.txt); do /root/.local/bin/crackNum -i28 0b $(echo $a) | grep "Hex layout" ; done > ../n28_m14_s3_e0_pEFGH.flex &
echo "forked 7"
# for a in $(< measurements_n28_m14_s3_e6_pEFGH.txt); do /root/.local/bin/crackNum -i28 0b $(echo $a) | grep "Hex layout" ; done > ../n28_m14_s3_e6_pEFGH.flex &
# echo "forked 8"
for a in $(< measurements_n28_m14_s4_e0_pEFGH.txt); do /root/.local/bin/crackNum -i28 0b $(echo $a) | grep "Hex layout" ; done > ../n28_m14_s4_e0_pEFGH.flex &
echo "forked 9"
# for a in $(< measurements_n28_m14_s4_e6_pEFGH.txt); do /root/.local/bin/crackNum -i28 0b $(echo $a) | grep "Hex layout" ; done > ../n28_m14_s4_e6_pEFGH.flex &
# echo "forked 10"
for a in $(< measurements_n28_m14_s5_e0_pEFGH.txt); do /root/.local/bin/crackNum -i28 0b $(echo $a) | grep "Hex layout" ; done > ../n28_m14_s5_e0_pEFGH.flex &
echo "forked 11"
# for a in $(< measurements_n28_m14_s5_e6_pEFGH.txt); do /root/.local/bin/crackNum -i28 0b $(echo $a) | grep "Hex layout" ; done > ../n28_m14_s5_e6_pEFGH.flex &
# echo "forked 12"
for a in $(< measurements_n28_m14_s6_e0_pEFGH.txt); do /root/.local/bin/crackNum -i28 0b $(echo $a) | grep "Hex layout" ; done > ../n28_m14_s6_e0_pEFGH.flex &
echo "forked 13"
# for a in $(< measurements_n28_m14_s6_e6_pEFGH.txt); do /root/.local/bin/crackNum -i28 0b $(echo $a) | grep "Hex layout" ; done > ../n28_m14_s6_e6_pEFGH.flex &
# echo "forked 14"
for a in $(< measurements_n28_m14_s7_e0_pEFGH.txt); do /root/.local/bin/crackNum -i28 0b $(echo $a) | grep "Hex layout" ; done > ../n28_m14_s7_e0_pEFGH.flex &
echo "forked 15"
# for a in $(< measurements_n28_m14_s7_e6_pEFGH.txt); do /root/.local/bin/crackNum -i28 0b $(echo $a) | grep "Hex layout" ; done > ../n28_m14_s7_e6_pEFGH.flex &
# echo "forked 16"
for a in $(< measurements_n28_m14_s8_e0_pEFGH.txt); do /root/.local/bin/crackNum -i28 0b $(echo $a) | grep "Hex layout" ; done > ../n28_m14_s8_e0_pEFGH.flex &
echo "forked 17"
# for a in $(< measurements_n28_m14_s8_e0_pEFGH.txt); do /root/.local/bin/crackNum -i28 0b $(echo $a) | grep "Hex layout" ; done > ../n28_m14_s8_e6_pEFGH.flex &
# echo "forked 18"
for a in $(< measurements_n28_m14_s9_e0_pEFGH.txt); do /root/.local/bin/crackNum -i28 0b $(echo $a) | grep "Hex layout" ; done > ../n28_m14_s9_e0_pEFGH.flex
echo "forked 19"
# for a in $(< measurements_n28_m14_s9_e6_pEFGH.txt); do /root/.local/bin/crackNum -i28 0b $(echo $a) | grep "Hex layout" ; done > ../n28_m14_s9_e6_pEFGH.flex
echo "ready"

echo  "60 secs for tasks to finish"
sleep 60

wc -l ../n28_m14*

# merge results into one file
cat ../n28_m14_* > ../28q14d.flex
cd .. && rm -R /n28_m14

# conversion of raw crackNum output to hex in fork
echo "filter to fHEX"
grep "Hex layout" 28q14d.flex | tr -d ' ' | tr -d 'Hexlayout:' > 28q14d.fhex
