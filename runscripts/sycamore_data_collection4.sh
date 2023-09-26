export  QRACK_OCL_DEFAULT_DEVICE=1
export QRACK_QPAGER_DEVICES=22.1
export QRACK_QPAGER_DEVICES_HOST_POINTER=22.0,11.1
export QRACK_MAX_ALLOC_MB=48000
export QRACK_MAX_PAGING_QB=31
export QRACK_SEGMENT_GLOBAL_QB=0
export QRACK_MAX_CPU_QB=31

export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.45
./benchmarks --optimal --measure-shots=1024 --single --max-qubits=54 --samples=100 --benchmark-depth=4 test_quantum_supremacy --measure-output=/var/log/qrack/"sycamore_$(date +%F_%R_%S).log"



export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.45
./benchmarks --optimal --measure-shots=1024 --single --max-qubits=54 --samples=1000 --benchmark-depth=4 test_quantum_supremacy --measure-output=/var/log/qrack/"sycamore_$(date +%F_%R_%S).log" >> q0_45_4a.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.40
./benchmarks --optimal --measure-shots=1024 --single --max-qubits=54 --samples=1000 --benchmark-depth=4 test_quantum_supremacy --measure-output=/var/log/qrack/"sycamore_$(date +%F_%R_%S).log" >> q0_40_4a.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.35
./benchmarks --optimal --measure-shots=1024 --single --max-qubits=54 --samples=1000 --benchmark-depth=4 test_quantum_supremacy --measure-output=/var/log/qrack/"sycamore_$(date +%F_%R_%S).log" >> q0_35_4a.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.30
./benchmarks --optimal --measure-shots=1024 --single --max-qubits=54 --samples=1000 --benchmark-depth=4 test_quantum_supremacy --measure-output=/var/log/qrack/"sycamore_$(date +%F_%R_%S).log" >> q0_30_4a.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.25
./benchmarks --optimal --measure-shots=1024 --single --max-qubits=54 --samples=1000 --benchmark-depth=4 test_quantum_supremacy --measure-output=/var/log/qrack/"sycamore_$(date +%F_%R_%S).log" >> q0_25_4a.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.20
./benchmarks --optimal --measure-shots=1024 --single --max-qubits=54 --samples=1000 --benchmark-depth=4 test_quantum_supremacy --measure-output=/var/log/qrack/"sycamore_$(date +%F_%R_%S).log" >> q0_20_4a.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.15
./benchmarks --optimal --measure-shots=1024 --single --max-qubits=54 --samples=1000 --benchmark-depth=4 test_quantum_supremacy --measure-output=/var/log/qrack/"sycamore_$(date +%F_%R_%S).log" >> q0_15_4a.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.10
./benchmarks --optimal --measure-shots=1024 --single --max-qubits=54 --samples=1000 --benchmark-depth=4 test_quantum_supremacy --measure-output=/var/log/qrack/"sycamore_$(date +%F_%R_%S).log" >> q0_10_4a.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.05
./benchmarks --optimal --measure-shots=1024 --single --max-qubits=54 --samples=1000 --benchmark-depth=4 test_quantum_supremacy --measure-output=/var/log/qrack/"sycamore_$(date +%F_%R_%S).log" >> q0_05_4a.csv
unset QRACK_QUNIT_SEPARABILITY_THRESHOLD
./benchmarks --optimal --measure-shots=1024 --single --max-qubits=54 --samples=1000 --benchmark-depth=4 test_quantum_supremacy --measure-output=/var/log/qrack/"sycamore_$(date +%F_%R_%S).log" >> q0_00_4a.csv
