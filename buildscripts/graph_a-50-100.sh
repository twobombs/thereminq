#!/bin/bash

tipsy=1048575

for a in {51..100}

do
    for b in {8..30}
        do

	    cat measured_cosmos_graph_$(echo $b)_$(echo $a)-* | grep -v 'TestName' > $(echo $b)_$(echo $a)
	    head -n 10000  $(echo $b)_$(echo $a) > x_$(echo $b)_$(echo $a)_1 &
	    tail -n +10001 $(echo $b)_$(echo $a) > x_$(echo $b)_$(echo $a)_2

	done

	for c8 in $(< x_8_$(echo $a)_1); do /root/.local/bin/crackNum -f sp $(echo $c8/$tipsy | bc -l) | grep "Hex layout" | tr -d ' ' | tr -d 'Hexlayout:' ; done > x_8_$(echo $a)_1.fhex &
	for d8 in $(< x_8_$(echo $a)_2); do /root/.local/bin/crackNum -f sp $(echo $d8/$tipsy | bc -l) | grep "Hex layout" | tr -d ' ' | tr -d 'Hexlayout:' ; done > x_8_$(echo $a)_2.fhex &
	#
	for c9 in $(< x_9_$(echo $a)_1); do /root/.local/bin/crackNum -f sp $(echo $c9/$tipsy | bc -l) | grep "Hex layout" | tr -d ' ' | tr -d 'Hexlayout:' ; done > x_9_$(echo $a)_1.fhex &
	for d9 in $(< x_9_$(echo $a)_2); do /root/.local/bin/crackNum -f sp $(echo $d9/$tipsy | bc -l) | grep "Hex layout" | tr -d ' ' | tr -d 'Hexlayout:' ; done > x_9_$(echo $a)_2.fhex &
	#
	for c10 in $(< x_10_$(echo $a)_1); do /root/.local/bin/crackNum -f sp $(echo $c10/$tipsy | bc -l) | grep "Hex layout" | tr -d ' ' | tr -d 'Hexlayout:' ; done > x_10_$(echo $a)_1.fhex &
	for d10 in $(< x_10_$(echo $a)_2); do /root/.local/bin/crackNum -f sp $(echo $d10/$tipsy | bc -l) | grep "Hex layout" | tr -d ' ' | tr -d 'Hexlayout:' ; done > x_10_$(echo $a)_2.fhex &
	#
	for c11 in $(< x_11_$(echo $a)_1); do /root/.local/bin/crackNum -f sp $(echo $c11/$tipsy | bc -l) | grep "Hex layout" | tr -d ' ' | tr -d 'Hexlayout:' ; done > x_11_$(echo $a)_1.fhex &
	for d11 in $(< x_11_$(echo $a)_2); do /root/.local/bin/crackNum -f sp $(echo $d11/$tipsy | bc -l) | grep "Hex layout" | tr -d ' ' | tr -d 'Hexlayout:' ; done > x_11_$(echo $a)_2.fhex &
	#
	for c12 in $(< x_12_$(echo $a)_1); do /root/.local/bin/crackNum -f sp $(echo $c12/$tipsy | bc -l) | grep "Hex layout" | tr -d ' ' | tr -d 'Hexlayout:' ; done > x_12_$(echo $a)_1.fhex &
	for d12 in $(< x_12_$(echo $a)_2); do /root/.local/bin/crackNum -f sp $(echo $d12/$tipsy | bc -l) | grep "Hex layout" | tr -d ' ' | tr -d 'Hexlayout:' ; done > x_12_$(echo $a)_2.fhex &
	#
	for c13 in $(< x_13_$(echo $a)_1); do /root/.local/bin/crackNum -f sp $(echo $c13/$tipsy | bc -l) | grep "Hex layout" | tr -d ' ' | tr -d 'Hexlayout:' ; done > x_13_$(echo $a)_1.fhex &
	for d13 in $(< x_13_$(echo $a)_2); do /root/.local/bin/crackNum -f sp $(echo $d13/$tipsy | bc -l) | grep "Hex layout" | tr -d ' ' | tr -d 'Hexlayout:' ; done > x_13_$(echo $a)_2.fhex &
	#
	for c14 in $(< x_14_$(echo $a)_1); do /root/.local/bin/crackNum -f sp $(echo $c14/$tipsy | bc -l) | grep "Hex layout" | tr -d ' ' | tr -d 'Hexlayout:' ; done > x_14_$(echo $a)_1.fhex &
	for d14 in $(< x_14_$(echo $a)_2); do /root/.local/bin/crackNum -f sp $(echo $d14/$tipsy | bc -l) | grep "Hex layout" | tr -d ' ' | tr -d 'Hexlayout:' ; done > x_14_$(echo $a)_2.fhex &
	#
	for c15 in $(< x_15_$(echo $a)_1); do /root/.local/bin/crackNum -f sp $(echo $c15/$tipsy | bc -l) | grep "Hex layout" | tr -d ' ' | tr -d 'Hexlayout:' ; done > x_15_$(echo $a)_1.fhex &
	for d15 in $(< x_15_$(echo $a)_2); do /root/.local/bin/crackNum -f sp $(echo $d15/$tipsy | bc -l) | grep "Hex layout" | tr -d ' ' | tr -d 'Hexlayout:' ; done > x_15_$(echo $a)_2.fhex &
	#
	for c16 in $(< x_16_$(echo $a)_1); do /root/.local/bin/crackNum -f sp $(echo $c16/$tipsy | bc -l) | grep "Hex layout" | tr -d ' ' | tr -d 'Hexlayout:' ; done > x_16_$(echo $a)_1.fhex &
	for d16 in $(< x_16_$(echo $a)_2); do /root/.local/bin/crackNum -f sp $(echo $d16/$tipsy | bc -l) | grep "Hex layout" | tr -d ' ' | tr -d 'Hexlayout:' ; done > x_16_$(echo $a)_2.fhex &
	#
	for c17 in $(< x_17_$(echo $a)_1); do /root/.local/bin/crackNum -f sp $(echo $c17/$tipsy | bc -l) | grep "Hex layout" | tr -d ' ' | tr -d 'Hexlayout:' ; done > x_17_$(echo $a)_1.fhex &
	for d17 in $(< x_17_$(echo $a)_2); do /root/.local/bin/crackNum -f sp $(echo $d17/$tipsy | bc -l) | grep "Hex layout" | tr -d ' ' | tr -d 'Hexlayout:' ; done > x_17_$(echo $a)_2.fhex &
	#
	for c18 in $(< x_18_$(echo $a)_1); do /root/.local/bin/crackNum -f sp $(echo $c18/$tipsy | bc -l) | grep "Hex layout" | tr -d ' ' | tr -d 'Hexlayout:' ; done > x_18_$(echo $a)_1.fhex &
	for d18 in $(< x_18_$(echo $a)_2); do /root/.local/bin/crackNum -f sp $(echo $d18/$tipsy | bc -l) | grep "Hex layout" | tr -d ' ' | tr -d 'Hexlayout:' ; done > x_18_$(echo $a)_2.fhex &
	#
	for c19 in $(< x_19_$(echo $a)_1); do /root/.local/bin/crackNum -f sp $(echo $c19/$tipsy | bc -l) | grep "Hex layout" | tr -d ' ' | tr -d 'Hexlayout:' ; done > x_19_$(echo $a)_1.fhex &
	for d19 in $(< x_19_$(echo $a)_2); do /root/.local/bin/crackNum -f sp $(echo $d19/$tipsy | bc -l) | grep "Hex layout" | tr -d ' ' | tr -d 'Hexlayout:' ; done > x_19_$(echo $a)_2.fhex &
	#
	for c20 in $(< x_20_$(echo $a)_1); do /root/.local/bin/crackNum -f sp $(echo $c20/$tipsy | bc -l) | grep "Hex layout" | tr -d ' ' | tr -d 'Hexlayout:' ; done > x_20_$(echo $a)_1.fhex &
	for d20 in $(< x_20_$(echo $a)_2); do /root/.local/bin/crackNum -f sp $(echo $d20/$tipsy | bc -l) | grep "Hex layout" | tr -d ' ' | tr -d 'Hexlayout:' ; done > x_20_$(echo $a)_2.fhex &
	#
	for c21 in $(< x_21_$(echo $a)_1); do /root/.local/bin/crackNum -f sp $(echo $c21/$tipsy | bc -l) | grep "Hex layout" | tr -d ' ' | tr -d 'Hexlayout:' ; done > x_21_$(echo $a)_1.fhex &
	for d21 in $(< x_21_$(echo $a)_2); do /root/.local/bin/crackNum -f sp $(echo $d21/$tipsy | bc -l) | grep "Hex layout" | tr -d ' ' | tr -d 'Hexlayout:' ; done > x_21_$(echo $a)_2.fhex &
	#
	for c22 in $(< x_22_$(echo $a)_1); do /root/.local/bin/crackNum -f sp $(echo $c22/$tipsy | bc -l) | grep "Hex layout" | tr -d ' ' | tr -d 'Hexlayout:' ; done > x_22_$(echo $a)_1.fhex &
	for d22 in $(< x_22_$(echo $a)_2); do /root/.local/bin/crackNum -f sp $(echo $d22/$tipsy | bc -l) | grep "Hex layout" | tr -d ' ' | tr -d 'Hexlayout:' ; done > x_22_$(echo $a)_2.fhex &
	#
	for c23 in $(< x_23_$(echo $a)_1);do /root/.local/bin/crackNum -f sp $(echo $c23/$tipsy | bc -l) | grep "Hex layout" | tr -d ' ' | tr -d 'Hexlayout:' ; done > x_23_$(echo $a)_1.fhex &
	for d23 in $(< x_23_$(echo $a)_2);do /root/.local/bin/crackNum -f sp $(echo $d23/$tipsy | bc -l) | grep "Hex layout" | tr -d ' ' | tr -d 'Hexlayout:' ; done > x_23_$(echo $a)_2.fhex &
	#
	for c24 in $(< x_24_$(echo $a)_1);do /root/.local/bin/crackNum -f sp $(echo $c24/$tipsy | bc -l) | grep "Hex layout" | tr -d ' ' | tr -d 'Hexlayout:' ; done > x_24_$(echo $a)_1.fhex &
	for d24 in $(< x_24_$(echo $a)_2);do /root/.local/bin/crackNum -f sp $(echo $d24/$tipsy | bc -l) | grep "Hex layout" | tr -d ' ' | tr -d 'Hexlayout:' ; done > x_24_$(echo $a)_2.fhex &
	#
	for c25 in $(< x_25_$(echo $a)_1);do /root/.local/bin/crackNum -f sp $(echo $c25/$tipsy | bc -l) | grep "Hex layout" | tr -d ' ' | tr -d 'Hexlayout:' ; done > x_25_$(echo $a)_1.fhex &
	for d25 in $(< x_25_$(echo $a)_2);do /root/.local/bin/crackNum -f sp $(echo $d25/$tipsy | bc -l) | grep "Hex layout" | tr -d ' ' | tr -d 'Hexlayout:' ; done > x_25_$(echo $a)_2.fhex &
	#
	for c26 in $(< x_26_$(echo $a)_1);do /root/.local/bin/crackNum -f sp $(echo $c26/$tipsy | bc -l) | grep "Hex layout" | tr -d ' ' | tr -d 'Hexlayout:' ; done > x_26_$(echo $a)_1.fhex &
	for d26 in $(< x_26_$(echo $a)_2);do /root/.local/bin/crackNum -f sp $(echo $d26/$tipsy | bc -l) | grep "Hex layout" | tr -d ' ' | tr -d 'Hexlayout:' ; done > x_26_$(echo $a)_2.fhex &
	#
	for c27 in $(< x_27_$(echo $a)_1);do /root/.local/bin/crackNum -f sp $(echo $c27/$tipsy | bc -l) | grep "Hex layout" | tr -d ' ' | tr -d 'Hexlayout:' ; done > x_27_$(echo $a)_1.fhex &
	for d27 in $(< x_27_$(echo $a)_2);do /root/.local/bin/crackNum -f sp $(echo $d27/$tipsy | bc -l) | grep "Hex layout" | tr -d ' ' | tr -d 'Hexlayout:' ; done > x_27_$(echo $a)_2.fhex &
	#
	for c28 in $(< x_28_$(echo $a)_1);do /root/.local/bin/crackNum -f sp $(echo $c28/$tipsy | bc -l) | grep "Hex layout" | tr -d ' ' | tr -d 'Hexlayout:' ; done > x_28_$(echo $a)_1.fhex &
	for d28 in $(< x_28_$(echo $a)_2);do /root/.local/bin/crackNum -f sp $(echo $d28/$tipsy | bc -l) | grep "Hex layout" | tr -d ' ' | tr -d 'Hexlayout:' ; done > x_28_$(echo $a)_2.fhex &
	#
	for c29 in $(< x_29_$(echo $a)_1);do /root/.local/bin/crackNum -f sp $(echo $c29/$tipsy | bc -l) | grep "Hex layout" | tr -d ' ' | tr -d 'Hexlayout:' ; done > x_29_$(echo $a)_1.fhex &
	for d29 in $(< x_29_$(echo $a)_2);do /root/.local/bin/crackNum -f sp $(echo $d29/$tipsy | bc -l) | grep "Hex layout" | tr -d ' ' | tr -d 'Hexlayout:' ; done > x_29_$(echo $a)_2.fhex &
	#
	echo "working on 30 qubits until done"
	for c30 in $(< x_30_$(echo $a)_1);do /root/.local/bin/crackNum -f sp $(echo $c30/$tipsy | bc -l) | grep "Hex layout" | tr -d ' ' | tr -d 'Hexlayout:' ; done > x_30_$(echo $a)_1.fhex &
	for d30 in $(< x_30_$(echo $a)_2);do /root/.local/bin/crackNum -f sp $(echo $d30/$tipsy | bc -l) | grep "Hex layout" | tr -d ' ' | tr -d 'Hexlayout:' ; done > x_30_$(echo $a)_2.fhex

	echo "done done"

done



# ./10k48.sh

