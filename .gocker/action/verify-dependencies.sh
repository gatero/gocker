#!/bin/bash

if ! [ -x $(command -v docker) ]; then
  printf "%b\n" "${YELLOW_REGULAR} You need docker before run the project${NO_COLOR}"
  if ! [ -x $(command -v docker-compose) ]; then
    printf "%b\n" "${YELLOW_REGULAR} Also needs have installed docker-compose${NO_COLOR}"
    exit 1
  fi
  exit 1
fi

if [[ "${1}" =~ "start" ]]; then
  if [ "$(docker ps -a -f name=$DOCKER_CONTAINER_DB | wc -l)" -ne 2 ]; then
    printf "%b\n" "${RED_REGULAR}[docker] The db container doesn't exist, please run start command ${NO_COLOR}"
    if [ "$(docker ps -a -f name=$DOCKER_CONTAINER_API | wc -l)" -ne 2 ]; then
      printf "%b\n" "${RED_REGULAR}[docker] The api container doesn't exist, please run start command ${NO_COLOR}"
      exit 1
    fi
    exit 1
  fi
fi
