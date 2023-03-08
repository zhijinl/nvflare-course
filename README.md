# [DLIT52033] Federated Learning from Simulation to Production with NVIDIA FLARE and MONAI FL

Federated learning has emerged as a promising solution to the problem of data privacy and locality in training robust AI models. By enabling distributed model training without data sharing, federated learning allows researchers and data scientists to train generalizable models across diverse, distributed datasets while maintaining data privacy.

We'll introduce the NVIDIA FLARE platform for federated learning and its communication model and deployment architecture, highlight tools for developing federated learning workflows, and outline the journey from development to production deployment. Hands-on tutorials will cover FLARE application development with the FL Simulator and distributed deployment of federated learning workflows with the FLARE Dashboard. We'll also cover MONAI FL integration, showing streamlined federated training of medical imaging models based on the MONAI Bundle model format.

# Docker instructions

Use the `Dockerfile` included in this directory to build a docker image with `docker build -t gtc-dli-nvflare-monai .`.

Before running the container, place any necessary data files in the `data/` directory in this same directory, since we'll use use Docker volume mounts in our `docker run` command below to include these in the running container.

You can find sample data here: <include link>

When you're ready, run the container using:
```bash
docker run -d --rm --shm-size 8G --gpus=all \
    --env LAB_PATH=$(pwd -P) --name nvflare-monai \
    -v /etc/passwd:/etc/passwd:ro -v /etc/group:/etc/group:ro \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v $(pwd -P)/data:/flare/data \
    -v $(pwd -P)/notebooks:/flare/notebooks \
    -p 8888:8888 
    gtc-dli-nvflare-monai
```

This runs the container in a detached state.  You can access the course material by visiting `localhost:8888` in your web browser.  To stop the container when finished, run `docker stop nvflare-monai`.