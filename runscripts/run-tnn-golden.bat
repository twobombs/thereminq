#!/bin/bash
#
# run TNN benchmark for load & output simulation 
#
set QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.50
set QRACK_QPAGER_DEVICES=10.1,10.0
set QRACK_QPAGER_DEVICES_HOST_POINTER=10.0,4.1
set QRACK_OCL_DEFAULT_DEVICE=1
set QRACK_MAX_PAGING_QB=29
set QRACK_MAX_ALLOC_MB=10000
set QRACK_MAX_PAGE_QB=27
#
qrack_windows_x86_benchmarks.exe --optimal --timeout=2000 --max-qubits=36 --benchmark-depth=20 --single test_stabilizer_t_cc_nn --benchmark-resamples=10 --samples=10 --measure-output=t_cc_nn.log
