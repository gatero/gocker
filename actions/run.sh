#!/bin/bash

function run_in_api {
  printf "%b" "${GREEN_REGULAR}${NO_COLOR}${DOCKER_CONTAINER_API}"
  docker exec "$DOCKER_CONTAINER_API" "$@"
}

function doc {
  cat $GOCKER_DIR/doc/run.txt
}

function run {
  while getopts ":c:" option
  do
    case "${option}"
      in
      r) run_command "${OPTARG:2}" ;;
      *|h) doc ;;
    esac
  done
}
export -f run
