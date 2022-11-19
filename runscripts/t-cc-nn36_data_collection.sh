export  QRACK_OCL_DEFAULT_DEVICE=1

export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.45
./benchmarks --optimal-single --single --max-qubits=36 --samples=1000 --benchmark-depth=4 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_45_4.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.40
./benchmarks --optimal-single --single --max-qubits=36 --samples=1000 --benchmark-depth=4 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_40_4.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.35
./benchmarks --optimal-single --single --max-qubits=36 --samples=1000 --benchmark-depth=4 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_35_4.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.30
./benchmarks --optimal-single --single --max-qubits=36 --samples=1000 --benchmark-depth=4 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_30_4.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.25
./benchmarks --optimal-single --single --max-qubits=36 --samples=1000 --benchmark-depth=4 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_25_4.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.20
./benchmarks --optimal-single --single --max-qubits=36 --samples=1000 --benchmark-depth=4 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_20_4.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.15
./benchmarks --optimal-single --single --max-qubits=36 --samples=1000 --benchmark-depth=4 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_15_4.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.10
./benchmarks --optimal-single --single --max-qubits=36 --samples=1000 --benchmark-depth=4 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_10_4.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.05
./benchmarks --optimal-single --single --max-qubits=36 --samples=1000 --benchmark-depth=4 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_05_4.csv
unset QRACK_QUNIT_SEPARABILITY_THRESHOLD
./benchmarks --optimal-single --single --max-qubits=36 --samples=1000 --benchmark-depth=4 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_00_4.csv

export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.45
./benchmarks --optimal-single --single --max-qubits=36 --samples=1000 --benchmark-depth=5 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_45_5.csv
 export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.40
./benchmarks --optimal-single --single --max-qubits=36 --samples=1000 --benchmark-depth=5 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_40_5.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.35
./benchmarks --optimal-single --single --max-qubits=36 --samples=1000 --benchmark-depth=5 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_35_5.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.30
./benchmarks --optimal-single --single --max-qubits=36 --samples=1000 --benchmark-depth=5 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_30_5.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.25
./benchmarks --optimal-single --single --max-qubits=36 --samples=1000 --benchmark-depth=5 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_25_5.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.20
./benchmarks --optimal-single --single --max-qubits=36 --samples=1000 --benchmark-depth=5 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_20_5.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.15
./benchmarks --optimal-single --single --max-qubits=36 --samples=1000 --benchmark-depth=5 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_15_5.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.10
./benchmarks --optimal-single --single --max-qubits=36 --samples=1000 --benchmark-depth=5 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_10_5.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.05
./benchmarks --optimal-single --single --max-qubits=36 --samples=1000 --benchmark-depth=5 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_05_5.csv
unset QRACK_QUNIT_SEPARABILITY_THRESHOLD
./benchmarks --optimal-single --single --max-qubits=36 --samples=1000 --benchmark-depth=5 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_00_5.csv

export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.45
./benchmarks --optimal-single --single --max-qubits=36 --samples=1000 --benchmark-depth=6 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_45_6.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.40
./benchmarks --optimal-single --single --max-qubits=36 --samples=1000 --benchmark-depth=6 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_40_6.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.35
./benchmarks --optimal-single --single --max-qubits=36 --samples=1000 --benchmark-depth=6 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_35_6.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.30
./benchmarks --optimal-single --single --max-qubits=36 --samples=1000 --benchmark-depth=6 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_30_6.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.25
./benchmarks --optimal-single --single --max-qubits=36 --samples=1000 --benchmark-depth=6 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_25_6.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.20
./benchmarks --optimal-single --single --max-qubits=36 --samples=1000 --benchmark-depth=6 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_20_6.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.15
./benchmarks --optimal-single --single --max-qubits=36 --samples=1000 --benchmark-depth=6 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_15_6.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.10
./benchmarks --optimal-single --single --max-qubits=36 --samples=1000 --benchmark-depth=6 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_10_6.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.05
./benchmarks --optimal-single --single --max-qubits=36 --samples=1000 --benchmark-depth=6 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_05_6.csv
unset QRACK_QUNIT_SEPARABILITY_THRESHOLD
./benchmarks --optimal-single --single --max-qubits=36 --samples=1000 --benchmark-depth=6 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_00_6.csv

export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.45
./benchmarks --optimal-single --single --max-qubits=36 --samples=1000 --benchmark-depth=7 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_45_7.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.40
./benchmarks --optimal-single --single --max-qubits=36 --samples=1000 --benchmark-depth=7 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_40_7.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.35
./benchmarks --optimal-single --single --max-qubits=36 --samples=1000 --benchmark-depth=7 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_35_7.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.30
./benchmarks --optimal-single --single --max-qubits=36 --samples=1000 --benchmark-depth=7 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_30_7.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.25
./benchmarks --optimal-single --single --max-qubits=36 --samples=1000 --benchmark-depth=7 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_25_7.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.20
./benchmarks --optimal-single --single --max-qubits=36 --samples=1000 --benchmark-depth=7 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_20_7.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.15
./benchmarks --optimal-single --single --max-qubits=36 --samples=1000 --benchmark-depth=7 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_15_7.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.10
./benchmarks --optimal-single --single --max-qubits=36 --samples=1000 --benchmark-depth=7 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_10_7.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.05
./benchmarks --optimal-single --single --max-qubits=36 --samples=1000 --benchmark-depth=7 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_05_7.csv
unset QRACK_QUNIT_SEPARABILITY_THRESHOLD
./benchmarks --optimal-single --single --max-qubits=36 --samples=1000 --benchmark-depth=7 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_00_7.csv

