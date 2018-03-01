#!/bin/bash

#: Title : destroy
#: Date : 27/feb/2017
#: Author : Daniel Ortega @gatero <me@daniel-ortega.mx>
#: Version : 0.0.3
#: Description : remove diferent parts of project
#: or remove the entrie docker orchestation
#: Options : 
#:    -i) This will remove the docker image
#:    -d) use s option to remove the database container,
#:        this will remove all saved data on the database
#:    -r) this remove the api rest container
#:    -a) Remove all containers and the docker image
#:    -h|*) help option

#: Message vars that will be printed before each function
MSG_VENDOR="${GREEN_REGULAR}Removing vendor dir${NO_COLOR}"
MSG_GOLANG_IMAGE="${GREEN_REGULAR}Stopping and removing the golang container${NO_COLOR}${DOCKER_IMAGE_GOLANG}"
MSG_DATABASE="${GREEN_REGULAR}Stopping and removing the db container${NO_COLOR}${DOCKER_CONTAINER_DB}"
MSG_API_REST="${GREEN_REGULAR}Stopping and removing api the container${NO_COLOR}${DOCKER_CONTAINER_API}"

#: Type : function
#: Description : remove golang image
golang_image() {
  printf "%b" "${MSG_GOLANG_IMAGE}"
  docker rmi -f "${DOCKER_IMAGE_GOLANG}"
}

#: Type : function
#: Description : remove database container
database() {
  printf "%b" "${MSG_DATABASE}"
  docker rm -f "${DOCKER_CONTAINER_DB}"
}

#: Type : function
#: Description : remove api rest container
api_rest() {
  printf "%b" "${MSG_API_REST}"
  docker rm -f "${DOCKER_CONTAINER_API}"
}

#: Type : function
#: Description : remove containers and the entrie image
all() {
  database && api_rest && golang_image
}

#: Type : function
#: Description : print the configuration for up module
show_docs() {
  cat "${GOCKER_DIR}/doc/destroy.txt"
}

#: Type : function
#: Description : run the program depends on passed options
destroy() {
  if [ $# -ne 0 ]; then
    printf "%b" "${MSG_VENDOR}"
    rm -rf vendor

    while getopts ":diarh" option; do
      case "${option}"
        in
        d) shift && database ;;
        i) shift && golang_image ;;
        a) shift && all ;;
        r) shift && api_rest ;;
        h|*) shift && show_docs ;;
      esac
    done
  else
    show_docs
  fi
}

export -f destroy

