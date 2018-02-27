#!/bin/bash

MSG_VENDOR="${GREEN_REGULAR}Removing vendor dir${NO_COLOR}"
MSG_GOLANG_IMAGE="${GREEN_REGULAR}Stopping and removing the golang container${NO_COLOR}${DOCKER_IMAGE_GOLANG}"
MSG_DATABASE="${GREEN_REGULAR}Stopping and removing the db container${NO_COLOR}${DOCKER_CONTAINER_DB}"
MSG_API_REST="${GREEN_REGULAR}Stopping and removing api the container${NO_COLOR}${DOCKER_CONTAINER_API}"


function golang_image {
  printf "%b" "${MSG_GOLANG_IMAGE}"
  docker rmi -f "${DOCKER_IMAGE_GOLANG}"
}

function database {
  printf "%b" "${MSG_DATABASE}"
  docker rm -f "${DOCKER_CONTAINER_DB}"
}

function api_rest {
  printf "%b" "${MSG_API_REST}"
  docker rm -f "${DOCKER_CONTAINER_API}"
}

function all {
  printf "%b" "${MSG_API_REST}"
  docker rm -f "${DOCKER_CONTAINER_API}"
  
  printf "%b" "${MSG_DATABASE}"
  docker rm -f "${DOCKER_CONTAINER_DB}"

  printf "%b" "${MSG_GOLANG_IMAGE}"
  docker rmi -f "${DOCKER_IMAGE_GOLANG}"
}

function destroy_docs {
  cat $GOCKER_DIR/doc/destroy.txt
}

function destroy {
  printf "%b\n" "${MSG_VENDOR}"
  rm -rf vendor

  echo "aqui meregngues\n"
  while getopts ":d:i:a:r:h" option
  do
    case "${option}"
      in
      d) database ;;
      i) golang_image ;;
      a) all ;;
      r) api_rest ;;
      *|h) destroy_docs ;;
    esac
  done
}

export -f destroy
