#!/bin/bash
# this script will build vramfs that will be invoked by some of the swap vram buffer scripts 

apt install -y flex libncurses-dev bison libelf-dev libssl-dev linux-source make build-essential
apt install -y libfuse3-dev opencl-headers ocl-icd-opencl-dev 
apt clean all && ln /usr/bin/fusermount /usr/bin/fusermount3
git clone https://github.com/Overv/vramfs.git && cd vramfs && make 
