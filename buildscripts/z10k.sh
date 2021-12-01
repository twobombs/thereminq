#!/bin/bash
# create a spere with z axis coordinate cos-system
seq 1 10000 > z10k.dec
awk '{x=30*-cos($1*0.0003); print x;}' z10k.dec > z10kcos.dec
echo "converting z10k to float hex"
for a in $(< z10kcos.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > z10k.flex
grep "Hex layout" z10k.flex | tr -d ' ' | tr -d 'Hexlayout:' > z10k.fhex
