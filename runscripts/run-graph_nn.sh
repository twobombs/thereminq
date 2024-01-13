# !/bin/bash
# nn gpu scaling & sizing test

#export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.40
export QRACK_QPAGER_DEVICES=10.0,10.1,20.2,2.3
#export QRACK_QPAGER_DEVICES_HOST_POINTER=12.0,1.1
export QRACK_OCL_DEFAULT_DEVICE=2
#export QRACK_MAX_ALLOC_MB=12000

export QRACK_QTENSORNETWORK_THRESHOLD_QB=-1
export QRACK_QBDT_HYBRID_THRESHOLD=2

./benchmarks --optimal --layer-qtensornetwork --proc-bdt --samples=1 --benchmark-depth=12 --max-qubits=54 --measure-output=/var/log/qrack/"measured_nn_graph_20_$run-$(date +%F_%R_%S).log" test_random_circuit_sampling_nn
