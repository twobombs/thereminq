FROM twobombs/cudacluster

# clone repos
RUN git clone --recursive https://github.com/vm6502q/qrack.git
RUN git clone --recursive https://github.com/SoftwareQuTech/SimulaQron.git

# install features
RUN apt-get update && apt-get -y install build-essential cmake wget vim-common opencl-headers

# ADD cmake-3.13.3.tar.gz / 
# RUN cd  /cmake-3.13.3 && ./configure && make && make install

# Qrack install & dependancies 
RUN cd /qrack/include && mkdir CL
COPY cl12.hpp /qrack/include/CL/cl.hpp
RUN cd /qrack && mkdir _build && cd _build && cmake .. && make all && make install

# SimulaQron install dependancies ( from Dockerfile@SimulaQron )
# Install Rust and cargo
RUN apt-get install -y rustc cargo

# Install Python 3
RUN apt-get install -y python3 python3-pip python3-tk
# RUN ln -s /usr/bin/python3 /usr/bin/python
RUN ln -s /usr/bin/pip3 /usr/bin/pip
RUN apt-get -y install language-pack-en
ENV LANG="en_US.UTF-8"

# Add the working directory
ARG WORKSPACE=/workspace
ADD . $WORKSPACE/SimulaQron
WORKDIR $WORKSPACE/SimulaQron

# SimulaQron dependencies
# projectq fails to install without pybind11 pre-installed
# qutip is also badly behaved so installed separately
RUN pip install pybind11
RUN cat ./SimulaQron/requirements.txt | sed /qutip/d | xargs pip install
RUN pip install qutip

# Fetch rustLib dependencies
RUN cd /SimulaQron/cqc/rustLib && cargo update

# Setup the necessary environment variables
ENV NETSIM=$WORKSPACE/SimulaQron
ENV PYTHONPATH=$WORKSPACE:$PYTHONPATH
