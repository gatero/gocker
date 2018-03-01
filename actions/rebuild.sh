#!/bin/bash

#: Title : rebuild
#: Date : 27/feb/2017
#: Author : Daniel Ortega @gatero <me@daniel-ortega.mx>
#: Version : 0.0.3
#: Description : Run the project using docker-compose
#: Options : 
#:    -f) use your own docker-file
#:    -d) default docker-compose
#:    -h|*) help option

#: Type : function
#: Description : wrapper for docker build command
build_image() {
  docker build -t gatero/gocker "${GOCKER_DIR}/docker"
}

#: Type : function
#: Description : print the configuration for up module
show_doc() {
  cat "${GOCKER_DIR}/doc/rebuild.txt"
}

#: Type : function
#: Description : show help
rebuild() {
  if [ $1 != "-h" ]; then
    if [[ "$(docker images)" =~ $DOCKER_IMAGE_GOLANG ]]; then
      destroy -a && build_image
    fi
  else
    show_doc
  fi
}

export -f rebuild
