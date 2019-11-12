# docker-pytorch-ko
Docker image of latest PyTorch-CUDA for Koreans...

대충 한국어 안깨지고 시간 잘 맞는 GPU pytorch 런타임 도커 예제..

```bash
$ docker pull theeluwin/pytorch-ko:latest
```

## Build

```bash
$ docker build -t theeluwin/pytorch-ko -f Dockerfile .
```

or,

```bash
$ ./build.sh
```

## Run

도커 컨테이너가 런타임만 제공한다고 생각하고 사용하면, 코드나 데이터 등등은 다 bind 해놓고 실행시키는게 적절함.

예시로는 `entry.py`와 `run.sh` 참고.

```bash
$ docker run --rm -it --init --gpus=all --volume="$HOME/.cache/torch:/root/.cache/torch" --volume="$PWD:/workspace" theeluwin/pytorch-ko python entry.py
```

이거 결과가 `True`면 도커 런타임에서 PyTorch로 GPU 써서 돌릴 수 있다는 뜻.

## 카페라떼

근데 바로 이걸 사용하기보단, 이 `theeluwin/pytorch-ko`를 `FROM`으로 받아서, `Dockerfile` 참고해서 `requirements.txt` 같은거 보고 패키지 더 설치하도록 하는것이 좋음. `ENTRYPOINT` 같은것도 필요에 따라 바꿔서 사용 (지금은 그냥 디폴트 shell).

이미지 캐시 마운트 `RUN --mount=type=cache,target=/root/.cache/pip` 같은거 사용하려면 experiment buildkit이 필요함. `gnome-keyring` 패키지를 설치하고, 빌드 할때 플래그를 줘서 빌드:

```bash
$ DOCKER_BUILDKIT=1 docker build -t my/docker-image -f MyDockerfile .
```
