FROM twobombs/cudacluster

# clone repos
RUN git clone --recursive https://github.com/vm6502q/qrack.git
RUN git clone --recursive https://github.com/SoftwareQuTech/SimulaQron.git

# install features
RUN apt-get update && apt-get -y install build-essential cmake wget vim-common opencl-headers curl && apt-get clean all

# install metricbeat for ES 6.5.4
RUN curl -L -O https://artifacts.elastic.co/downloads/beats/metricbeat/metricbeat-7.0.0-beta1-amd64.deb && dpkg -i metricbeat-7.0.0-beta1-amd64.deb && rm metricbeat-7.0.0-beta1-amd64.deb

# Qrack install & dependancies 
RUN cd /qrack/include && mkdir CL
COPY cl12.hpp /qrack/include/CL/cl.hpp
RUN cd /qrack && mkdir _build && cd _build && cmake .. && make all && make install

# SimulaQron install dependancies ( from Dockerfile@SimulaQron )
# Install Rust and cargo
RUN apt-get install -y rustc cargo && apt-get clean all

# Install Python 3 and link as default
RUN apt-get install -y python3.6 python3-pip python3-tk
RUN rm /usr/bin/python && ln -s /usr/bin/python3 /usr/bin/python && ln -s /usr/bin/pip3 /usr/bin/pip
RUN apt-get -y install language-pack-en && apt-get clean all
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

# Fetch rustLib dependencies and cleanup install
RUN cd /SimulaQron/cqc/rustLib && cargo update && cd /workspace && rm -rf SimulaQron && ln -s /SimulaQron /workspace/SimulaQron

# Setup the necessary environment variables
ENV NETSIM=$WORKSPACE/SimulaQron
ENV PYTHONPATH=$WORKSPACE:$PYTHONPATH

EXPOSE 8801-8811
 
