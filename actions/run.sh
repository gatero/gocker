#!/bin/bash

#: Title : run
#: Date : 27/feb/2017
#: Author : Daniel Ortega @gatero <me@daniel-ortega.mx>
#: Version : 0.0.3
#: Description : Run the project using docker-compose
#: Options : 
#:    -f) use your own docker-file
#:    -d) default docker-compose
#:    -h|*) help option

#: Type : function
#: Description : execute any command inside the container
run_in_api() {
  printf "%b" "${GREEN_REGULAR}${NO_COLOR}${DOCKER_CONTAINER_API}"
  docker exec "$DOCKER_CONTAINER_API" "$@"
}

#: Type : function
#: Description : print the configuration for up module
docs() {
  cat $GOCKER_DIR/doc/run.txt
}

#: Type : function
#: Description : run the program depends on passed options
run() {
  if [ $# -eq 1 ]; then
    if [ $1 == "-h" ]; then
      docs
    else
      run_in_api "${@}"
    fi
  else
    docs
  fi
}
export -f run
