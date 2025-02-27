# Introduction to Federated Learning with NVIDIA FLARE

Welcome to the course: **Introduction to Federated Learning with NVIDIA FLARE**!

Federated Learning empowers institutions to leverage private data by
enabling local training without centralizing data. With increasing
demand of access to high quality, multi-institutional data, Federated
Learning has been gaining traction as an effective paradigm to develop
robust AI while respecting data regulations. However, implementing
Federated Learning is not an easy task. Carefully designed software
tools are needed to efficiently prototype Federated projects and bring
them to real-world scale.

NVIDIA Federated Learning Application Runtime Environment (FLARE) is
an open-source Python SDK allowing for efficient implementation of
production-scale Federated Learning applications. With NVIDIA FLARE,
adapting any Machine Learning or Deep Learning algorithm to Federated
Learning is seamless and independent of the underlying framework,
whether it’s PyTorch, TensorFlow, or traditional frameworks such as
numpy, scikit-learn, xgboost etc. NVIDIA FLARE also provides an
extensive set of features to bring Federated research to real-world
production.

In this course, we will illustrate how quickly you can implement
Federated applications using NVIDIA FLARE and move from simulation to
production. Additionally, we will showcase diverse applications across
industries, such as fraud detection in financial services, medical
imaging segmentation, and cross-country training for autonomous
vehicles.

# Course Goals

In this course, our primary goal is to introduce the fundamentals of
NVIDIA FLARE to researchers, scientists and developers.

This course is considered as a beginner-level course on NVIDIA FLARE,
therefore the content is tailored to be on API usage level, without
deep diving into too much details of the inner implementations. We do
not aim for you to become an NVIDIA FLARE developer after the course,
but we do aim to provide you with the knowledge on how to effectively
use NVIDIA FLARE's APIs and tools to implement your FL projects. You
will hopefully gain the following after the course:
- Be able to implement FL, by adapting traditional centralized
  computing / training code to federated paradigm with NVIDIA FLARE
  APIs.
- Be able to set up, configure, run and monitor federated applications
  both in a simulated environment and in a real-world sandbox  scenario.
- Have the high-level knowledge of advanced security features for
  real-world deployment.
- Be able to find and access additional learning resource, if you
  would like have a deeper understanding of NVIDIA FLARE.

# Course Requirements

Prerequisites of this course include:
- Python programming skills
- Basic understanding of machine learning & deep learning

This course contains multiple examples that we will walkthrough and
run together. It is helpful to have experiences in machine learning /
deep learning libraries such as `numpy`, `pytorch`, but these are not
mandatory, as we will only use basic APIs of these SDKs. Regarding
hardware, most of the examples can be run on NVIDIA T4 or equivalent
GPUs, or even in CPU-only environment. Having more powerful GPUs could
help accelerate the compute for some of the examples in this course.

# Course Structure

This course is broken down into the following 4 notebooks. While each
notebook can run independently, it is recommended to  follow them
one-by-one in order.

### [Chapter 1: Introduction](notebooks/Chapter_1_Introduction.ipynb)
This notebook gives an overview introduction to Federated Learning and
NVIDIA FLARE.


### [Chapter 2: Develop a Federated Application](notebooks/Chapter_2_Develop_Federated_Application.ipynb)
In this notebook, we focus on how to develop a federated application
with NVIDIA FLARE's APIs and tools. We introduce the high-level
architecture of NVIDIA FLARE and basics APIs to develop federated
Server, Client and Job. We illustrate with an example how easy it is
to adapt traditional centralized code to a federated code using these
APIs, and showcase how we can easily run a federated application
locally in a simulated environment with FLARE Simulator.


### [Chapter 3: Provision, Run and Monitor a Federated Project](notebooks/Chapter_3_Provision_Run_and_Monitor_Federated_Project.ipynb)
In this notebook, we focus on how to properly set up a federated
project and run it in a sandbox environment. We dive in the concept of
project provisioning in NVIDIA FLARE, and demonstrate how to test-run
and monitor a provisioned federated project in a local environment
using Proof-of-Concept (PoC) mode, as if in a real-world
deployment. We illustrate project provisioning, running and monitoring
with an example.


### [Chapter 4: Advanced Topics, Use Cases and Additional Learning Resources](notebooks/Chapter_4_Advanced_Topics_Use_Cases_and_Additional_Resources.ipynb)
In this notebook, we introduce advanced topics in NVIDIA FLARE for
real-world FL deployment, including security features such as privacy
preserving technologies, site policy management and support for
Confidential Computing, web UI with FLARE Dashboard, additional
deployment options and Flower-on-FLARE. Then we will briefly cover
typical use-cases and real-world federated projects leveraging NVIDIA
FLARE. We will finish this notebook by providing additional learning
resources for developers who aim to learn more about real-world FL
deployment with NVIDIA FLARE.

# Go Beyond This Course

There are additional free learning materials online that go beyond the
scope of this course. Feel free to check out NVIDIA FLARE's [general
webpage](https://nvidia.github.io/NVFlare/), [official
documentation](https://nvflare.readthedocs.io/en/main/index.html) and
[tutorial catalog](https://nvidia.github.io/NVFlare/catalog/).

# Set-up Instructions

### Build the Course

> **NOTE**:
> To successfully build the Docker image for this course, you need to
> have a Linux environment with Docker.

Run the script `build-docker.sh` to build a docker image for this
course:
```bash
./build-docker.sh
```

You can also directly run `docker build` with the `Dockerfile`
included in this directory:
```bash
docker build -t nvflare-course .
```

### Launch the Course

To launch the course, run the following script:
```bash
./run-docker.sh
```
This runs the container in a detached state. By default, the script
will try to launch the container in GPU mode with CUDA enabled. You
can force launching the container in CPU mode with argument `--cpu`:
```bash
./run-docker.sh --cpu
```

> **NOTE**:
> To run the container with CUDA enabled, you need to have an NVIDIA
> GPU Driver with version >=525.60.13. Otherwise, a CPU-only container
> will be launched even without the `--cpu` argument. This is handled
> automatically by the `run-docker.sh` script.

You can access the course by visiting `localhost:8888` in
your web browser.

### Stop the Course

To stop the container when finished, run `docker
stop nvflare-course`.

### Clean Up

To clean up temporary files generated during the course, run
`./cleanup.sh`.
