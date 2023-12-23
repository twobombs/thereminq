#!/bin/bash
# create a spere with z axis coordinate cos-system

seq 1 10000 > z10k.dec
echo "converting z10k to float hex"
for a in $(< z10k.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" | tr -d ' ' | tr -d 'Hexlayout:' ; done > z10k.fhex &

seq 1 4800 > x4k8.dec
echo "converting x4k8 to float hex"
for a in $(< x4k8.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" | tr -d ' ' | tr -d 'Hexlayout:' ; done > x4k8.fhex &
