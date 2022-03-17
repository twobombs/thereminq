# Orchestrating Qrack, ELK, Bonsai and Tipsy
<img width="200" alt="ThereminQ" src="https://user-images.githubusercontent.com/12692227/147117984-86c4b4b6-d55d-41ba-aab8-f056a6403902.gif">

![](https://img.shields.io/docker/automated/jrottenberg/ffmpeg.svg)

[![ThereminQ data demo #1](http://img.youtube.com/vi/CgvKkK4-OlE/0.jpg)](https://youtu.be/CgvKkK4-OlE "ThereminQ data demo #1")

ThereminQ orchestrates a suite of best-of-class tools designed to control, extend and visualize data emanating to and from Quantum circuits using Qrack, ELK, Tipsy and Jupyter on CUDA and OpenCL accelerators.

- Qrack - Qbit OCL Hardware Emulation Stack > https://github.com/vm6502q/qrack
- Bonsai - Stellar data visualizer for QFT data and converter > https://github.com/treecode/Bonsai
- Elastic Search/Lucene Interface for data interconnect > https://www.elastic.co/downloads/
- TensorFlow/Board/Projector integrations > https://github.com/twobombs/tensors

Images can be run independantly but are made to work with the vQbit infrastructure HELM repo at https://github.com/twobombs/helm

![Screenshot from 2021-10-24 17-20-59](https://user-images.githubusercontent.com/12692227/138600676-e49722a2-3508-4fc2-a81e-4d5a7a312c2c.png)
![Screenshot_from_2022-03-15_19-26-41](https://user-images.githubusercontent.com/12692227/158855774-b6294720-3769-409a-bf96-0945e2af842a.png)


## Build on top of the CUDA-CLuster stack https://github.com/twobombs/cudacluster an addition to deploy-nvidia-docker https://github.com/twobombs/deploy-nvidia-docker
- WebVNC, CUDA 11.2+ & OpenCL 1.2+ with NV, AMD & Intel HW support

<img width="1435" alt="Screenshot 2021-05-04 at 15 10 27" src="https://user-images.githubusercontent.com/12692227/117008533-21d79280-aceb-11eb-993a-efa7d1123a1f.png">

![Screenshot from 2022-03-15 20-05-42](https://user-images.githubusercontent.com/12692227/158857290-fa4947e1-5792-4444-974e-7deb7c7b24f9.png)


Initial vnc password is 00000000 - noVNC website is avaliable at port 6080

## Deploy an instance of ThereminQ's WebUI controller container and/or select a specific workload type to run on your favorite orchestrator
- docker run --gpus all --privileged -p 6080:6080 -v /var/run/docker.sock:/var/run/docker.sock:ro --device=/dev/dri:/dev/dri -d twobombs/thereminq:controller
- docker run -d --mount type=bind,source=/var/log/qrack,target=/var/log/qrack twobombs/thereminq:supreme-cpu
- docker run --gpus all --device=/dev/dri:/dev/dri -d --mount type=bind,source=/var/log/qrack,target=/var/log/qrack twobombs/thereminq:cosmos-gpu1
- use --gpus all for NVidia-Docker hosts, in addition --privileged will expose all GPUs in the system, eg: Intel iGPUs<br> <br>

![Screenshot from 2021-10-24 17-23-18](https://user-images.githubusercontent.com/12692227/138600777-607fda67-52d5-4e24-9f19-8e30f36ffa29.png)


### Experimental  'bqp=bpp' stabilizer_t_nn high qbit workload
- docker run --gpus all --device=/dev/dri:/dev/dri -d --mount type=bind,source=/var/log/qrack,target=/var/log/qrack twobombs/thereminq:tnn-gpu1<br> <br>

### Tips for Managing high-Qubit workloads
- Workloads with full entanglement and/or Quantum simulations that are at or exceed 30+ Qubits
- Mixed workloads based on longer/larger/deeper circuits with partial entanglement that exceed 36+ Qubits<br> <br>

To prevent these workload from taking up all resources of the system it is good to take the following measures

- System memory should be at least 16GB RAM with a minimum of 8 CPU cores
- Start an instance with a limit for memory and/or swap. eg docker: '-m 16g --memory-swap 32g'
- Disable OOM killers in the kernel and/or the container orchestrator
- Docker: '--oom-kill-disable' and/or OOM host change: vm.overcommit_memory = 2 in /etc/sysctl.conf
- Swap should be a dedicated and fast drive where possible NVMe RAID, equal to the bandwith of the GPU/PCIe<br> <br>

### T_NN-d Results on AMD Threadripper 1920x with 24GB RAM and a Tesla K80 24GB
![Screenshot from 2022-03-06 13-12-53](https://user-images.githubusercontent.com/12692227/156922673-f563cdfc-1a66-4e67-a5e9-ea557ab7bc5d.png)

I did do or helped with some of the coding for glue, speed and data generation: however, this stack was made so that you don't need to <br>
- this is a work in progess

## Code from the following awesome companies and initiatives are included in this container

![](https://user-images.githubusercontent.com/12692227/57654809-61c07f00-75d5-11e9-9005-38d60d8d4db4.png)

All rights and kudos belong to their respective owners.

Code of conduct : Contributor Covenant 
https://github.com/EthicalSource/contributor_covenant
