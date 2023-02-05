build: pytorch pytorch-cuda

pytorch:
	docker build -t pytorch -f Dockerfile.pytorch .

pytorch-cuda:
	docker build -t pytorch-cuda -f Dockerfile.pytorch-cuda .

run:
	docker run --gpus all --rm -it pytorch-cuda
