# Custom vars
GH_VERSION=2.13.0
IMAGE_NAME=gcr.io/caio-testing/gh-cli:latest

# Global vars
SRC_FOLDER=./src/

all: require init apply build push

# Requirements prior to run Make
require:
	@echo "Checking if the required binaries are installed..."
	@terraform --version >/dev/null 2>&1 || (echo "ERROR: Terraform is required."; exit 1)
	@docker --version >/dev/null 2>&1 || (echo "ERROR: Docker is required."; exit 1)

# Terraform init & apply
init: 
	@terraform -chdir=${SRC_FOLDER}/terraform init
apply: 
	@terraform -chdir=${SRC_FOLDER}/terraform apply

# Docker build & push to registry
build:
	@docker build --build-arg CLI_VERSION=${GH_VERSION} -t ${IMAGE_NAME} . -f ${SRC_FOLDER}/Dockerfile

push:
	@docker push ${IMAGE_NAME}
