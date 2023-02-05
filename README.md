# pytorch-test

Experimenting with [Conda](https://docs.conda.io/en/latest/) to create
Docker containers running PyTorch.

## Prerequisites

Linux installation with CUDA 11.6 driver installed. Run `nvidia-smi`
to determine whether the drivers are working.

```
$ nvidia-smi
+-----------------------------------------------------------------------------+
| NVIDIA-SMI 510.108.03   Driver Version: 510.108.03   CUDA Version: 11.6     |
|-------------------------------+----------------------+----------------------+
| GPU  Name        Persistence-M| Bus-Id        Disp.A | Volatile Uncorr. ECC |
| Fan  Temp  Perf  Pwr:Usage/Cap|         Memory-Usage | GPU-Util  Compute M. |
|                               |                      |               MIG M. |
|===============================+======================+======================|
|   0  Quadro M6000        Off  | 00000000:02:00.0 Off |                  Off |
| 25%   37C    P8    26W / 250W |      1MiB / 12288MiB |      0%      Default |
|                               |                      |                  N/A |
+-------------------------------+----------------------+----------------------+
...
```

## Usage

1. Create cache image to avoid re-downloading packages. This uses
`conda install --download-only` to pre-populate the `/opt/conda/pkgs`
directory.
```
$ make cache
```

2. Create pytorch image. This image contains two environments:
`pytorch` with the regular CPU build, and `pytorch-cuda` containing a
build for Nvidia GPUs.
```
$ make pytorch
```

3. Test CUDA image.
```
$ docker run --gpus all --rm -it pytorch
(base) root@c8055a7a4282:/# conda activate pytorch-cuda
(pytorch-cuda) root@c8055a7a4282:/# python
Python 3.10.9 | packaged by conda-forge | (main, Feb  2 2023, 20:20:04) [GCC 11.3.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> import torch
>>> torch.cuda.is_available()
True
```
