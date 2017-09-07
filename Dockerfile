FROM debian

RUN apt-get update && \
    apt-get install -y \
      git tcpdump dnsutils unzip python-dev python-pip python-twisted procps

WORKDIR /opt
RUN git clone https://github.com/n0mjs710/dmr_utils.git
WORKDIR dmr_utils
RUN pip install .

WORKDIR /opt/dmrlink
RUN git clone -b IPSC_Bridge https://github.com/n0mjs710/DMRlink.git bridge

WORKDIR /opt
RUN git clone -b HB_Bridge https://github.com/n0mjs710/HBlink.git hblink

RUN chmod +x hblink/HB_Bridge.py dmrlink/bridge/IPSC_Bridge.py

COPY init.sh init.sh
CMD ./init.sh
