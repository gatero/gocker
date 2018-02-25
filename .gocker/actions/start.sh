#!/bin/bash

function start {
  if [[ "$(docker images)" =~ $DOCKER_IMAGE_GOLANG ]]; then
    docker-compose -f .gocker/docker/docker-compose.yml up
  else
    docker build -t gatero/gocker .gocker/docker;
    docker-compose -f .gocker/docker/docker-compose.yml up;
  fi
}

export -f start
