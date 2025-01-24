#!/bin/bash

GPU_FLAG=""
REQ_DRIVER_VERSION="525.60.13"

# Switch for CPU only container launch.
cpu=false

while [[ $# -gt 0 ]]; do
    case $1 in
        --cpu)
            cpu=true
            shift
            ;;
        *)
            echo "Unknown option: $1"
            echo "To force launching container in CPU mode, use the --cpu flag."
            exit 1
            ;;
    esac
done

if $cpu; then

    echo "Launching container in cpu mode."

else

    # Check if GPU driver is available & determine whether version req is met.
    # if check fails, launch container in CPU mode.
    if command -v nvidia-smi &> /dev/null; then
        DRIVER_VERSION=$(cat /proc/driver/nvidia/version | grep -oP 'NVIDIA.*Module\s+\K\d+\.\d+')
        echo "NVIDIA GPU driver version "$DRIVER_VERSION" is installed."

        if sort -C -V <<<"$REQ_DRIVER_VERSION"$'\n'"$DRIVER_VERSION"; then
            echo "Current NVIDIA GPU driver version ($DRIVER_VERSION) is newer than or the same as required version $REQ_DRIVER_VERSION."
            echo "launching container with CUDA enabled."

            GPU_FLAG="--gpus=all"
        else
            echo "To run this container with CUDA enabled, an NVIDIA GPU driver with version newer or equal to $REQ_DRIVER_VERSION is required. Currently installed driver version is $DRIVER_VERSION, which do not meet the requirement. Launching container with CUDA disabled."
        fi
    else
        echo "NVIDIA GPU driver not found. Launching container with CUDA disabled (aka CPU mode)."
    fi

fi

    docker run -d --rm --shm-size 8G $GPU_FLAG \
           --ulimit memlock=-1 --ulimit stack=67108864 \
           --env LAB_PATH=$(pwd -P) \
           --name nvflare-course \
           -v /etc/passwd:/etc/passwd:ro -v /etc/group:/etc/group:ro \
           -v /var/run/docker.sock:/var/run/docker.sock \
           -v $(pwd -P):/flare \
           --net=host \
           nvflare-course bash -c \
           "jupyter lab /flare/notebooks/Chapter_0_Welcome.ipynb --ip=0.0.0.0 --port=8888 --allow-root --no-browser --NotebookApp.token='' --notebook-dir=/flare --NotebookApp.allow_origin='*'"
