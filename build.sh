#!/bin/bash
set -e

if [ -z "$1" ]
  then
    echo "No tag supplied"
    exit 1
fi

echo "Build docker image with tag $1"
docker build -t pnowy/docker-tools:$1 -t pnowy/docker-tools:latest .

docker push pnowy/docker-tools