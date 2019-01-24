FROM twobombs/cudacluster

RUN git clone --recursive https://github.com/vm6502q/qrack.git

RUN git clone --recursive https://github.com/SoftwareQuTech/SimulaQron.git

RUN apt-get update && apt-get -y install build-essential wget vim-common opencl-headers

ADD cmake-3.13.3.tar.gz / 

RUN cd  /cmake-3.13.3 && ./configure && make && make install

RUN cd /qrack/include && mkdir CL

COPY cl12.hpp /qrack/include/CL/cl.hpp

RUN # cd /qrack && mkdir _build && cd _build && cmake .. && make all install
