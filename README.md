## Install Prerequisites

https://docs.docker.com/engine/installation/linux/docker-ce/debian/#install-using-the-repository

## Typical Usage

Create a new container based on the `thayward/dmrlink` image from Docker Hub. It should download automatically. UDP port 55555 from the host is forwarded to port 55555 of the container. Change this to the port you defined in `hblink.cfg`. `hblink.cfg` and `dmrlink.cfg` should be placed in the current directory (or change the path in the command) and will be attached to the container.

    docker create \
        --name bridget \
        -p 55555:55555/udp \
        -v $(pwd)/dmrlink.cfg:/opt/bridge/dmrlink.cfg \
        -v $(pwd)/hblink.cfg:/opt/hblink/hblink.cfg \
        -v $(pwd)/HB_Bridge.cfg:/opt/hblink/HB_Bridge.cfg \
        thayward/dmrlink

You can create as many of these containers as you want to serve multiple instances from one host. Just remember to give them each a unique port number or IP address and name. Here's an example of a second instance:

    docker create \
        --name bridget2 \
        -p 55556:55556/udp \
        -v $(pwd)/dmrlink2.cfg:/opt/bridge/dmrlink.cfg \
        -v $(pwd)/hblink.cfg:/opt/hblink/hblink.cfg \
        -v $(pwd)/HB_Bridge.cfg:/opt/hblink/HB_Bridge.cfg \
        thayward/dmrlink

Start the bridget containers:

    docker start -a bridget
    docker start -a bridget2

`-a` attaches your terminal to the container. This is useful for testing. To instead run it in the background, remove the `-a`:

    docker start bridget

To see what it's doing in the background, use the logs command:

    docker logs bridget

## Configuration

Docker captures output from stdout and stderr, so the recommended log handler is:

    LOG_HANDLERS: console-timed

Since the listen address is forwarded via Docker, there's no need to specify an address in the cfg:

    IP:
