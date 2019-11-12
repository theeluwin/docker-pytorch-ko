docker run --rm -it --init --gpus=all --volume="$HOME/.cache/torch:/root/.cache/torch" --volume="$PWD:/workspace" theeluwin/pytorch-ko python entry.py
