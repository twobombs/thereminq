# Orchestrating Qrack, ELK, Bonsai and Tipsy
<img width="200" alt="ThereminQ" src="https://user-images.githubusercontent.com/12692227/147117984-86c4b4b6-d55d-41ba-aab8-f056a6403902.gif">

![](https://img.shields.io/docker/automated/jrottenberg/ffmpeg.svg)

ThereminQ orchestrates a suite of best-of-class tools designed to control, extend and visualize data emanating from Quantum circuits using Qrack, ELK, Tipsy and Jupyter on CUDA and OpenCL accelerators.

- Qrack - Qbit OCL Hardware Emulation Stack > https://github.com/vm6502q/qrack
- Bonsai - Stellar data visualizer for QFT data and converter > https://github.com/treecode/Bonsai
- Elastic Search/Lucene Interface for data interconnect > https://www.elastic.co/downloads/
- TensorFlow/Board/Projector integrations > https://github.com/twobombs/tensors

Images can be run independantly but are made to work with the vQbit infrastructure HELM repo at https://github.com/twobombs/helm

![Screenshot from 2021-10-24 17-20-59](https://user-images.githubusercontent.com/12692227/138600676-e49722a2-3508-4fc2-a81e-4d5a7a312c2c.png)

## Build on top of the CUDA-CLuster stack https://github.com/twobombs/cudacluster an addition to deploy-nvidia-docker https://github.com/twobombs/deploy-nvidia-docker
- WebVNC, CUDA 11.2+ & OpenCL 1.2+ with NV, AMD & Intel HW support

<img width="1435" alt="Screenshot 2021-05-04 at 15 10 27" src="https://user-images.githubusercontent.com/12692227/117008533-21d79280-aceb-11eb-993a-efa7d1123a1f.png">

## Deploy an instance of ThereminQ's WebUI controller container and/or select a specific workload type to run on your favorite orchestrator
- docker run --gpus all --privileged -p 6080:6080 -v /var/run/docker.sock:/var/run/docker.sock:ro --device=/dev/dri:/dev/dri -d twobombs/thereminq:controller
- docker run -d --mount type=bind,source=/var/log/qrack,target=/var/log/qrack twobombs/thereminq:supreme-cpu
- docker run --gpus all --device=/dev/dri:/dev/dri -d --mount type=bind,source=/var/log/qrack,target=/var/log/qrack twobombs/thereminq:cosmos-gpu1 <br> <br>
use --gpus all for NVidia-Docker hosts, in addition --privileged will expose all GPUs in the system, eg: Intel iGPUs


![Screenshot from 2021-10-24 17-23-18](https://user-images.githubusercontent.com/12692227/138600777-607fda67-52d5-4e24-9f19-8e30f36ffa29.png)

Initial vnc password is 00000000 - noVNC website is avaliable at port 6080

## Deploy Bonsai ( https://github.com/treecode/Bonsai ) visualisation - requirements: Running NVidia X, CUDA and NVidia-Docker on host 
- docker run --gpus all -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY -p 6080:6080 -v /run/user/1000/gdm/Xauthority:/root/.Xauthority -h $HOSTNAME twobombs/thereminq:bonsai 

If you get an error similar to "Cannot connect to :0" please look at http://wiki.ros.org/docker/Tutorials/GUI - xhost +local:root

Images by ThereminQ's Tipsy visualisation scripts can be viewed and downloaded at https://github.com/twobombs/thereminq-graphs

![Screenshot_from_2021-09-25_08-52-34 (1)](https://user-images.githubusercontent.com/12692227/134770011-8db48546-4853-4735-a980-cfc866d1786f.png)
![Screenshot from 2021-11-10 14-01-38](https://user-images.githubusercontent.com/12692227/141146591-1f7a8684-bdab-4b43-92d0-0f262d44a5d8.png)


I did do or helped with some of the coding for glue, speed and data generation: however, this stack was made so that you don't need to <br>
- this is a work in progess

## Code from the following awesome companies and initiatives are included in this container

![](https://user-images.githubusercontent.com/12692227/57654809-61c07f00-75d5-11e9-9005-38d60d8d4db4.png)

All rights and kudos belong to their respective owners.

Code of conduct : Contributor Covenant 
https://github.com/EthicalSource/contributor_covenant
