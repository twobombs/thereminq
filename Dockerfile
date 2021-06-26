FROM twobombs/cudacluster

# clone repos
RUN git clone --recursive https://github.com/vm6502q/qrack.git
RUN cp -r /qrack /qrack128
RUN git clone --recursive https://github.com/SoftwareQuTech/SimulaQron.git
RUN git clone --recursive https://github.com/vm6502q/ProjectQ.git
RUN git clone --recursive https://github.com/XanaduAI/pennylane-pq.git
RUN git clone https://github.com/twobombs/qracknet.git
RUN git clone https://github.com/N-BodyShop/tipsy.git
RUN git clone https://github.com/LeventErkok/crackNum.git

# install features
RUN apt-get update && apt-get -y install build-essential cmake openssh-server wget vim-common opencl-headers curl libfreetype6-dev libboost-all-dev && apt-get clean all

# install metricbeat for ES 7.4+
RUN wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add - 
RUN apt-get install apt-transport-https
RUN echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | tee -a /etc/apt/sources.list.d/elastic-7.x.list
RUN apt-get update && apt-get install metricbeat filebeat auditbeat && filebeat modules enable elasticsearch && filebeat modules enable system && filebeat modules enable osquery
COPY metricbeat.yml /etc/metricbeat/
COPY filebeat.yml /etc/filebeat/filebeat.yml
# COPY auditbeat.yml /etc/auditbeat/

# Qrack install & dependancies 
RUN cd /qrack/include && mkdir CL && cd /var/log && mkdir qrack
RUN cd /qrack && mkdir _build && cd _build && cmake -DFPPOW=5 -DUINTPOW=5 -DQBCAPPOW=5 -DENABLE_COMPLEX_X2=ON -DENABLE_OCL_MEM_GUARDS=OFF .. && make all && make install

# BigQrack install & dependancies
RUN cd /qrack128/include && mkdir CL
RUN cd /qrack128 && mkdir _build && cd _build && cmake -DENABLE_COMPLEX8=OFF -DENABLE_COMPLEX_X2=ON -DQBCAPPOW=6 -DENABLE_OCL_MEM_GUARDS=OFF .. && make all && make install

# install python3
RUN apt-get install -y python3 python3-pip python3-tk libblas-dev liblapack-dev
RUN pip3 install -U setuptools
# Set a UTF-8 locale - this is needed for some python packages to play nice
RUN apt-get -y install language-pack-en
ENV LANG="en_US.UTF-8"

# install haskell, crackNum + dependancies
RUN apt-get install z3 
RUN curl -sSL https://get.haskellstack.org/ | sh
RUN cd crackNum && stack setup && stack build && stack init && stack build

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
# RUN pip3 install qiskit

# node run & benchmark script, make runnable 
COPY runcosmosdockergpu.sh /root/
COPY run-node /root/
COPY run-bonsai /root/
COPY run-cosmos /root/
COPY run-cosmos-cpu /root/
COPY run-cosmos-gpu2 /root/
COPY run-cosmos-multi /root/
COPY run-qft /root/
COPY run-qft-cpu /root/
COPY run-qft-gpu2 /root/
COPY run-qft-multi /root/
COPY run-supreme /root/
COPY run-supreme-cpu /root/
COPY run-supreme-gpu2 /root/
COPY run-supreme-multi /root/
COPY run-cosmos-nbody-cpu /root/
COPY run-cosmos-nbody-gpu1 /root/
COPY run-cosmos-nbody-gpu2 /root/
COPY run-cosmos-nbody-multi /root/

RUN chmod 744 /root/runcosmosdockergpu.sh
RUN chmod 744 /root/run-node
RUN chmod 744 /root/run-bonsai
RUN chmod 744 /root/run-cosmos
RUN chmod 744 /root/run-cosmos-cpu
RUN chmod 744 /root/run-cosmos-gpu2
RUN chmod 744 /root/run-cosmos-multi
RUN chmod 744 /root/run-qft
RUN chmod 744 /root/run-qft-cpu
RUN chmod 744 /root/run-qft-gpu2
RUN chmod 744 /root/run-qft-multi
RUN chmod 744 /root/run-supreme
RUN chmod 744 /root/run-supreme-cpu
RUN chmod 744 /root/run-supreme-gpu2
RUN chmod 744 /root/run-supreme-multi
RUN chmod 744 /root/run-cosmos-nbody-cpu
RUN chmod 744 /root/run-cosmos-nbody-gpu1
RUN chmod 744 /root/run-cosmos-nbody-gpu2
RUN chmod 744 /root/run-cosmos-nbody-multi

#cleanup
RUN mkdir /root/logs && mv /var/log/*.log /root/logs/

EXPOSE 22 80 8801-8811

ENTRYPOINT /root/run-node
