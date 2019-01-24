FROM nvidia/cuda:10.0-cudnn7-devel-ubuntu16.04

MAINTAINER Guodong Xu <memoiry@zju.edu.cn>
# ==================================================================
# module list
# ------------------------------------------------------------------
# python        3.6    (apt)
# mxnet         latest (pip)
# pytorch       latest (pip)
# tensorflow    latest (pip)
# ==================================================================
RUN rm -rf /var/lib/apt/lists/* \
           /etc/apt/sources.list.d/cuda.list \
           /etc/apt/sources.list.d/nvidia-ml.list &&\

    apt-get update &&\
# ==================================================================
# tools
# ------------------------------------------------------------------

  DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        build-essential \
        ca-certificates \
        cmake \
        wget \
        git \
        vim \
        apt-transport-https \
        autojump \
        bc \
        cppcheck \
        curl \
        debconf-utils \
        doxygen \
        g++ \
        gdb \
        htop \
        lcov \
        libboost-all-dev \
        libcurl4-openssl-dev \
        libfreetype6-dev \
        libncurses5-dev \
        lsof \
        proxychains \
        realpath \
        tmux \
        unzip \
        xterm \
        zip \
        zsh \
        ssh

# ==================================================================
# python
# ------------------------------------------------------------------

RUN  DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        software-properties-common \
        && \
    add-apt-repository ppa:deadsnakes/ppa && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        python3.6 \
        python3.6-dev \
        && \
    wget -O ~/get-pip.py \
        https://bootstrap.pypa.io/get-pip.py && \
    python3.6 ~/get-pip.py && \
    ln -s /usr/bin/python3.6 /usr/local/bin/python3 && \
    ln -s /usr/bin/python3.6 /usr/local/bin/python && \
    python -m pip --no-cache-dir install --upgrade \
        setuptools \
        && \
    python -m pip --no-cache-dir install --upgrade \
        numpy \
        numba \
        scipy \
        pandas \
        cloudpickle \
        scikit-learn==0.20.1 \
        matplotlib \
        Cython \
        shapely \
        plotly \
        pyyaml \
        loguru \
        opencv-python \
        tqdm \
        easydict \
        glob2 \
        gluoncv \
        mxboard

# ==================================================================
# mxnet
# ------------------------------------------------------------------

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        libatlas-base-dev \
        graphviz \
        && \

    python -m pip --no-cache-dir install --upgrade \
        mxnet-cu92 \
        graphviz

# ==================================================================
# pytorch
# ------------------------------------------------------------------

RUN python -m pip --no-cache-dir install --upgrade \
        future \
        protobuf \
        enum34 \
        typing \
      torchvision_nightly \
        && \
    python -m pip --no-cache-dir install --upgrade \
        torch_nightly -f \
        https://download.pytorch.org/whl/nightly/cu92/torch_nightly.html

# ==================================================================
# tensorflow
# ------------------------------------------------------------------

RUN python -m pip --no-cache-dir install --upgrade \
        tensorflow-gpu \
        tensorboard 

# ==================================================================
# config & cleanup
# ------------------------------------------------------------------

RUN ldconfig && \
    apt-get clean && \
    apt-get autoremove && \
    rm -rf /var/lib/apt/lists/* /tmp/* ~/*

EXPOSE 6006
