#!/bin/bash
function run {
  while getopts ":d:r" option
  do
    case "${option}"
      in
      d)
        printf "%b" "${GREEN_REGULAR}${NO_COLOR}${DOCKER_CONTAINER_DB}"
        docker exec "$DOCKER_CONTAINER_DB" "$@"
      ;;
      r)
        printf "%b" "${GREEN_REGULAR}${NO_COLOR}${DOCKER_CONTAINER_DB}"
        docker exec "$DOCKER_CONTAINER_DB" "$@"
      ;;
      *)
        printf "%b" "${GREEN_REGULAR}Stopping and removing the container: ${NO_COLOR}${DOCKER_CONTAINER_API}"
        docker exec "$DOCKER_CONTAINER_API" "$@"
      ;;
    esac
  done
}
export -f run