export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.45
./benchmarks --optimal-single --single --max-qubits=36 --samples=1000 --benchmark-depth=8 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_45_8.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.40
./benchmarks --optimal-single --single --max-qubits=36 --samples=1000 --benchmark-depth=8 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_40_8.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.35
./benchmarks --optimal-single --single --max-qubits=36 --samples=1000 --benchmark-depth=8 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_35_8.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.30
./benchmarks --optimal-single --single --max-qubits=36 --samples=1000 --benchmark-depth=8 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_30_8.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.25
./benchmarks --optimal-single --single --max-qubits=36 --samples=1000 --benchmark-depth=8 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_25_8.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.20
./benchmarks --optimal-single --single --max-qubits=36 --samples=1000 --benchmark-depth=8 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_20_8.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.15
./benchmarks --optimal-single --single --max-qubits=36 --samples=1000 --benchmark-depth=8 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_15_8.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.10
./benchmarks --optimal-single --single --max-qubits=36 --samples=1000 --benchmark-depth=8 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_10_8.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.05
./benchmarks --optimal-single --single --max-qubits=36 --samples=1000 --benchmark-depth=8 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_05_8.csv
unset QRACK_QUNIT_SEPARABILITY_THRESHOLD

./benchmarks --optimal-single --single --max-qubits=36 --samples=1000 --benchmark-depth=8 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_00_8.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.45
./benchmarks --optimal-single --single --max-qubits=36 --samples=1000 --benchmark-depth=9 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_45_9.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.40
./benchmarks --optimal-single --single --max-qubits=36 --samples=1000 --benchmark-depth=9 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_40_9.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.35
./benchmarks --optimal-single --single --max-qubits=36 --samples=1000 --benchmark-depth=9 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_35_9.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.30
./benchmarks --optimal-single --single --max-qubits=36 --samples=1000 --benchmark-depth=9 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_30_9.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.25
./benchmarks --optimal-single --single --max-qubits=36 --samples=1000 --benchmark-depth=9 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_25_9.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.20
./benchmarks --optimal-single --single --max-qubits=36 --samples=1000 --benchmark-depth=9 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_20_9.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.15
./benchmarks --optimal-single --single --max-qubits=36 --samples=1000 --benchmark-depth=9 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_15_9.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.10
./benchmarks --optimal-single --single --max-qubits=36 --samples=1000 --benchmark-depth=9 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_10_9.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.05
./benchmarks --optimal-single --single --max-qubits=36 --samples=1000 --benchmark-depth=9 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_05_9.csv
unset QRACK_QUNIT_SEPARABILITY_THRESHOLD
./benchmarks --optimal-single --single --max-qubits=36 --samples=1000 --benchmark-depth=9 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_00_9.csv

export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.45
./benchmarks --optimal-single --single --max-qubits=36 --samples=1000 --benchmark-depth=10 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_45_10.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.40
./benchmarks --optimal-single --single --max-qubits=36 --samples=1000 --benchmark-depth=10 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_40_10.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.35
./benchmarks --optimal-single --single --max-qubits=36 --samples=1000 --benchmark-depth=10 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_35_10.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.30
./benchmarks --optimal-single --single --max-qubits=36 --samples=1000 --benchmark-depth=10 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_30_10.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.25
./benchmarks --optimal-single --single --max-qubits=36 --samples=1000 --benchmark-depth=10 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_25_10.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.20
./benchmarks --optimal-single --single --max-qubits=36 --samples=1000 --benchmark-depth=10 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_20_10.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.15
./benchmarks --optimal-single --single --max-qubits=36 --samples=1000 --benchmark-depth=10 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_15_10.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.10
./benchmarks --optimal-single --single --max-qubits=36 --samples=1000 --benchmark-depth=10 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_10_10.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.05
./benchmarks --optimal-single --single --max-qubits=36 --samples=1000 --benchmark-depth=10 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_05_10.csv
unset QRACK_QUNIT_SEPARABILITY_THRESHOLD
./benchmarks --optimal-single --single --max-qubits=36 --samples=1000 --benchmark-depth=10 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_00_10.csv

