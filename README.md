# ThereminQ - CLassiC 
## Orchestrating Qrack, ELK, Bonsai and Tipsy in OpenCL, C and CUDA 
<img width="200" alt="ThereminQ" src="https://user-images.githubusercontent.com/12692227/147117984-86c4b4b6-d55d-41ba-aab8-f056a6403902.gif">

![](https://img.shields.io/docker/automated/jrottenberg/ffmpeg.svg)

[![ThereminQ data demo #1](http://img.youtube.com/vi/CgvKkK4-OlE/0.jpg)](https://youtu.be/CgvKkK4-OlE "ThereminQ data demo #1")

ThereminQ orchestrates a suite of best-of-class tools designed to control, extend and visualize data emanating to and from Quantum circuits using Qrack, ELK, Tipsy and Jupyter on CUDA and OpenCL accelerators.

- Qrack - Qbit OpenCL Hardware Emulation Stack https://github.com/vm6502q/qrack
- Bonsai - Stellar data visualizer for QFT, Sycamore and TNN_d data https://github.com/treecode/Bonsai
- Elastic Search/Lucene Interface for Big Data interconnect https://www.elastic.co/downloads/

Look also at the following images
- Boards - a collection of QC Jupiter notebooks https://github.com/twobombs/thereminq-tensors
- Shors' and Qimcifa https://github.com/twobombs/thereminq-tensors/blob/master/README.md#shors-rsa-ssh-keypair-factorization-and-2-primes-test-loop

Other tags contain
- QUDA                  http://lattice.github.io/quda/
- cuQuantum             https://developer.nvidia.com/cuquantum-sdk

Images can be run independantly but are made to work with the vQbit infrastructure K8s HELM repo at https://github.com/twobombs/helm
Installation setup and usage scenarios can be glanced at here https://gist.github.com/twobombs/bb38050e84331307bf14c46d723b2a01

## Build on top of the CUDA-CLuster stack https://github.com/twobombs/cudacluster and deploy-nvidia-docker https://github.com/twobombs/deploy-nvidia-docker WebUI
- WebVNC, CUDA 11.4+ & OpenCL 1.2+ with NV, AMD & Intel HW support

<img width="1435" alt="Screenshot 2021-05-04 at 15 10 27" src="https://user-images.githubusercontent.com/12692227/117008533-21d79280-aceb-11eb-993a-efa7d1123a1f.png">

![Screenshot from 2022-03-15 20-05-42](https://user-images.githubusercontent.com/12692227/158857290-fa4947e1-5792-4444-974e-7deb7c7b24f9.png)

Initial vnc password is 00000000
- noVNC website is avaliable at port 6080 
- xRDP running at port 3389 to vnc 127.0.0.1:5900

## Kibana views with ThereminQ's data 

![Screenshot_from_2022-03-15_19-26-41](https://user-images.githubusercontent.com/12692227/158855774-b6294720-3769-409a-bf96-0945e2af842a.png)


## Deploy an instance of ThereminQ's WebUI controller container and/or select a specific workload type to run on your favorite orchestrator
- docker run --gpus all --privileged -p 6080:6080 -v /var/run/docker.sock:/var/run/docker.sock:ro --device=/dev/dri:/dev/dri -d twobombs/thereminq:controller
- docker run -ti --mount type=bind,source=/var/log/qrack,target=/var/log/qrack twobombs/thereminq bash /root/run-supreme-cpu
- docker run --gpus all --device=/dev/dri:/dev/dri -ti --mount type=bind,source=/var/log/qrack,target=/var/log/qrack twobombs/thereminq bash /root/run-cosmos-gpu1
- use --gpus all for NVidia-Docker hosts, in addition --privileged will expose all GPUs in the system, eg: Intel iGPUs<br> <br>

All specialized workloads are listed in https://github.com/twobombs/thereminq/tree/master/runscripts

![Screenshot from 2021-10-24 17-23-18](https://user-images.githubusercontent.com/12692227/138600777-607fda67-52d5-4e24-9f19-8e30f36ffa29.png)


### Experimental 'bqp=bpp' stabilizer_t_nn high qbit workloads
- docker run --gpus all --device=/dev/dri:/dev/dri -t --mount type=bind,source=/var/log/qrack,target=/var/log/qrack twobombs/thereminq bash /root/run-tnn-gpu1<br> <br>

### Experimental Quantum Inspired Qimcifa high qbit workloads
- docker run --gpus all --device=/dev/dri:/dev/dri --ipc=host -d -p 6080:6080 --mount type=bind,source=/var/log/qimcifa,target=/var/log/qimcifa twobombs/thereminq:qimcifa <br> <br>

#### note: --ipc=host in the docker command is a chrome requirement. If you don't need chrome in the session you can leave this out.

![Screenshot from 2022-05-22 20-43-30](https://user-images.githubusercontent.com/12692227/169710747-32ef4926-0286-487a-b9ed-e8c676b2a43a.png)
C-style Shors' with rsaConverter ( https://www.idrix.fr/Root/content/category/7/28/51/) and Qimcifa ( https://github.com/vm6502q/qimcifa )

### Tips for Managing high-Qubit workloads
- Workloads with full entanglement and/or Quantum simulations that are at or exceed 30+ Qubits
- Mixed workloads based on longer/larger/deeper circuits with partial entanglement that exceed 36+ Qubits<br> <br>

To prevent these workload from taking up all resources of the system it is good to take the following measures

- System memory should be at least 16GB RAM with a minimum of 8 CPU cores
- Start an instance with a limit for memory and/or swap. eg docker: '-m 16g --memory-swap 32g'
- Disable OOM killers in the kernel and/or the container orchestrator
- Docker: '--oom-kill-disable' and/or OOM host change: vm.overcommit_memory = 2 in /etc/sysctl.conf
- Swap should be a dedicated and fast drive where possible NVMe RAID, equal to the bandwith of the GPU/PCIe<br> <br>

### Sycamore & T_NN(-d) Results on an AMD Threadripper 1920x 
- 24 Threads with 24GB RAM, 256GB NVMe Swap on a 3x RAID NVME drive - Tesla K80 2x12GB - Tesla M40 24GB - Ubuntu 20.04/22.04

![Screenshot from 2022-08-07 20-31-33](https://user-images.githubusercontent.com/12692227/183309964-7f94958e-8b78-4953-82e2-1b841f9e716c.png)

M40 + K80 run script https://github.com/twobombs/thereminq/blob/master/runscripts/run-tnn-cube-multi

I did do or helped with some of the coding for glue, speed and data generation. <br>
This stack was made so that you don't need to <br>

If you want to do this without docker but straigh on baremetal here are some gists;

https://gist.github.com/twobombs/c93f9bbf2afe98d795372d024d6b30d7

## Code from the following companies and initiatives are included in this container

![](https://user-images.githubusercontent.com/12692227/57654809-61c07f00-75d5-11e9-9005-38d60d8d4db4.png)

All rights and kudos belong to their respective owners. <br>
If (your) code resides in this container image and you don't want that please let me know. <br>

Code of conduct : Contributor Covenant 
https://github.com/EthicalSource/contributor_covenant
