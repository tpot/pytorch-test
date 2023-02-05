build: cache pytorch

cache:
	docker build -t cache -f Dockerfile.cache .

pytorch:
	docker build -t pytorch -f Dockerfile.pytorch .

run:
	docker run --gpus all --rm -it pytorch
