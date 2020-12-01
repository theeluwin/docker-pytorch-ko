# -*- coding: utf-8 -*-

import torch


def entry():
    print('cuda available:', torch.cuda.is_available())
    print('torch version:', torch.__version__)


if __name__ == '__main__':
    entry()
