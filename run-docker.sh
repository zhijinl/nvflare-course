#!/bin/bash

docker run -d --rm --shm-size 8G --gpus=all \
       --ulimit memlock=-1 --ulimit stack=67108864 \
       --env LAB_PATH=$(pwd -P) \
       --name dli-nvflare \
       -v /etc/passwd:/etc/passwd:ro -v /etc/group:/etc/group:ro \
       -v /var/run/docker.sock:/var/run/docker.sock \
       -v $(pwd -P):/flare \
       --net=host \
       gtc-dli-nvflare bash -c \
       "jupyter lab --ip=0.0.0.0 --port=8888 --allow-root --no-browser --NotebookApp.token='' --notebook-dir=/flare --NotebookApp.allow_origin='*'"
