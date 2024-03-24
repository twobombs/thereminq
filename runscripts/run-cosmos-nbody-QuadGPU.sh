#!/bin/bash

# precompile cl kernels for Qrack	
./qrack_cl_precompile

#export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.40
#export QRACK_QPAGER_DEVICES=10.3,10.0,10.1,10.2
#export QRACK_OCL_DEFAULT_DEVICE=3

# default settings for whole run
export QRACK_QPAGER_DEVICES_HOST_POINTER=8.0,1.1
export QRACK_MAX_ALLOC_MB=56000

export QRACK_MAX_PAGING_QB=32
export QRACK_MAX_PAGE_QB=27
export QRACK_SEGMENT_GLOBAL_QB=6

# run benchmark for load & output simulation

# first testrun on V100 16GB for checks QFT functionality
export QRACK_OCL_DEFAULT_DEVICE=0
export QRACK_QPAGER_DEVICES=16.0
./benchmarks --optimal --layer-qtensornetwork --proc-bdt-hybrid --measure-shots=10000 -m=30 --single --samples=1 --measure-output=/var/log/qrack/"measured_cosmos_$(date +%F_%R_%S).log" test_qft_cosmology

# place default OCL device outside scope of 4 cards
# chunks of 8GB are reserved for the state vector
export QRACK_OCL_DEFAULT_DEVICE=4
export QRACK_QPAGER_DEVICES=8.0,8.3,8.2,8.3,8.1,8.3,8.0
./benchmarks --optimal --layer-qtensornetwork --proc-bdt-hybrid --measure-shots=10000 -m=32 --single --samples=1 --measure-output=/var/log/qrack/"measured_cosmos_$(date +%F_%R_%S).log" test_qft_cosmology 

# separate run (disabled)
# export QRACK_OCL_DEFAULT_DEVICE=2
# export QRACK_QPAGER_DEVICES=10.2
# ./benchmarks --optimal --layer-qtensornetwork --proc-bdt-hybrid --measure-shots=10000 -m=29 --single --samples=10 --measure-output=/var/log/qrack/"measured_cosmos_$(date +%F_%R_%S).log" test_qft_cosmology 

# M40 24GB legacy run
export QRACK_OCL_DEFAULT_DEVICE=3
export QRACK_QPAGER_DEVICES=24.3
./benchmarks --optimal --layer-qtensornetwork --proc-bdt-hybrid --measure-shots=10000 -m=29 --single --samples=1 --measure-output=/var/log/qrack/"measured_cosmos_$(date +%F_%R_%S).log" test_qft_cosmology 

# sleep 5
# ./benchmarks --optimal --measure-shots=1024 --proc-stabilizer-qpager -m=27 --device-id=1 --single --samples=1000 --measure-output=/var/log/qrack/"measured_cosmos_$(date +%F_%R_%S).log" test_qft_cosmology

# end run, do not stop container ( debug feature )
# tail -f /dev/null
