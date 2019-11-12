# -*- coding: utf-8 -*-

import torch


def entry():
    print(torch.cuda.is_available())


if __name__ == '__main__':
    entry()
