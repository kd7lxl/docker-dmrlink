FROM debian

RUN apt-get update && \
    apt-get install -y \
      git tcpdump dnsutils unzip python-dev python-pip python-twisted procps

WORKDIR /opt
RUN git clone https://github.com/n0mjs710/dmr_utils.git
RUN pip install -e dmr_utils

RUN git clone -b IPSC_Bridge https://github.com/n0mjs710/DMRlink.git bridge
RUN git clone -b HB_Bridge https://github.com/n0mjs710/HBlink.git hblink
RUN chmod +x hblink/HB_Bridge.py bridge/IPSC_Bridge.py

COPY init.sh init.sh
CMD ./init.sh
