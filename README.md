This is an example and entirely untested.

## Install Prerequisites

https://docs.docker.com/engine/installation/linux/docker-ce/debian/#install-using-the-repository

## Typical Usage

Build an image out of the included Dockerfile:

    docker build -t bridget .

Create a new container based on the new image. Port 50000 from the host is forwarded to port 50000 of the container. Change this to your desired port. `hblink.cfg` and `dmrlink.cfg` should be placed in this folder and will be attached to the container. Use 127.0.0.1 as the IP address in your configuration files. Docker will handle forwarding from the host port to the conatiner's port on localhost.

    docker create \
        --name bridget \
        -p 50000:50000 \
        -v $(pwd)/hblink.cfg:/opt/hblink/hblink.cfg \
        -v $(pwd)/dmrlink.cfg:/opt/dmrlink/bridge/dmrlink.cfg \
        bridget

Start the bridget container:

    docker start -a bridget
