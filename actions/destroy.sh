#!/bin/bash

function golang_image {
  printf "%b" "${GREEN_REGULAR}Stopping and removing the golang container: ${NO_COLOR}${DOCKER_IMAGE_GOLANG}"
  docker rmi -f "${DOCKER_IMAGE_GOLANG}"
}

function database {
  printf "%b" "${GREEN_REGULAR}Stopping and removing the db container: ${NO_COLOR}${DOCKER_CONTAINER_DB}"
  docker rm -f "${DOCKER_CONTAINER_DB}"
}

function all {
  printf "%b" "${GREEN_REGULAR}Stopping and removing api container: ${NO_COLOR}${DOCKER_CONTAINER_API}"
  docker rm -f "${DOCKER_CONTAINER_API}"
  
  printf "%b" "${GREEN_REGULAR}Stopping and removing db container: ${NO_COLOR}${DOCKER_CONTAINER_DB}"
  docker rm -f "${DOCKER_CONTAINER_DB}"

  printf "%b" "${GREEN_REGULAR}Stopping and removing containers and image: ${NO_COLOR}"
  docker rmi -f "${DOCKER_IMAGE_GOLANG}"
}

function api_rest {
  printf "%b" "${GREEN_REGULAR}Stopping and removing api the container: ${NO_COLOR}${DOCKER_CONTAINER_API}"
  docker rm -f "${DOCKER_CONTAINER_API}"
}

function doc {
  cat $GOCKER_DIR/doc/destroy.txt
}

function destroy {
  printf "%b\n" "${GREEN_REGULAR}Removing vendor dir${NO_COLOR}"
  rm -rf vendor

  while getopts ":d:i:a:r:h" option
  do
    case "${option}"
      in
      d) database ;;
      i) golang_image ;;
      a) all ;;
      r) api_rest ;;
      *|h) doc ;;
    esac
  done
}

export -f destroy