export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.45
./benchmarks --optimal-single --single --max-qubits=36 --samples=1000 --benchmark-depth=11 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_45_11.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.40
./benchmarks --optimal-single --single --max-qubits=36 --samples=1000 --benchmark-depth=11 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_40_11.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.35
./benchmarks --optimal-single --single --max-qubits=36 --samples=1000 --benchmark-depth=11 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_35_11.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.30
./benchmarks --optimal-single --single --max-qubits=36 --samples=1000 --benchmark-depth=11 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_30_11.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.25
./benchmarks --optimal-single --single --max-qubits=36 --samples=1000 --benchmark-depth=11 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_25_11.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.20
./benchmarks --optimal-single --single --max-qubits=36 --samples=1000 --benchmark-depth=11 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_20_11.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.15
./benchmarks --optimal-single --single --max-qubits=36 --samples=1000 --benchmark-depth=11 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_15_11.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.10
./benchmarks --optimal-single --single --max-qubits=36 --samples=1000 --benchmark-depth=11 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_10_11.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.05
./benchmarks --optimal-single --single --max-qubits=36 --samples=1000 --benchmark-depth=11 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_05_11.csv
unset QRACK_QUNIT_SEPARABILITY_THRESHOLD
./benchmarks --optimal-single --single --max-qubits=36 --samples=1000 --benchmark-depth=11 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_00_11.csv

export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.45
./benchmarks --optimal-single --single --max-qubits=36 --samples=1000 --benchmark-depth=12 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_45_12.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.40
./benchmarks --optimal-single --single --max-qubits=36 --samples=1000 --benchmark-depth=12 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_40_12.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.35
./benchmarks --optimal-single --single --max-qubits=36 --samples=1000 --benchmark-depth=12 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_35_12.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.30
./benchmarks --optimal-single --single --max-qubits=36 --samples=1000 --benchmark-depth=12 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_30_12.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.25
./benchmarks --optimal-single --single --max-qubits=36 --samples=1000 --benchmark-depth=12 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_25_12.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.20
./benchmarks --optimal-single --single --max-qubits=36 --samples=1000 --benchmark-depth=12 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_20_12.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.15
./benchmarks --optimal-single --single --max-qubits=36 --samples=1000 --benchmark-depth=12 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_15_12.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.10
./benchmarks --optimal-single --single --max-qubits=36 --samples=1000 --benchmark-depth=12 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_10_12.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.05
./benchmarks --optimal-single --single --max-qubits=36 --samples=1000 --benchmark-depth=12 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_05_12.csv
unset QRACK_QUNIT_SEPARABILITY_THRESHOLD
./benchmarks --optimal-single --single --max-qubits=36 --samples=1000 --benchmark-depth=12 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_00_12.csv

export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.45
./benchmarks --optimal-single --single --max-qubits=36 --samples=1000 --benchmark-depth=13 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_45_13.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.40
./benchmarks --optimal-single --single --max-qubits=36 --samples=1000 --benchmark-depth=13 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_40_13.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.35
./benchmarks --optimal-single --single --max-qubits=36 --samples=1000 --benchmark-depth=13 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_35_13.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.30
./benchmarks --optimal-single --single --max-qubits=36 --samples=1000 --benchmark-depth=13 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_30_13.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.25
./benchmarks --optimal-single --single --max-qubits=36 --samples=1000 --benchmark-depth=13 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_25_13.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.20
./benchmarks --optimal-single --single --max-qubits=36 --samples=1000 --benchmark-depth=13 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_20_13.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.15
./benchmarks --optimal-single --single --max-qubits=36 --samples=1000 --benchmark-depth=13 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_15_13.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.10
./benchmarks --optimal-single --single --max-qubits=36 --samples=1000 --benchmark-depth=13 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_10_13.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.05
./benchmarks --optimal-single --single --max-qubits=36 --samples=1000 --benchmark-depth=13 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_05_13.csv
unset QRACK_QUNIT_SEPARABILITY_THRESHOLD
./benchmarks --optimal-single --single --max-qubits=36 --samples=1000 --benchmark-depth=13 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_00_13.csv

export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.45
./benchmarks --optimal-single --single --max-qubits=36 --samples=1000 --benchmark-depth=14 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_45_14.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.40
./benchmarks --optimal-single --single --max-qubits=36 --samples=1000 --benchmark-depth=14 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_40_14.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.35
./benchmarks --optimal-single --single --max-qubits=36 --samples=1000 --benchmark-depth=14 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_35_14.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.30
./benchmarks --optimal-single --single --max-qubits=36 --samples=1000 --benchmark-depth=14 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_30_14.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.25
./benchmarks --optimal-single --single --max-qubits=36 --samples=1000 --benchmark-depth=14 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_25_14.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.20
./benchmarks --optimal-single --single --max-qubits=36 --samples=1000 --benchmark-depth=14 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_20_14.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.15
./benchmarks --optimal-single --single --max-qubits=36 --samples=1000 --benchmark-depth=14 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_15_14.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.10
./benchmarks --optimal-single --single --max-qubits=36 --samples=1000 --benchmark-depth=14 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_10_14.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.05
./benchmarks --optimal-single --single --max-qubits=36 --samples=1000 --benchmark-depth=14 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_05_14.csv
unset QRACK_QUNIT_SEPARABILITY_THRESHOLD
./benchmarks --optimal-single --single --max-qubits=36 --samples=1000 --benchmark-depth=14 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_00_14.csv
