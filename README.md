# [DLIT52033] 5 minutes to Federated Learning with NVIDIA FLARE

Federated Learning empowers institutions to leverage private data by
enabling local training without centralizing data. This workshop will
demonstrate how easily existing machine learning (ML) or deep learning
(DL) algorithms can be adapted to a Federated Learning paradigm using
NVIDIA Federated Learning Application Runtime Environment (FLARE).

With NVIDIA FLARE, adapting any ML or DL algorithm to Federated
Learning is seamless and independent of the underlying ML framework,
whether it’s PyTorch, TensorFlow, or traditional frameworks such as
numpy, scikit-learn, xgboost etc.

In this DLI course, we will illustrate how quickly you can move
Federated algorithms from simulation to production. Additionally, we
will showcase diverse applications across industries, such as fraud
detection in financial services, medical imaging segmentation, and
cross-country training for autonomous vehicles.

# Course Outline

The contents of this DLI are broken down into multiple notebooks under
the [notebooks](notebooks/) folder:
- **00_Overview**: this notebook gives an introduction to
  Federated Learning and basic concepts of NVIDIA FLARE.
- **01_Client_APIs_and_Simulator**: this notebook illustrates
  how easily we can adapt typical compute / training workflows to a
  federated paradigm using Client APIs, and run a federated workflow
  using Simulator.
- **02_Provision_and_PoC_Mode**: this notebook dives in the
  concept of provisioning for real-world deployment of federated
  applications. We illustrate the provision process with an example
  using Proof-of-Concept (PoC) mode with NVIDIA FLARE.
- **03_Dashboard**: this notebook shows how to manage
  federated projects using web UI with FLARE Dashboard.
- **04_Example_1_Medical_Imaging_with_MONAI**: this notebook
  includes a real-world example of medical image segmentation using
  NVIDIA FLARE and the MONAI framework.
- **05_Example_2_Financial_Services_Fraud_Detection**: this
  notebook includes a real-world example of fraud detection in
  finanicla services using NVIDIA FLARE
- **06_Example_3_Autonomous_Vehicles_Cross_Country_Training**: this
  notebook includes a real-world example of cross-country training in
  autonomous vehicles using NVIDIA FLARE

# Set-up Instructions

Use the `Dockerfile` included in this directory to build a docker
image with `docker build -t gtc-dli-nvflare .`.

Before running the container, place any necessary data files in the
`data/` directory in this same directory, since we'll use use Docker
volume mounts in our `docker run` command below to include these in
the running container.

You can find sample data here: <include link>

When you're ready, run the container using:
```bash
docker run -d --rm --shm-size 8G --gpus=all \
    --ulimit memlock=-1 --ulimit stack=67108864 \
    --env LAB_PATH=$(pwd -P) \
    --name dli-nvflare \
    -v /etc/passwd:/etc/passwd:ro -v /etc/group:/etc/group:ro \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v $(pwd -P)/data:/flare/data \
    -v $(pwd -P)/notebooks:/flare/notebooks \
    --net=host \
    gtc-dli-nvflare bash -c \
    "jupyter lab --ip=0.0.0.0 --port=8888 --allow-root --no-browser --NotebookApp.token='' --notebook-dir=/flare/notebooks --NotebookApp.allow_origin='*'"
```
This runs the container in a detached state.

You can access the course material by visiting `localhost:8888` in
your web browser.  To stop the container when finished, run `docker
stop dli-nvflare`.
