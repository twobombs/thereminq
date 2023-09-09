FROM twobombs/cudacluster

# clone repos
RUN git clone --recursive https://github.com/unitaryfund/qrack.git
RUN cp -r /qrack /qrack128
RUN cp -r /qrack /qrack128cuda
RUN cp -r /qrack /qrack64
RUN cp -r /qrack /qrack16
RUN cp -r /qrack /qrack8
RUN git clone https://github.com/twobombs/thereminq.git && git clone https://github.com/LeventErkok/crackNum.git && git clone https://github.com/pnnl/QASMBench.git

# install features
RUN apt-get update && apt-get -y install build-essential cmake opencl-headers openssh-server wget vim-common opencl-headers curl libfreetype6-dev autotools-dev libicu-dev libbz2-dev libboost-all-dev && apt-get clean all

# fetch cuquantum
RUN apt install cuquantum cuquantum-dev && apt clean all
RUN git clone https://github.com/NVIDIA/cuQuantum.git

# install metricbeat for ES 7.4+
RUN wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add - 
RUN apt-get install apt-transport-https
RUN echo "deb https://artifacts.elastic.co/packages/8.x/apt stable main" | tee -a /etc/apt/sources.list.d/elastic-8.x.list
RUN apt-get update && apt-get install metricbeat filebeat auditbeat && filebeat modules enable elasticsearch && filebeat modules enable system && filebeat modules enable osquery
COPY configfiles/metricbeat.yml /etc/metricbeat/
COPY configfiles/filebeat.yml /etc/filebeat/filebeat.yml
# COPY auditbeat.yml /etc/auditbeat/

# Qrack install & dependancies 
RUN cd /qrack/include && mkdir CL && cd /var/log && mkdir qrack && cd /qrack && mkdir _build && cd _build && cmake -DENABLE_DEVRAND=ON -DFPPOW=5 -DUINTPOW=6 -DQBCAPPOW=6 -DENABLE_COMPLEX_X2=ON -DENABLE_OCL_MEM_GUARDS=ON .. && make -i -k -j 2 all && make install

# 64Qrack install & dependancies
RUN cd /qrack64/include && mkdir CL && cd /qrack64 && mkdir _build && cd _build && cmake -DENABLE_DEVRAND=ON -DFPPOW=6 -DUINTPOW=6 -DQBCAPPOW=7 -DENABLE_COMPLEX_X2=ON -DENABLE_OCL_MEM_GUARDS=ON .. && make -i -k -j 2 all && make install

# SmallQrack install & dependancies
# RUN cd /qrack16/include && mkdir CL && cd /qrack16 && mkdir _build && cd _build && cmake -DENABLE_DEVRAND=ON -DFPPOW=4 -DUINTPOW=5 -DQBCAPPOW=5 -DENABLE_COMPLEX_X2=OFF -DENABLE_OCL_MEM_GUARDS=ON .. && make -i -k -j 2 all && make install

# BigQrack install & dependancies
RUN cd /qrack128/include && mkdir CL && cd /qrack128 && mkdir _build && cd _build && cmake -DENABLE_DEVRAND=ON -DFPPOW=6 -DUINTPOW=6 -DQBCAPPOW=12 -DENABLE_RDRAND=OFF -DENABLE_COMPLEX_X2=ON -DENABLE_OCL_MEM_GUARDS=ON .. && make -i -k -j 2 all && make install

# BigCudaQrack install & dependancies
RUN cd /qrack128cuda/include && mkdir CL && cd /qrack128cuda && mkdir _build && cd _build && cmake -DENABLE_DEVRAND=ON -DFPPOW=6 -DUINTPOW=6 -DQBCAPPOW=12 -DENABLE_RDRAND=OFF -DENABLE_COMPLEX_X2=ON -DENABLE_OCL_MEM_GUARDS=ON -DENABLE_CUDA=ON -DENABLE_OPENCL=OFF .. && make -i -k -j 2 all && make install

# install python3
RUN apt-get install -y python3 python3-pip python3-tk libblas-dev liblapack-dev && pip3 install -U setuptools
# Set a UTF-8 locale - this is needed for some python packages to play nice
RUN apt-get -y install language-pack-en
ENV LANG="en_US.UTF-8"

# install haskell, z3, num-utils, crackNum + dependancies
RUN apt-get install z3 num-utils && apt clean all
RUN curl -sSL https://get.haskellstack.org/ | sh
RUN cd crackNum && stack path --local-bin && stack setup && stack init && stack build && stack install && stack clean && rm -R /crackNum

# node run & benchmark script, make runnable 
COPY runscripts/run* /root/
RUN chmod 744 /root/run*

#cleanup
RUN mkdir /root/logs && mv /var/log/*.log /root/logs/

EXPOSE 22 80 255 8801-8811
ENTRYPOINT /root/run-node
