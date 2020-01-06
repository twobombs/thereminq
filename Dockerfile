FROM twobombs/cudacluster

# clone repos
RUN git clone --recursive https://github.com/vm6502q/qrack.git
RUN git clone --recursive https://github.com/SoftwareQuTech/SimulaQron.git
RUN git clone --recursive https://github.com/vm6502q/ProjectQ.git
RUN git clone --recursive https://github.com/XanaduAI/pennylane-pq.git

# install features
RUN apt-get update && apt-get -y install build-essential cmake openssh-server wget vim-common pocl-opencl-icd opencl-headers curl libfreetype6-dev && apt-get clean all

# install metricbeat for ES 7.4+
RUN wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add - 
RUN apt-get install apt-transport-https
RUN echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | tee -a /etc/apt/sources.list.d/elastic-7.x.list
RUN apt-get update && apt-get install metricbeat filebeat auditbeat && filebeat modules enable elasticsearch && filebeat modules enable system && filebeat modules enable osquery
COPY metricbeat.yml /etc/metricbeat/
COPY filebeat.yml /etc/filebeat/filebeat_new.yml
# COPY auditbeat.yml /etc/auditbeat/

# Qrack install & dependancies 
RUN cd /qrack/include && mkdir CL
RUN cd /qrack && mkdir _build && cd _build && cmake -DENABLE_COMPLEX8=OFF .. && make all && make install

# install python3
RUN apt-get install -y python3 python3-pip python3-tk
# Set a UTF-8 locale - this is needed for some python packages to play nice
RUN apt-get -y install language-pack-en
ENV LANG="en_US.UTF-8"

# ProjectQ install
# pybind11 workaround
RUN pip3 install pybind11
# rebuild workaround
RUN cd /ProjectQ && pip3 install --user .
RUN cd /ProjectQ && pip3 install --user  --global-option="--with-qracksimulator" .

# Install SimulaQron 
RUN pip3 install simulaqron

# set default backend to projectq instead of the default
RUN simulaqron set backend projectq

# Install pennylane
RUN pip3 install pennylane_pq
# RUN cd /pennylane-pq && make test

# Install Qiskit
RUN pip3 install qiskit

# install Gdrive upload tool
RUN wget https://github.com/gdrive-org/gdrive/releases/download/2.1.0/gdrive-linux-x64 && chmod +x gdrive-linux-x64

# install AWS s3 tooling
RUN wget -O- -q https://s3tools.org/repo/deb-all/stable/s3tools.key | apt-key add -
RUN wget https://s3tools.org/repo/deb-all/stable/s3tools.list -O /etc/apt/sources.list.d/s3tools.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys A9B1F3ED19ED2FDED5A5FBC6D49459D8C762B6E6
# RUN apt-get update && apt install s3cmd

# node run & benchmark script, make runnable 
COPY run-node /root/
RUN chmod 744 /root/run-node
#cleanup
RUN mkdir /root/logs && mv /var/log/*.log /root/logs/

EXPOSE 22 80 8801-8811

ENTRYPOINT /root/run-node
