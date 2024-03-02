#!/bin/bash
#
# set default device when multigpu; every GPU can generate a stream to be consolidated to /tmp/qrackrng
export QRACK_OCL_DEFAULT_DEVICE=0
./benchmarks --optimal --measure-shots=1 -m=16 --samples=999999999 --single --measure-output /tmp/test_qft_cosmology.txt test_qft_cosmology &

# decimal qft fluctuation output converted to binary output
tail -f /tmp/test_qft_cosmology.txt | xxd -r -p > /tmp/qrackrng &

# disconnect & setup loop device with qrackrng output 
losetup -d /dev/qrackrng > /dev/null
losetup /dev/qrackrng /tmp/qrackrng

# tail output of rng device
tail -f /dev/qrackrng
