export  QRACK_OCL_DEFAULT_DEVICE=1

export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.475
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=4 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_475_4.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.425
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=4 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_425_4.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.375
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=4 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_375_4.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.325
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=4 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_325_4.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.275
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=4 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_275_4.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.225
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=4 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_225_4.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.175
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=4 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_175_4.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.125
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=4 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_125_4.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.075
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=4 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_075_4.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.025
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=4 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_025_4.csv

export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.475
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=5 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_475_5.csv
 export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.425
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=5 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_425_5.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.375
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=5 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_375_5.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.325
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=5 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_325_5.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.275
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=5 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_275_5.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.225
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=5 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_225_5.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.175
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=5 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_175_5.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.125
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=5 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_125_5.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.075
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=5 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_075_5.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.025

./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=5 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_025_5.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.475
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=6 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_475_6.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.425
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=6 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_425_6.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.375
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=6 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_375_6.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.325
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=6 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_325_6.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.275
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=6 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_275_6.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.225
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=6 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_225_6.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.175
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=6 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_175_6.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.125
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=6 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_125_6.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.075
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=6 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_075_6.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.025
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=6 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_025_6.csv

export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.475
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=7 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_475_7.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.425
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=7 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_425_7.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.375
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=7 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_375_7.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.325
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=7 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_325_7.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.275
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=7 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_275_7.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.225
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=7 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_225_7.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.175
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=7 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_175_7.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.125
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=7 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_125_7.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.075
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=7 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_075_7.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.025
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=7 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_025_7.csv

export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.475
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=8 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_475_8.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.425
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=8 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_425_8.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.375
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=8 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_375_8.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.325
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=8 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_325_8.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.275
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=8 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_275_8.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.225
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=8 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_225_8.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.175
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=8 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_175_8.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.125
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=8 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_125_8.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.075
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=8 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_075_8.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.025

./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=8 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_025_8.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.475
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=9 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_475_9.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.425
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=9 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_425_9.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.375
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=9 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_375_9.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.325
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=9 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_325_9.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.275
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=9 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_275_9.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.225
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=9 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_225_9.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.175
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=9 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_175_9.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.125
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=9 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_125_9.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.075
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=9 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_075_9.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.025
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=9 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_025_9.csv

export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.475
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=10 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_475_10.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.425
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=10 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_425_10.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.375
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=10 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_375_10.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.325
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=10 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_325_10.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.275
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=10 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_275_10.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.225
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=10 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_225_10.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.175
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=10 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_175_10.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.125
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=10 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_125_10.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.075
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=10 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_075_10.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.025
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=10 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_025_10.csv

export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.475
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=11 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_475_11.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.425
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=11 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_425_11.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.375
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=11 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_375_11.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.325
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=11 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_325_11.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.275
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=11 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_275_11.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.225
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=11 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_225_11.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.175
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=11 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_175_11.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.125
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=11 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_125_11.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.075
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=11 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_075_11.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.025
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=11 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_025_11.csv

export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.475
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=12 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_475_12.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.425
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=12 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_425_12.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.375
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=12 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_375_12.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.325
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=12 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_325_12.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.275
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=12 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_275_12.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.225
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=12 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_225_12.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.175
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=12 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_175_12.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.125
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=12 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_125_12.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.075
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=12 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_075_12.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.025
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=12 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_025_12.csv

export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.475
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=13 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_475_13.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.425
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=13 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_425_13.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.375
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=13 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_375_13.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.325
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=13 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_325_13.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.275
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=13 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_275_13.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.225
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=13 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_225_13.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.175
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=13 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_175_13.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.125
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=13 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_125_13.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.075
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=13 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_075_13.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.025
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=13 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_025_13.csv

export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.475
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=14 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_475_14.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.425
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=14 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_425_14.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.375
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=14 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_375_14.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.325
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=14 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_325_14.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.275
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=14 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_275_14.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.225
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=14 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_225_14.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.175
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=14 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_175_14.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.125
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=14 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_125_14.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.075
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=14 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_075_14.csv
export QRACK_QUNIT_SEPARABILITY_THRESHOLD=0.025
./benchmarks --optimal-single --single --max-qubits=36 --samples=500 --benchmark-depth=14 test_stabilizer_t_cc_nn --measure-output=/var/log/qrack/"t_cc_nn36_$(date +%F_%R_%S).log" >> q1_025_14.csv
