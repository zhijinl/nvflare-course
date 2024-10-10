ARG BASE_IMAGE=nvcr.io/nvidia/cuda:12.6.0-cudnn-devel-ubuntu24.04
FROM ${BASE_IMAGE}

ENV DEBIAN_FRONTEND=noninteractive
ENV NVIDIA_DRIVER_CAPABILITIES graphics,video,compute,utility

# Install Python3.10, FLARE supports Python3.8, 9, 10
RUN apt update && apt-get install -y software-properties-common
RUN add-apt-repository -y ppa:deadsnakes/ppa

RUN apt update && apt install -y python3.10 python3-pip git tree

RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.10 1
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3.10 1

# Clone & install latest nvflare
RUN git clone https://github.com/NVIDIA/NVFlare.git
RUN cd /NVFlare && pip install -e . --break-system-packages

# install jupyter-lab
RUN pip install jupyter --break-system-packages
