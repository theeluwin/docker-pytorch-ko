# syntax=docker/dockerfile:experimental

# from
FROM pytorch/pytorch:latest
LABEL maintainer="Jamie Seol <theeluwin@gmail.com>"

# locale
ENV LANG ko_KR.UTF-8
ENV LANGUAGE ko_KR.UTF-8
ENV LC_ALL ko_KR.UTF-8
ENV PYTHONUNBUFFERED=1

# apt
ENV TZ=Asia/Seoul
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install -y --no-install-recommends tzdata && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# timezone
RUN ln -sf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# cache
RUN mkdir -p /root/.cache/torch/checkpoints/
RUN mkdir -p /root/.cache/pip/

# workspace
RUN mkdir -p /workspace
WORKDIR /workspace

# install python packages: for requirements.txt, uncomment the next two
# COPY requirements.txt /workspace/
# RUN --mount=type=cache,target=/root/.cache/pip pip install -r requirements.txt
