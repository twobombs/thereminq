#

export QRACK_OCL_DEFAULT_DEVICE=4
export QRACK_QPAGER_DEVICES=11.1,11.2,11.3,11.1
export QRACK_QPAGER_DEVICES_HOST_POINTER=1.0,1.1
export QRACK_MAX_ALLOC_MB=48000
export QRACK_MAX_PAGING_QB=32
export QRACK_MAX_CPU_QB=32
export QRACK_SEGMENT_GLOBAL_QB=2

export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.35

time ./benchmarks --optimal --measure-shots=1024 --single --max-qubits=54 --samples=100 --benchmark-depth=13 test_quantum_supremacy --measure-output=/var/log/qrack/"measured_sycamore53_13_35_$(date +%F_%R_%S).log" >> q0_35_13_zoom.csv


