#!/bin/bash

function docker_compose {
  compose_file=$1
  docker-compose -f "$compose_file" up
}

function build_image {
  docker build -t gatero/gocker "${GOCKER_DIR}/docker"
}

function start_project {
  compose_file=$1

  if [ -f "$compose_file" ]; then
    if [[ "$(docker images)" =~ $DOCKER_IMAGE_GOLANG ]]; then
      docker_compose "$compose_file"
    else
      build_image && docker_compose "$compose_file"
    fi
  fi
}

function default {
  start_project "${GOCKER_DIR}/docker/docker-compose.yml"
}

function start_docs {
  cat "${GOCKER_DIR}/doc/start.txt"
}

function start {
  echo $OPTIND
  while getopts ":f:d:h" option; do
    case "${option}"
      in
      f) start_project "${OPTARG:-Plase enter a file location}" ;;
      d) default ;;
      h|*) start_docs ;;
    esac
  done
}

export -f start
