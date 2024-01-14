# !/bin/bash
# nn gpu scaling & sizing test

#export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.40
#export QRACK_QPAGER_DEVICES=12.0,12.1
#export QRACK_QPAGER_DEVICES_HOST_POINTER=12.0,1.1
#export QRACK_OCL_DEFAULT_DEVICE=2
#export QRACK_MAX_ALLOC_MB=12000

export QRACK_QTENSORNETWORK_THRESHOLD_QB=25
#export QRACK_QBDT_HYBRID_THRESHOLD=2

./benchmarks --layer-qtensornetwork --proc-hybrid --samples=1 --benchmark-depth=3 --max-qubits=49 --measure-output=/var/log/qrack/"measured_nn_graph_gpu_$run-$(date +%F_%R_%S).log" test_random_circuit_sampling_nn
