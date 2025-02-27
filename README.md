# ThereminQ - CLassiQ
## Orchestrating Qrack, Bonsai, Qimcifa and Tipsy in OpenCL, VCL and CUDA 

<img width="1000" alt="ThereminQ" src="https://github.com/twobombs/thereminq-tensors/assets/12692227/a299e650-6513-43d1-afab-ba036aa5e12e">

![](https://img.shields.io/docker/automated/jrottenberg/ffmpeg.svg)

[![ThereminQ data demo #1](https://img.youtube.com/vi/CgvKkK4-OlE/0.jpg)](https://youtu.be/CgvKkK4-OlE "ThereminQ data demo #1")

-------------

### ThereminQ orchestrates a suite of best-of-class tools designed to control, extend and visualize data emanating to and from Quantum circuits using Qrack, Tipsy and Jupyter on CUDA and OpenCL accelerators.

- [Qrack - Qbit OpenCL Hardware Emulation Stack](https://github.com/vm6502q/qrack)
- [Bonsai - Stellar data visualizer for QFT, Sycamore, TNN_d and SDRP validation](https://github.com/treecode/Bonsai)
- [Qimcifa - Quantum-inspired Monte Carlo integer factoring algorithm](https://github.com/vm6502q/qimcifa)

Look also at the following Python enabled images
- [VDI with a collection of QC Jupiter notebooks](https://github.com/twobombs/thereminq-tensors)
- [Factoring with Shors' and Qimcifa](https://github.com/twobombs/thereminq-tensors/blob/master/README.md#shors-rsa-ssh-keypair-factorization-and-2-primes-test-loop)

Other tags contain
- [QUDA](http://lattice.github.io/quda/)
- [cuQuantum](https://developer.nvidia.com/cuquantum-sdk) with [QSVM](https://github.com/Tim-Li/cuTN-QSVM)

```bash
docker run --gpus all \
--privileged \ 
-p 6080:6080 \
--device=/dev/dri:/dev/dri \
-d twobombs/thereminq[:tag]
```

Images can be run independant but are also made to work with the vQbit infrastructure K8s HELM [repo](https://github.com/twobombs/helm)

Installation setup and usage scenarios can be glanced at [here](https://gist.github.com/twobombs/bb38050e84331307bf14c46d723b2a01)

-------------

### Build on  [deploy-nvidia-docker](https://github.com/twobombs/deploy-nvidia-docker) and [CUDA-CLuster](https://github.com/twobombs/cudacluster )
- WebVNC, CUDA 12+ & OpenCL 1.2+ with NV, AMD & Intel HW support

<img width="1435" alt="Screenshot 2021-05-04 at 15 10 27" src="https://user-images.githubusercontent.com/12692227/117008533-21d79280-aceb-11eb-993a-efa7d1123a1f.png">

Initial vnc password is `00000000`
- noVNC website is avaliable at port `6080` 
- xRDP running at port `3389` to vnc `127.0.0.1:5900`

-------------

### Docker: deploy an instance of ThereminQ's WebUI controller container
```bash
docker run --gpus all \
--privileged \ 
-p 6080:6080 \
--device=/dev/dri:/dev/dri \
--mount type=bind,source=/var/log/qrack,target=/var/log/qrack \
-d twobombs/thereminq:controller
```
```bash
docker run -ti \
--mount type=bind,source=/var/log/qrack,target=/var/log/qrack \
twobombs/thereminq bash /root/run-supreme-cpu
```
```bash
docker run --gpus all \
--device=/dev/dri:/dev/dri \
-ti \
--mount type=bind,source=/var/log/qrack,target=/var/log/qrack twobombs/thereminq bash /root/run-cosmos-gpu1
```

- use `--gpus all` for NVidia-Docker hosts, in addition `--privileged` and `--device=/dev/dri:/dev/dri` will expose all GPUs in the system, eg: AMD/Intel iGPUs<br> <br>

All specialized workloads are listed [here](https://github.com/twobombs/thereminq/tree/master/runscripts)

![Screenshot from 2021-10-24 17-23-18](https://user-images.githubusercontent.com/12692227/138600777-607fda67-52d5-4e24-9f19-8e30f36ffa29.png)

-------------

### Experimental `bqp=bpp stabilizer_t_nn` 30+ qbit workloads
```bash
docker run --gpus all \
--device=/dev/dri:/dev/dri \
-ti \
--mount type=bind,source=/var/log/qrack,target=/var/log/qrack twobombs/thereminq bash /root/run-tnn-gpu1
```

### Quantum Inspired Qimcifa high qbit workloads - [Qrackmin](https://github.com/twobombs/qrackmin)
```bash
docker run --gpus all \
--device=/dev/dri:/dev/dri \
-d twobombs/thereminq:qimcifa 
 ```
 ![Screenshot from 2024-03-03 12-51-11](https://github.com/twobombs/thereminq/assets/12692227/1e5bc408-34a8-4306-b469-e36d0eb8ff08)


-------------

### Tips for Managing high-Qubit and/or high-Node statevector workloads
- Workloads with full entanglement and/or Quantum simulations that are at or exceed 30+ Qubits
- Mixed workloads based on longer/larger/deeper circuits with partial entanglement that exceed 36+ Qubits<br> <br>

To prevent these workload from taking up all resources of the system it is good to take the following measures

- System memory should be at least the amount of RAM where the statevector will fit into
- From 30 qubits ( eg: QFT ) count 8GB RAM Memory (and 4 cores with `POCL`) doubling every additional qubit 
- Start an instance with a limit for memory and/or swap. eg docker: `-m 16g --memory-swap 32g`
- Disable OOM killers in the kernel and/or the container orchestrator ( `--oom-kill-disable` )
- OOM host change: add `vm.overcommit_memory = 1` and `vm.oom-kill = 0` in `/etc/sysctl.conf`
- Swap should be a dedicated and fast drive where possible NVMe RAID, random IO equal to the bandwith of the GPU/PCIe<br> <br>

-------------

### Sycamore, QFT & T_NN(-d) Results on an AMD Threadripper 1920X@4.2Ghz
- 24 Threads with 32GB RAM, 2.5TB NVMe Swap on a 11x RAID NVME drive - Tesla K80 24GB - Tesla M40 24GB [results](https://docs.google.com/spreadsheets/d/1u2Qum9W768rMWIoKlz658i1P6RTmX1ekgartNMHuR-s)

- M40 + K80 [run script](https://github.com/twobombs/thereminq/blob/master/runscripts/run-tnn-cube-multi)

### If you want to reproduce these results here are some gists to help you along

- [Install Guide](https://gist.github.com/twobombs/c93f9bbf2afe98d795372d024d6b30d7)
- [Recommendations](https://gist.github.com/twobombs/eee53194f7c3e00332b555bad0ae2ade)
- [Runtime](https://gist.github.com/twobombs/9d9ec5d6fbca4b960b1df1f6e147b038)

Note: it is wise to run the benchmarks program inside a main memory limited container with outflow to fast swap so that the system remains stable at intensive runs and high memory peaks - with [fast swap we mean FAST NVME RAID0 swap](https://github.com/twobombs/thereminq/blob/master/NVME%20RAID0%20swap%20caching%20on%20(V)RAM.pdf)

-------------

### To run ThereminQ as a VirtualCL controller 
#### note: create the underlying directory structure as mentioned in [the VCL readme of Qrackmin](https://github.com/twobombs/qrackmin#vcl-qrackdocker)
eg: 
```bash
docker run \
--gpus all \
--device=/dev/dri:/dev/dri \
-d \
--mount type=bind,source=/var/log/vcl,target=/var/log/vcl \
--mount type=bind,source=/var/log/qrack,target=/var/log/qrack twobombs/thereminq:vcl-controller
```
-------------

### Questions / Remarks / Ideas / Experiences - [In Discord](https://discord.gg/GHAC2kRfEH)

## Code from the following companies and initiatives are in this container

![](https://user-images.githubusercontent.com/12692227/57654809-61c07f00-75d5-11e9-9005-38d60d8d4db4.png)

All rights and kudos belong to their respective owners. <br>
If (your) code resides in this container image and you don't want that please let me know. <br>

[Code of conduct : Contributor Covenant](https://github.com/EthicalSource/contributor_covenant)
