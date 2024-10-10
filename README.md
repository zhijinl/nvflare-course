# [DLIT52033] 5 minutes to Federated Learning with NVIDIA FLARE

Welcome to course 5 minutes to Federated Learning with NVIDIA FLARE!

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

# Course Requirements

Prerequisites of this course include:
- Python programming skills
- Basic understanding of machine learning & deep learning

It is helpful to have experiences in machine learning / deep learning
libraries such as `numpy`, `pytorch`, but these are not mandatory, as
we will only use some of their basic APIs.

Regarding hardware, most of the examples can be run on NVIDIA T4 or
equivalent GPUs, or even in CPU-only environment. Having more powerful
GPUs could help accelerate the compute for some of the examples in
this course.

# Course Contents

In this course, we aim to introduce the fundamentals of NVIDIA FLARE,
demonstrate with multiple examples how easily it is to implement
federated learning, via adapting traditional centralized computing /
training pipelines to federated paradigm with NVFLARE, and illustrate
some real-world industrial Federated Learning examples using NVIDIA
FLARE.

This course is broken down into the following six notebooks. While
each notebook can be run independently, it is recommended to first
execute the contents in notebook 1, 2 and 3 in order, to become
familiar with NVIDIA FLARE.

### [Chapter 1: Introduction to NVDIA FLARE Basic APIs and
Simulator](notebooks/01_Intro_APIs_and_Simulator.ipynb)

In this notebook, we introduce the high-level architecture of NVIDIA
FLARE and the basics APIs for federated Server, Client and Job. We
illustrate with an example how easily it is to adapt typical compute /
training workflows to a federated paradigm using these APIs, and
demonstrate how we can easily run a federated workflow locally in a
simulated environment with FLARE Simulator.

### [Chapter 2: Provisioning and PoC
Mode](notebooks/02_Provision_and_PoC_Mode.ipynb)

In this notebook, we dive in the concept of provisioning in NVIDIA
FLARE for real-world deployment of federated applications. We
illustrate the provision process with an example using
Proof-of-Concept (PoC) mode with NVIDIA FLARE.

### [Chapter 3: NVIDIA FLARE Dashboard](notebooks/03_Dashboard.ipynb)

In this notebook, we show how to manage federated projects using web
UI with FLARE Dashboard.

### [Example 1: Medical
Imaging](notebooks/04_Example_1_Medical_Imaging_with_MONAI.ipynb)

This notebook includes a real-world example of medical image
segmentation using NVIDIA FLARE and the MONAI framework.

### [Example 2: Fraud Detection in Financial
Services](notebooks/05_Example_2_Financial_Services_Fraud_Detection.ipynb)
This notebook includes a real-world example of fraud detection in
finanicla services using NVIDIA FLARE.

### [Example 3: Cross Country Training for Autonomous
Vehicles](notebooks/06_Example_3_Autonomous_Vehicles_Cross_Country_Training.ipynb)
This notebook includes a real-world example of cross-country training
in autonomous vehicles using NVIDIA FLARE.

# Set-up Instructions

Run the script `build-docker.sh` to build a docker image for this
course. You can also directly run `docker build` with the `Dockerfile`
included in this directory:
```bash
docker build -t gtc-dli-nvflare .
```

To launch the course, run the following script:
```bash
./run-docker.sh
```
Or execute the following command:
```bash
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
```
This runs the container in a detached state.

You can access the course by visiting `localhost:8888` in
your web browser.  To stop the container when finished, run `docker
stop dli-nvflare`.
