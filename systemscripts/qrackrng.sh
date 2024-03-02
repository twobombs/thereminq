#!/bin/bash
#

./benchmarks --optimal --measure-shots=1024 -m=24 --samples=999999999 --single --measure-output /tmp/test_qft_cosmology.txt test_qft_cosmology &
tail -f /tmp/test_qft_cosmology.txt | xxd -r -p > /tmp/qrackrng &
losetup /dev/qrackrng /tmp/qrackrng

tail -f /dev/qrackrng
