ARG MONAI_IMAGE=nvcr.io/nvidia/clara/monai-toolkit:1.0
FROM ${MONAI_IMAGE}

ENV DEBIAN_FRONTEND=noninteractive
ENV NVIDIA_DRIVER_CAPABILITIES graphics,video,compute,utility

# NVIDIA Docker and Docker compose plugin 
# (from https://docs.docker.com/engine/install/ubuntu/)
RUN apt-get update -q \
    && apt-get install -yq \
        tree \
        ca-certificates \
        curl \
        gnupg \
        lsb-release
RUN mkdir -p /etc/apt/keyrings \
    && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg \
    && echo \
        "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
        $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null \
    && apt-get update
RUN apt-get install -y docker-ce-cli  #docker-compose-plugin
RUN curl -SL https://github.com/docker/compose/releases/download/v2.15.1/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose && chmod a+x /usr/local/bin/docker-compose

# Create the FLARE workspace and clone NVFlare GitHub repo
RUN mkdir /flare
WORKDIR /flare
RUN git clone https://github.com/NVIDIA/NVFlare.git

# Install latest nvflare and monai from dev source
WORKDIR /flare/NVFlare
RUN git checkout dev
RUN pip uninstall -yq nvflare monai-nvflare
RUN pip install -e .
WORKDIR /flare/NVFlare/integration/monai
RUN pip install --no-dependencies .

WORKDIR /flare


