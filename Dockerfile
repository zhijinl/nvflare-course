ARG BASE_IMAGE=nvcr.io/nvidia/cuda:12.6.0-cudnn-devel-ubuntu24.04
FROM ${BASE_IMAGE}

ENV DEBIAN_FRONTEND=noninteractive
ENV NVIDIA_DRIVER_CAPABILITIES graphics,video,compute,utility

# install dependencies
RUN apt update && apt-get install -y software-properties-common git tree python3-pip
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3 1

# Clone & install latest nvflare
RUN git clone https://github.com/NVIDIA/NVFlare.git
RUN cd /NVFlare && pip install -e . --break-system-packages

# install jupyter-lab
RUN pip install jupyter --break-system-packages

# install pytorch
RUN pip install torch torchvision --break-system-packages

# install tensorboard
RUN pip install tensorboard --break-system-packages
