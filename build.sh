#!/usr/bin/env bash

MLFLOW_VERSION=$(cat version.txt)
docker build -t "kloudough/mlflow:${MLFLOW_VERSION}" --build-arg "MLFLOW_VERSION=${MLFLOW_VERSION}" src