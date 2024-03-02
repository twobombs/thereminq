#!/bin/bash
#
# set default device when multigpu; every GPU can generate a stream to be consolidated to /tmp/qrackrng
export QRACK_OCL_DEFAULT_DEVICE=0

# 24 qubit qft fluctuations are used as rng feed
./benchmarks --optimal --binary-output --measure-shots=1 -m=24 --samples=999999999 --single --measure-output /tmp/test_qft_cosmology.txt test_qft_cosmology &

# convert decimal qft fluctuations to hex converted binary output
tail -f /tmp/test_qft_cosmology.txt | hexdump -v -e '1/4 "%08x"' -e '"\n"' | xxd -r -p > /tmp/qrackrng &

# disconnect & setup loop device with qrackrng output 
losetup -d /dev/loop99 > /dev/null
losetup /dev/loop99 /tmp/qrackrng

# tail output of qrackrng device
tail -f /dev/loop99
#
