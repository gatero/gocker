#!/bin/bash

# environment vars
export GOCKER_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/.gocker"

. ${GOCKER_DIR}/config/main.sh
. ${GOCKER_DIR}/actions/main.sh

#: Verify if docker, docker image and docker containers exists
verify_docker ${1} && verify_docker_containers ${1}

show_gocker_docs() {
  cat ${GOCKER_DIR}/doc/gocker.txt
}

if [ $# -ne 0 ];  then
  if [ $1 != '-h' ]; then
    case $1 in
      up) shift && up "$@" ;;
      init) shift && init "$@" ;;
      run) shift && run "$@" ;;
      context) shift && . ${GOCKER_DIR}/config/main.sh ;;
      rebuild) shift && rebuild "$@" ;;
      destroy) shift && destroy "$@" ;;
      *) show_gocker_docs ;;
    esac
  else
    show_gocker_docs
  fi
else
  show_gocker_docs
fi
