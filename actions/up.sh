#!/bin/bash

#: Title : up
#: Date : 27/feb/2017
#: Author : Daniel Ortega @gatero <me@daniel-ortega.mx>
#: Version : 0.0.3
#: Description : Run the project using docker-compose
#: Options : 
#:    -f) use your own docker-file
#:    -d) default docker-compose
#:    -h|*) help option

#: Type : function
#: Description : run docker compose command using the file
#: passed through -f option
run_docker() {
  local docker_compose_file=$1
  docker-compose -f "$docker_compose_file" up
}

#: Type : function
#: Description : wrapper for docker build command
build_image() {
  docker build -t gatero/gocker "${GOCKER_DIR}/docker"
}

#: Type : function
#: Description : Verify if the docker_compose_file file is defined
#: and checks if the docker image exist and then start the project
start_project() {
  local docker_compose_file=$1

  if [ -f "$docker_compose_file" ]; then
    run_docker "$docker_compose_file"
  fi
}

#: Type: function
#: Description : use the docker compose file contained
#: in the project by default
run_default() {
  start_project "${GOCKER_DIR}/docker/docker-compose.yml"
}

#: Type : function
#: Description : print the configuration for up module
show_docs() {
  cat "${GOCKER_DIR}/doc/up.txt"
}

#: Type : function
#: Description : run the program depends on passed options
up() {
  if [ $# -ne 0 ]; then
    while getopts ":dhf:" option; do
      case "${option}"
        in
        d) shift && run_default ;;
        f) shift && start_project "${OPTARG:-Plase enter a file location}" ;;
        h|*) shift && show_docs ;;
      esac
    done
  else
    show_docs
  fi
}

export -f up
