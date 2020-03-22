#!/bin/bash

echo "$DOCKER_PWD" | docker login -u kloudough --password-stdin
docker push "kloudough/mlflow:$(cat version.txt)"