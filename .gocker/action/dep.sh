#!/bin/bash

COMMANDS=('prune', 'ensure', 'status', 'version')

if [[ "${COMMANDS[@]}" =~ "${1}" ]]; then
  docker exec $DOCKER_CONTAINER_API dep "$@"
else
  printf "%b\n" "${RED_REGULAR}Invalid dep command"
fi
