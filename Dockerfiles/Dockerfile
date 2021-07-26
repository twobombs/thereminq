FROM twobombs/cudacluster

# clone repos
RUN git clone --recursive https://github.com/vm6502q/qrack.git
RUN cp -r /qrack /qrack128
RUN git clone --recursive https://github.com/SoftwareQuTech/SimulaQron.git && git clone --recursive https://github.com/vm6502q/ProjectQ.git && git clone --recursive https://github.com/XanaduAI/pennylane-pq.git && git clone https://github.com/twobombs/qracknet.git && git clone https://github.com/N-BodyShop/tipsy.git && git clone https://github.com/LeventErkok/crackNum.git && git clone https://github.com/pnnl/QASMBench.git

# install features
RUN apt-get update && apt-get -y install build-essential cmake openssh-server wget vim-common opencl-headers curl libfreetype6-dev libboost-all-dev && apt-get clean all

# install metricbeat for ES 7.4+
RUN wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add - 
RUN apt-get install apt-transport-https
RUN echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | tee -a /etc/apt/sources.list.d/elastic-7.x.list
RUN apt-get update && apt-get install metricbeat filebeat auditbeat && filebeat modules enable elasticsearch && filebeat modules enable system && filebeat modules enable osquery
COPY configfiles/metricbeat.yml /etc/metricbeat/
COPY configfiles/filebeat.yml /etc/filebeat/filebeat.yml
# COPY auditbeat.yml /etc/auditbeat/

# Qrack install & dependancies 
RUN cd /qrack/include && mkdir CL && cd /var/log && mkdir qrack && cd /qrack && mkdir _build && cd _build && cmake -DFPPOW=5 -DUINTPOW=5 -DQBCAPPOW=5 -DENABLE_COMPLEX_X2=ON -DENABLE_OCL_MEM_GUARDS=OFF .. && make all && make install

# BigQrack install & dependancies
RUN cd /qrack128/include && mkdir CL && cd /qrack128 && mkdir _build && cd _build && cmake -DFPPOW=6 -DUINTPOW=6 -DQBCAPPOW=6 -DENABLE_OCL_MEM_GUARDS=OFF .. && make all && make install

# install python3
RUN apt-get install -y python3 python3-pip python3-tk libblas-dev liblapack-dev && pip3 install -U setuptools
# Set a UTF-8 locale - this is needed for some python packages to play nice
RUN apt-get -y install language-pack-en
ENV LANG="en_US.UTF-8"

# install haskell, z3, num-utils, crackNum + dependancies
RUN apt-get install z3 num-utils
RUN curl -sSL https://get.haskellstack.org/ | sh
RUN cd crackNum && stack path --local-bin && stack setup && stack init && stack build && stack install && stack clean

# ProjectQ install
# pybind11 workaround
RUN pip3 install pybind11 
# rebuild workaround
RUN cd /ProjectQ && pip3 install --user .
# fails in 20.04
# RUN cd /ProjectQ && pip3 install --user  --global-option="--with-qracksimulator" .

# Install SimulaQron 
RUN pip3 install simulaqron

# Install IBM QC connector
RUN pip3 install -U IBMQuantumExperience

# set default backend to projectq instead of the default
RUN simulaqron set backend projectq

# Install pennylane
RUN pip3 install pennylane_pq
# RUN cd /pennylane-pq && make test

# Install Qiskit
RUN pip3 install qiskit

# node run & benchmark script, make runnable 
COPY runscripts/runcosmosdockergpu.sh /root/
COPY runscripts/run-* /root/

RUN chmod 744 /root/runcosmosdockergpu.sh && chmod 744 /root/run-*

#cleanup
RUN mkdir /root/logs && mv /var/log/*.log /root/logs/

EXPOSE 22 80 8801-8811

ENTRYPOINT /root/run-node