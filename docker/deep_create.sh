#!/usr/bin/env bash

SHELL_PATH="$(cd "$( dirname "$0"  )" && pwd  )"

DOCKER_REPO="xuguodong/deep"
TAG="latest"

docker build -t "${DOCKER_REPO}:${TAG}" -f "$SHELL_PATH/../generator/Dockerfile" $SHELL_PATH/..
