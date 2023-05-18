import torch


def entry():
    print(f"cuda available: {torch.cuda.is_available()}")
    print(f"device count: {torch.cuda.device_count()}")
    print(f"torch version: {torch.__version__}")


if __name__ == '__main__':
    entry()
