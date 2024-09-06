ARG BASE_IMAGE=nvcr.io/nvidia/cuda:12.6.0-cudnn-devel-ubuntu24.04
FROM ${BASE_IMAGE}

ENV DEBIAN_FRONTEND=noninteractive
ENV NVIDIA_DRIVER_CAPABILITIES graphics,video,compute,utility

RUN apt update && apt-get install -y python3.10 python3-pip git

# Create the FLARE workspace and clone NVFlare GitHub repo
RUN mkdir /flare
WORKDIR /flare
RUN git clone https://github.com/NVIDIA/NVFlare.git

# Install latest nvflare and monai from dev source
WORKDIR /flare/NVFlare
RUN pip install -e . --break-system-packages

# install jupyter-lab
RUN pip install jupyter --break-system-packages

WORKDIR /flare

RUN update-alternatives  --set python /usr/bin/python3.10
