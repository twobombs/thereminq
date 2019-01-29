FROM twobombs/cudacluster

# clone repos
RUN git clone --recursive https://github.com/vm6502q/qrack.git
RUN git clone --recursive https://github.com/SoftwareQuTech/SimulaQron.git

# install features
RUN apt-get update && apt-get -y install build-essential cmake wget vim-common opencl-headers

# Qrack install & dependancies 
RUN cd /qrack/include && mkdir CL
COPY cl12.hpp /qrack/include/CL/cl.hpp
RUN cd /qrack && mkdir _build && cd _build && cmake .. && make all && make install

# SimulaQron install dependancies ( from Dockerfile@SimulaQron )
# Install Rust and cargo
RUN apt-get install -y rustc cargo

# Install Python 3 and link as default
RUN apt-get install -y python3.6 python3-pip python3-tk
RUN rm /usr/bin/pyhton && rm /usr/bin/pip && ln -s /usr/bin/python3 /usr/bin/python && ln -s /usr/bin/pip3 /usr/bin/pip
RUN apt-get -y install language-pack-en
ENV LANG="en_US.UTF-8"

# Add the working directory
ARG WORKSPACE=/workspace
ADD . $WORKSPACE/SimulaQron
WORKDIR $WORKSPACE/SimulaQron

# SimulaQron dependencies
# projectq fails to install without pybind11 pre-installed
# qutip is also badly behaved so installed separately
RUN python3.6 -m pip install pybind11
RUN python3.6 -m pip install black
RUN cd /SimulaQron && cat ./requirements.txt | sed /qutip/d | xargs python3.6 -m pip install
RUN python3.6 -m pip install qutip

# Fetch rustLib dependencies
RUN cd /SimulaQron/cqc/rustLib && cargo update

# Setup the necessary environment variables
ENV NETSIM=$WORKSPACE/SimulaQron
ENV PYTHONPATH=$WORKSPACE:$PYTHONPATH
