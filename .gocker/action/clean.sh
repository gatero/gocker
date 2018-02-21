#!/bin/bash
while getopts ":a" option
do
  case "${option}"
    in
    a) all=1;;
  esac
done

printf "%b\n" "${GREEN_REGULAR}Stopping and removing the container: ${NO_COLOR}${DOCKER_CONTAINER_API}"
docker rm -f "${DOCKER_CONTAINER_API}"

if [ $all -eq 1 ]; then
  printf "%b\n" "${GREEN_REGULAR}Stopping and removing the container: ${NO_COLOR}${DOCKER_CONTAINER_DB}"
  docker rm -f "${DOCKER_CONTAINER_DB}"
fi

printf "%b\n" "${GREEN_REGULAR}Removing vendor dir${NO_COLOR}"
rm -rf vendor
