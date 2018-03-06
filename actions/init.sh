#!/bin/bash

init() {
  if [ ! -f ./environment.cfg ]; then
    # create the docker file
    touch "./environment.cfg"
    echo ". ./environment.cfg # This file contains the project configuration" >> "${GOCKER_DIR}/config/main.sh"
    printf "%b\n" "${YELLOW_REGULAR}An empty environment.cfg file was created into your root directory${NO_COLOR}"
  fi

  if [ ! -f ./docker-compose.yml ]; then
    touch "./docker-compose.yml"
    printf "%b\n" "${YELLOW_REGULAR}An empty docker-compose.yml file was created into your root directory${NO_COLOR}"
  fi

  if [ $(cat "./environment.cfg" | wc -l) == 0 ]; then
    printf "%b\n" "${RED_REGULAR}Your environment.cfg file is empty, you need define your own environment before${NO_COLOR}"
    exit 1
  fi

  if [ $(cat "./docker-compose.yml" | wc -l) == 0 ]; then
    printf "%b\n" "${RED_REGULAR}Your docker-compose.yml file is empty, you need define your configuration before${NO_COLOR}"
    exit 1
  fi
}

export -f init
