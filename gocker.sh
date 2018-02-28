#!/bin/bash

# environment vars
export GOCKER_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/.gocker"

. ${GOCKER_DIR}/config/main.sh
. ${GOCKER_DIR}/actions/main.sh

case $1 in
  up) shift && up "$@" ;;
  init) shift && init "$@" ;;
  run) shift && run "$@" ;;
  context) shift && . ${GOCKER_DIR}/config/main.sh ;;
  rebuild) shift && rebuild "$@" ;;
  destroy) shift && destroy "$@" ;;
esac
