# QrackNet: Qrack, ProjectQ, SimulaQron on OpenCL

![](https://img.shields.io/docker/automated/jrottenberg/ffmpeg.svg)

- Qrack - Qbit OCL Hardware Emulation Stack > https://github.com/vm6502q/qrack
- ProjectQ - QC Interconnect, Qrack OCL fork > https://github.com/vm6502q/ProjectQ
- SimulaQron - Qbit Networking stack > https://github.com/SoftwareQuTech/SimulaQron
- PennyLane - ProjectQ plugin > https://github.com/XanaduAI/pennylane-pq
- Elastic Search/Lucene Interface for data interconnect

Build on top of CUDA-CLuster
- WebVNC, CUDA 11.0+ & OpenCL 1.2+ with NV, AMD & Intel HW support

Deploy QrackNet worker images by invoking docker worker image
- docker run -d -v /var/log/qrack:/var/log/qrack twobombs:supreme-cpu
- docker run --gpus all --device=/dev/dri:/dev/dri -d -v /var/log/qrack:/var/log/qrack twobombs:cosmos-gpu1

Deploy WebUI controller images by invoking docker controller image
- docker run -p 6080:6080 -d twobombs/qracknet:controller
- docker run --gpus all -p 6080:6080 --device/dev/dri:/dev/dri -d twobombs/qracknet:controller

/me did none of the coding: just created this stack so that you don't need to

Code from the following awesome companies and initiatives are included in this container

![](https://user-images.githubusercontent.com/12692227/57654809-61c07f00-75d5-11e9-9005-38d60d8d4db4.png)

All rights belong to their respective owners.
