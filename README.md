# [DLIT52033] 5 minutes to Federated Learning with NVIDIA FLARE

Welcome to the course: **5 minutes to Federated Learning with NVIDIA FLARE**!

Federated Learning empowers institutions to leverage private data by
enabling local training without centralizing data.

NVIDIA Federated Learning Application Runtime Environment (FLARE) is
an open-source Python SDK allowing for efficient implementation of
production-scale Federated Learning applications. With NVIDIA FLARE,
adapting any Machine Learning or Deep Learning algorithm to Federated
Learning is seamless and independent of the underlying framework,
whether it’s PyTorch, TensorFlow, or traditional frameworks such as
numpy, scikit-learn, xgboost etc. NVIDIA FLARE also provides an
extensive set of features to bring Federated research to real-world
production.

In this DLI course, we will illustrate how quickly you can implement
Federated application using NVIDIA FLARE and move from simulation to
production. Additionally, we will showcase diverse applications across
industries, such as fraud detection in financial services, medical
imaging segmentation, and cross-country training for autonomous
vehicles.

# Course Goals

In this course, our primary goal is to introduce the fundamentals of
NVIDIA FLARE to researchers, scientits and developers.

This course is considered as a beginer-level course on NVIDIA FLARE,
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
mandatory, as we will only us basic APIs of these SDKs. Regarding
hardware, most of the examples can be run on NVIDIA T4 or equivalent
GPUs, or even in CPU-only environment. Having more powerful GPUs could
help accelerate the compute for some of the examples in this course.

# Course Structure

This course is broken down into the following 7 notebooks. The first 4
notebooks give an overview of Federated Learning and NVIDIA FLARE, and
walk you through NVIDIA FLARE's APIs and tools with hands-on examples
and exercises. The last 3 notebooks contains real-world industrial
Federated Learning examples using NVIDIA FLARE. While each notebook
can run independently, it is recommended to first follow the contents
in notebook 1, 2, 3 and 4 in order, to become familiar with NVIDIA
FLARE.

### [Chapter 0: Overview](notebooks/Chapter_0_Overview.ipynb)
This notebook gives an overview introduction to Federated Learning and
NVIDIA FLARE.

### [Chapter 1: Introduction to NVDIA FLARE Basic APIs and Simulator](notebooks/Chapter_1_Intro_APIs_and_Simulator.ipynb)
In this notebook, we introduce the high-level architecture of NVIDIA FLARE and the basics APIs for federated Server, Client and Job. We illustrate with an example how easily it is to adapt typical compute / training workflows to a federated paradigm using these APIs, and showcase how we can easily run a federated workflow locally in a simulated environment with FLARE Simulator.

### [Chapter 2: Provisioning, PoC Mode and Minotoring](notebooks/Chapter_2_Provision_PoC_Mode_and_Monitoring.ipynb)
In this notebook, we dive in the concept of provisioning in NVIDIA FLARE for properly setting up an FL applications, and demonstrate how to test-run and monitor a provisioned FL application in a local environment, as if in real-world deployment. We illustrate the provision process with an example using Proof-of-Concept (PoC) mode with NVIDIA FLARE.

### [Chapter 3: Advanced Features and Additional Learning Resources](notebooks/Chapter_3_Advanced_Features_and_Additional_Resources.ipynb)
In this notebook, we introduce advanced features in NVIDIA FLARE for real-world FL deployment, including privacy preserving technologies, support for Confidential Computing, and web UI with FLARE Dashboard. We will finish this notebook by providing additional learning resources for developers who aim to learn more about real-world FL deployment with NVIDIA FLARE.

### [Example 1: Medical Imaging](notebooks/Example_1_Medical_Imaging.ipynb)
This notebook includes a real-world example of medical image segmentation using NVIDIA FLARE and the MONAI framework.

### [Example 2: Fraud Detection in Financial Services](notebooks/Example_2_Financial_Services_Fraud_Detection.ipynb)
This notebook includes a real-world example of fraud detection in finanicla services using NVIDIA FLARE.

### [Example 3: Cross Country Training for Autonomous Vehicles](notebooks/Example_3_Autonomous_Vehicles_Cross_Country_Training.ipynb)
This notebook includes a real-world example of cross-country training in autonomous vehicles using NVIDIA FLARE.

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
