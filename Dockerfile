# syntax=docker/dockerfile:experimental
# reference: https://github.com/jehyunlee/docker/blob/master/00_base/kr/Dockerfile

# from
FROM pytorch/pytorch:2.0.1-cuda11.7-cudnn8-runtime
LABEL maintainer="Jamie Seol <theeluwin@gmail.com>"

# apt source
RUN sed -i 's/archive.ubuntu.com/mirror.kakao.com/g' /etc/apt/sources.list && \
    sed -i 's/security.ubuntu.com/mirror.kakao.com/g' /etc/apt/sources.list && \
    rm -rfv /var/lib/apt/lists/* && \
    sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
    apt-get update && \
    apt-get -y upgrade

# apt
ENV TZ=Asia/Seoul
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install -y --no-install-recommends tzdata locales language-pack-ko fonts-nanum fonts-nanum-coding && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# locale
RUN locale-gen ko_KR.UTF-8
ENV LANG ko_KR.UTF-8
ENV LANGUAGE ko_KR.UTF-8
ENV LC_ALL ko_KR.UTF-8
ENV PYTHONUNBUFFERED=1

# timezone
RUN ln -sf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# cache
RUN mkdir -p /root/.cache/torch/checkpoints/ && \
    mkdir -p /root/.cache/pip/

# workspace
RUN mkdir -p /workspace
WORKDIR /workspace

# install python packages: for requirements.txt, uncomment the next two
# COPY requirements.txt /workspace/
# RUN --mount=type=cache,target=/root/.cache/pip pip install -r requirements.txt
