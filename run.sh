runpy () {
    docker run \
        -it \
        --rm \
        --init \
        --gpus="all" \
        --shm-size="32G" \
        --volume="$HOME/.cache/torch:/root/.cache/torch" \
        --volume="$PWD:/workspace" \
        theeluwin/pytorch-ko \
        python "$@"
}

runpy entry.py
