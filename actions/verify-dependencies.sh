#!/bin/bash

function verify_docker {
  if ! [ -x "$(command -v docker)" ]; then
    printf "%b" "${YELLOW_REGULAR} You need docker before run the project${NO_COLOR}"
    if ! [ -x "$(command -v docker-compose)" ]; then
      printf "%b" "${YELLOW_REGULAR} Also needs have installed docker-compose${NO_COLOR}"
      exit 1
    fi
    exit 1
  fi
}
export -f verify_docker

function verify_docker_containers {
  if [ "${1}" != "up" ] && [ "${1}" != "rebuild" ] && [ "${1}" != "init" ]; then
    if [ "$(docker ps -a -f name=$DOCKER_CONTAINER_DB | wc -l)" -ne 2 ]; then
      printf "%b" "${RED_REGULAR}[docker] The db container doesn't exist, please run start command ${NO_COLOR}"
      if [ "$(docker ps -a -f name=$DOCKER_CONTAINER_API | wc -l)" -ne 2 ]; then
        printf "%b" "${RED_REGULAR}[docker] The api container doesn't exist, please run start command ${NO_COLOR}"
        exit 1
      fi
      exit 1
    fi
  fi
}
export -f verify_docker_containers
