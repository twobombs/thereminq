echo " Starting thread 1 on GPU 1 "
./qrack/_build/benchmarks --proc-opencl-single --enable-normalization --device-id=0 -m=-1 --measure-output=/var/log/qrack/"measured_cosmos_2004_k80a1_$(date +%F_%R_%S).log" [cosmos] >> k80a1.txt &
sleep 2
echo " Starting thread 2 on GPU 1 "
./qrack/_build/benchmarks --proc-opencl-single --enable-normalization --device-id=0 -m=-1 --measure-output=/var/log/qrack/"measured_cosmos_2004_k80a2_$(date +%F_%R_%S).log" [cosmos] >> k80a2.txt &
sleep 2
echo " Starting thread 1 on GPU 2 "
./qrack/_build/benchmarks --proc-opencl-single --enable-normalization --device-id=1 -m=-1 --measure-output=/var/log/qrack/"measured_cosmos_2004_k80b1_$(date +%F_%R_%S).log" [cosmos] >> k80b1.txt &
sleep 2
echo " Starting thread 2 on GPU 2 "
./qrack/_build/benchmarks --proc-opencl-single --enable-normalization --device-id=1 -m=-1 --measure-output=/var/log/qrack/"measured_cosmos_2004_k80b2_$(date +%F_%R_%S).log" [cosmos] >> k80b2.txt &

watch -n1 nvidia-smi
