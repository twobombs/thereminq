# QrackNet: Qrack, ELK, Tipsy, CUDA and OpenCL

![](https://img.shields.io/docker/automated/jrottenberg/ffmpeg.svg)

QrackNet aims to provide a suite of best-of-class tools designed to extend and visualize the data emanating from Quantum circuits using ELK, Tipsy and Jupyter on CUDA and OpenCL accelerators.

- Qrack - Qbit OCL Hardware Emulation Stack > https://github.com/vm6502q/qrack
- Bonsai - Stellar data visualizer for QFT data and converter > https://github.com/treecode/Bonsai
- Elastic Search/Lucene Interface for data interconnect > https://www.elastic.co/downloads/
- TensorFlow/Board/Projector integrations > https://github.com/twobombs/tensors

Images can be run independantly but are made to work with the vQbit infrastructure HELM repo at https://github.com/twobombs/helm

![Screenshot from 2021-10-24 17-20-59](https://user-images.githubusercontent.com/12692227/138600676-e49722a2-3508-4fc2-a81e-4d5a7a312c2c.png)


Build on top of the CUDA-CLuster stack https://github.com/twobombs/cudacluster an addition to deploy-nvidia-docker https://github.com/twobombs/deploy-nvidia-docker
- WebVNC, CUDA 11.2+ & OpenCL 1.2+ with NV, AMD & Intel HW support

Deploy single instances of QrackNet worker images by directly invoking docker worker images or deploy on your favorite orchestrator
- docker run -d --mount type=bind,source=/var/log/qrack,target=/var/log/qrack twobombs/qracknet:supreme-cpu
- docker run --gpus all --device=/dev/dri:/dev/dri -d --mount type=bind,source=/var/log/qrack,target=/var/log/qrack twobombs/qracknet:cosmos-gpu1

Deploy WebUI controller images by invoking docker controller image,or deploy in similar fashion on your favorite (k8s/k3d/k3s/docker compatible) orchestrator
- docker run --gpus all --privileged -p 6080:6080 -v /var/run/docker.sock:/var/run/docker.sock:ro --device=/dev/dri:/dev/dri -d twobombs/qracknet:controller
* use --gpus all for NVidia-Docker hosts, in addition --privileged will expose all devices, and thus all GPUs in the system, eg: Intel iGPUs

![Screenshot_from_2021-09-25_08-52-34 (1)](https://user-images.githubusercontent.com/12692227/134770011-8db48546-4853-4735-a980-cfc866d1786f.png)


Deploy Bonsai ( https://github.com/treecode/Bonsai ) visualisation - requirements: Running NVidia X, CUDA and NVidia-Docker on host 
- docker run --gpus all -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY -p 6080:6080 -v /run/user/1000/gdm/Xauthority:/root/.Xauthority -h $HOSTNAME twobombs/qracknet:bonsai 

If you get an error similar to "Cannot connect to :0" please look at http://wiki.ros.org/docker/Tutorials/GUI - xhost +local:root


/me did some of the coding: but mainly just created this stack so that you don't need to - this is a work in progess

Code from the following awesome companies and initiatives are included in this container

![](https://user-images.githubusercontent.com/12692227/57654809-61c07f00-75d5-11e9-9005-38d60d8d4db4.png)

All rights and kudos belong to their respective owners.

Code of conduct : Contributor Covenant 
https://github.com/EthicalSource/contributor_covenant
