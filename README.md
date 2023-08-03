# ThereminQ - CLassiC
## Orchestrating Qrack, ELK, Bonsai and Tipsy in OpenCL, VCL and CUDA 
<img width="200" alt="ThereminQ" src="https://user-images.githubusercontent.com/12692227/147117984-86c4b4b6-d55d-41ba-aab8-f056a6403902.gif">

![](https://img.shields.io/docker/automated/jrottenberg/ffmpeg.svg)

[![ThereminQ data demo #1](http://img.youtube.com/vi/CgvKkK4-OlE/0.jpg)](https://youtu.be/CgvKkK4-OlE "ThereminQ data demo #1")

-------------

### ThereminQ orchestrates a suite of best-of-class tools designed to control, extend and visualize data emanating to and from Quantum circuits using Qrack, ELK, Tipsy and Jupyter on CUDA and OpenCL accelerators.

- Qrack - Qbit OpenCL Hardware Emulation Stack https://github.com/vm6502q/qrack
- Bonsai - Stellar data visualizer for QFT, Sycamore, TNN_d and SDRP validation https://github.com/treecode/Bonsai
- Elastic Search/Lucene Interface for Big Data interconnect https://www.elastic.co/downloads/

Look also at the following images
- Boards - a collection of QC Jupiter notebooks https://github.com/twobombs/thereminq-tensors
- Shors' and Qimcifa https://github.com/twobombs/thereminq-tensors/blob/master/README.md#shors-rsa-ssh-keypair-factorization-and-2-primes-test-loop

Other tags contain
- QUDA                  http://lattice.github.io/quda/
- cuQuantum             https://developer.nvidia.com/cuquantum-sdk

Images can be run independant but are also made to work with the vQbit infrastructure K8s HELM repo at https://github.com/twobombs/helm
Installation setup and usage scenarios can be glanced at here https://gist.github.com/twobombs/bb38050e84331307bf14c46d723b2a01

-------------

### Build on CUDA-CLuster stack https://github.com/twobombs/cudacluster 
### and deploy-nvidia-docker https://github.com/twobombs/deploy-nvidia-docker WebUI
- WebVNC, CUDA 11.4+ & OpenCL 1.2+ with NV, AMD & Intel HW support

<img width="1435" alt="Screenshot 2021-05-04 at 15 10 27" src="https://user-images.githubusercontent.com/12692227/117008533-21d79280-aceb-11eb-993a-efa7d1123a1f.png">


Initial vnc password is 00000000
- noVNC website is avaliable at port 6080 
- xRDP running at port 3389 to vnc 127.0.0.1:5900

-------------

### Docker: deploy an instance of ThereminQ's WebUI controller container
- docker run --gpus all --privileged -p 6080:6080 --device=/dev/dri:/dev/dri --mount type=bind,source=/var/log/qrack,target=/var/log/qrack -d twobombs/thereminq:controller
- docker run -ti --mount type=bind,source=/var/log/qrack,target=/var/log/qrack twobombs/thereminq bash /root/run-supreme-cpu
- docker run --gpus all --device=/dev/dri:/dev/dri -ti --mount type=bind,source=/var/log/qrack,target=/var/log/qrack twobombs/thereminq bash /root/run-cosmos-gpu1
- use --gpus all for NVidia-Docker hosts, in addition --privileged and --device=/dev/dri:/dev/dri will expose all GPUs in the system, eg: AMD/Intel iGPUs<br> <br>

All specialized workloads are listed in https://github.com/twobombs/thereminq/tree/master/runscripts

![Screenshot from 2021-10-24 17-23-18](https://user-images.githubusercontent.com/12692227/138600777-607fda67-52d5-4e24-9f19-8e30f36ffa29.png)

-------------

### Experimental 'bqp=bpp' stabilizer_t_nn high qbit workloads
- docker run --gpus all --device=/dev/dri:/dev/dri -ti --mount type=bind,source=/var/log/qrack,target=/var/log/qrack twobombs/thereminq bash /root/run-tnn-gpu1<br> <br>

### Archived: experimental Quantum Inspired Qimcifa high qbit workloads ( Shors' Monte Carlo )
- docker run --gpus all --device=/dev/dri:/dev/dri -d twobombs/thereminq:qimcifa <br> <br>
![Screenshot from 2023-07-08 11-20-49](https://github.com/twobombs/thereminq/assets/12692227/adf196cd-948a-475e-836e-275400dc461b)

#### note: --ipc=host in the docker command is a chrome requirement. If you don't need chrome in the session you can leave this out.

![Screenshot from 2022-05-22 20-43-30](https://user-images.githubusercontent.com/12692227/169710747-32ef4926-0286-487a-b9ed-e8c676b2a43a.png)
C-style Shors' with rsaConverter ( https://www.idrix.fr/Root/content/category/7/28/51/) and Qimcifa ( https://github.com/vm6502q/qimcifa )

-------------

### Tips for Managing high-Qubit and/or high-Node workloads
- Workloads with full entanglement and/or Quantum simulations that are at or exceed 30+ Qubits
- Mixed workloads based on longer/larger/deeper circuits with partial entanglement that exceed 36+ Qubits<br> <br>

To prevent these workload from taking up all resources of the system it is good to take the following measures

- System memory should be at least the amount of RAM where the statevector will fit into
- From 30 qubits ( eg: QFT ) count 8GB RAM Memory (and 4 cores with POCL) doubling every additional qubit 
- Start an instance with a limit for memory and/or swap. eg docker: '-m 16g --memory-swap 32g'
- Disable OOM killers in the kernel and/or the container orchestrator ( --oom-kill-disable )
- OOM host change: add vm.overcommit_memory = 1 and vm.oom-kill = 0 in /etc/sysctl.conf
- Swap should be a dedicated and fast drive where possible NVMe RAID, equal to the bandwith of the GPU/PCIe<br> <br>

-------------

### Sycamore, QFT & T_NN(-d) Results on an AMD Threadripper 1920X@4.2Ghz
- 24 Threads with 32GB RAM, 2.5TB NVMe Swap on a 11x RAID NVME drive - Tesla K80 24GB - Tesla M40 24GB

[results https://docs.google.com/spreadsheets/d/1u2Qum9W768rMWIoKlz658i1P6RTmX1ekgartNMHuR-s ]

M40 + K80 run script https://github.com/twobombs/thereminq/blob/master/runscripts/run-tnn-cube-multi

### If you want to reproduce these results here are some gists to help you along

Install Guide: https://gist.github.com/twobombs/c93f9bbf2afe98d795372d024d6b30d7

Recommendations: https://gist.github.com/twobombs/eee53194f7c3e00332b555bad0ae2ade

Runtime: https://gist.github.com/twobombs/9d9ec5d6fbca4b960b1df1f6e147b038

Note: it is wise to run the benchmarks program inside a main memory limited container with outflow to fast swap so that the system remains stable at intensive runs and high memory peaks

-------------

### To run ThereminQ as a VirtualCL controller 
#### note: create the underlying directory structure as mentioned in the VCL readme of Qrackmin https://github.com/twobombs/qrackmin#vcl-qrackdocker
eg: docker run --gpus all --device=/dev/dri:/dev/dri -d --mount type=bind,source=/var/log/vcl,target=/var/log/vcl --mount type=bind,source=/var/log/qrack,target=/var/log/qrack twobombs/thereminq:vcl-controller

-------------

## Code from the following companies and initiatives are in this container

![](https://user-images.githubusercontent.com/12692227/57654809-61c07f00-75d5-11e9-9005-38d60d8d4db4.png)

All rights and kudos belong to their respective owners. <br>
If (your) code resides in this container image and you don't want that please let me know. <br>

Code of conduct : Contributor Covenant 
https://github.com/EthicalSource/contributor_covenant
