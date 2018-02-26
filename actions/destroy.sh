#!/bin/bash

function destroy {
  printf "%b\n" "${GREEN_REGULAR}Removing vendor dir${NO_COLOR}"
  rm -rf vendor

  while getopts ":d:i:a" option
  do
    case "${option}"
      in
      d)
        printf "%b" "${GREEN_REGULAR}Stopping and removing the container: ${NO_COLOR}${DOCKER_CONTAINER_DB}"
        docker rm -f "${DOCKER_CONTAINER_DB}"
      ;;
      i)
        printf "%b" "${GREEN_REGULAR}Stopping and removing the container: ${NO_COLOR}${DOCKER_CONTAINER_DB}"
        docker rmi -f "${DOCKER_IMAGE_GOLANG}"
      ;;
      a)
        printf "%b" "${GREEN_REGULAR}Stopping and removing the container: ${NO_COLOR}${DOCKER_CONTAINER_API}"
        docker rm -f "${DOCKER_CONTAINER_API}"
        
        printf "%b" "${GREEN_REGULAR}Stopping and removing the container: ${NO_COLOR}${DOCKER_CONTAINER_DB}"
        docker rm -f "${DOCKER_CONTAINER_DB}"

        printf "%b" "${GREEN_REGULAR}Stopping and removing the container: ${NO_COLOR}${DOCKER_CONTAINER_DB}"
        docker rmi -f "${DOCKER_IMAGE_GOLANG}"
      ;;
      *)
        printf "%b" "${GREEN_REGULAR}Stopping and removing the container: ${NO_COLOR}${DOCKER_CONTAINER_API}"
        docker rm -f "${DOCKER_CONTAINER_API}"
      ;;
    esac
  done
}

export -f destroy
