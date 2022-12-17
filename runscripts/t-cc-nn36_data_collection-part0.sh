#
# without separability threshold
#

export  QRACK_OCL_DEFAULT_DEVICE=0
unset QRACK_QUNIT_SEPARABILITY_THRESHOLD

./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=4 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q_00_4.csv
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=5 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q_05_5.csv
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=6 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q_00_6.csv
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=7 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q_00_7.csv
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=8 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q_05_8.csv
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=9 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q_00_9.csv
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=10 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q_00_10.csv
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=11 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q_00_11.csv
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=12 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q_00_12.csv
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=13 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q_00_13.csv
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=14 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q_00_14.csv
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=15 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q_00_15.csv
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=16 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q_00_16.csv
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=17 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q_00_17.csv
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=18 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q_00_18.csv
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=19 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q_00_19.csv
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=20 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q_00_20.csv
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=21 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q_00_21.csv
