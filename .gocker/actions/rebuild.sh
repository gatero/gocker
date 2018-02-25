#!/bin/bash

function rebuild {
  if [[ "$(docker images)" =~ $DOCKER_IMAGE_GOLANG ]]; then
    destroy -a
    docker rmi -f "${DOCKER_IMAGE_GOLANG}"
    docker build -t gatero/gocker .gocker/docker;
    start
  else
    docker build -t gatero/gocker .gocker/docker;
    start
  fi
}

export -f rebuild
