#!/bin/bash
. .gocker/action/clean.sh

if [[ "$(docker images)" =~ $DOCKER_IMAGE_GOLANG ]]; then
  docker rmi -f $DOCKER_IMAGE_GOLANG
  docker build -t gatero/gocker .gocker/docker;
  . .gocker/action/start.sh
fi
