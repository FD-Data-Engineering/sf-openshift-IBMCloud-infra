#!/bin/bash

set -ex

cd docker-worker

PARENT_DIR=$(basename "${PWD%/*}")
CURRENT_DIR="${PWD##*/}"
IMAGE_NAME="$PARENT_DIR/$CURRENT_DIR"
TAG="latest"

docker build -t ${REGISTRY}${IMAGE_NAME}:${TAG} .

cd ../105-ibm-vpc-openshift

echo "[INFO] Terraform Init - Initialise the Terraform execution using remote backend"

docker run --rm -it -v /$PWD://data -w //data ${REGISTRY}${IMAGE_NAME}:${TAG} init

echo "[INFO] Terraform Plan - Create the Terraform execution plan in the remote backend"
docker run --rm -it -v /$PWD://data -w //data ${REGISTRY}${IMAGE_NAME}:${TAG} plan

echo "[INFO] Terraform Apply - Apply the Terraform changes"
docker run --rm -it -v /$PWD://data -w //data ${REGISTRY}${IMAGE_NAME}:${TAG} apply -auto-approve