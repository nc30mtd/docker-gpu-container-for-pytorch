FROM nvidia/cuda:11.3.1-devel-ubuntu20.04

# tzdataのインストール時にConfiguring tzdataの画面で止まってしまう対策
ENV DEBIAN_FRONTEND=noninteractive
# RUN apt update && \
#     apt-get install -y tzdata

RUN apt update && apt install -y --no-install-recommends \
        automake \
        autoconf \
        bzip2 \
        ca-certificates \
        cmake \
        curl \
        ffmpeg \
        flac \
        git \
        gfortran \
        g++ \
        libtool \
        libfreetype6-dev \
        libsndfile1-dev \
        make \
        nkf \
        patch \
        python3 \
        python3-pip \
        python3-dev \
        python3-distutils \
        python3-tk \
        sox \
        subversion \
        unzip \
        vim \
        wget \
        zlib1g-dev && \
    rm -rf /var/lib/apt/lists/*

RUN python3 -m pip install --upgrade pip
# COPY requirements.txt /tmp/
# RUN pip install -r /tmp/requirements.txt

# Ubuntuデフォルトのpython3をpythonに置き換えるようにシンボリックリンクの作成
RUN ln -s /usr/bin/python3.8 /usr/bin/python3

# 以下DALLE2-pytorch用
RUN pip install torch==1.7.1+cu110 torchvision==0.8.2+cu110 -f https://download.pytorch.org/whl/torch_stable.html 
RUN pip install einops einops_exts vector_quantize_pytorch resize_right rotary_embedding_torch x_clip coca_pytorch pytorch_warmup ema_pytorch accelerate
RUN apt-get upgrade -y 