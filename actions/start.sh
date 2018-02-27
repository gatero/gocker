#!/bin/bash

function docker_compose {
  docker-compose -f $1 up
}

function build_image {
  docker build -t gatero/gocker .gocker/docker;
}

function start_project {
  compose_file=$1

  if [ -f "$compose_file" ]; then
    if [[ "$(docker images)" =~ $DOCKER_IMAGE_GOLANG ]]; then
      docker_compose $compose_file
    else
      build_image && docker_compose $compose_file
    fi
  fi
}

function doc {
  cat $GOCKER_DIR/doc/start.txt
}

function start {
  while getopts ":f:" option; do
    case "${option}"
      in
      f) start_project "${OPTARG:-Plase enter a valid file location}" ;;
      *|h) doc ;;
    esac
  done
}

export -f start
