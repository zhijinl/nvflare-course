#!/bin/bash

JUPYTER_PORT=8888
docker run --rm --shm-size 8G --gpus=all \
    --ulimit memlock=-1 --ulimit stack=67108864 \
    --env LAB_PATH=$(pwd -P) --name nvflare-monai \
    -v /etc/passwd:/etc/passwd:ro -v /etc/group:/etc/group:ro \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v /tmp:/tmp \
    -v $(pwd -P)/notebooks:/flare/notebooks \
    --net=host \
    gtc-dli-nvflare-monai \
        jupyter lab /flare \
            --ip=0.0.0.0 \
            --allow-root \
            --no-browser \
            --port=${JUPYTER_PORT} \
            --NotebookApp.token="$JUPYTER_TOKEN" \
            --NotebookApp.password=""
