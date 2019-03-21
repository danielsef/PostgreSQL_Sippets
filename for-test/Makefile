DOCKER_CONTAINER_NAME ?= postgres-unittest-1

default: help

help:
	@echo "Usage: 'make <target>' where <target> is one of"
	@echo "  build           build the base docker image"	
	@echo "  run             run the docker image"
	@echo "  bash            starts bash inside the running container"
	@echo "  stop            stops the container"
	@echo "  rm              removes the container and base image"

build:
	@echo "Build base image..."
	docker build -t p-db-base:1.0 .

run:
	@echo "Running docker image..."
	docker run --name $(DOCKER_CONTAINER_NAME) \
	-e POSTGRES_DB="postgres" \
	-e POSTGRES_USER="postgres" \
	-e POSTGRES_PASSWORD="pass1234" \
	-p 5490:5432 \
	-d p-db-base:1.0

bash:
	@echo "Starting bash..."
	docker exec -it $(DOCKER_CONTAINER_NAME) /bin/bash

stop:
	@echo "Stop container..."
	docker stop $(DOCKER_CONTAINER_NAME)

rm:
	@echo "Remove container and base image..."
	docker rm -f $(DOCKER_CONTAINER_NAME)
	docker rmi p-db-base:1.0
