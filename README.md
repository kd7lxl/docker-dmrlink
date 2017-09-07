This is an example and entirely untested.

## Install Prerequisites

https://docs.docker.com/engine/installation/linux/docker-ce/debian/#install-using-the-repository

## Typical Usage

    docker build -t bridget .
    docker create --name bridget bridget
    docker run --rm --init bridget
