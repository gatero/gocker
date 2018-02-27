#!/bin/bash

# environment vars
export GOCKER_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/.gocker"

. ${GOCKER_DIR}/config/main.sh
. ${GOCKER_DIR}/actions/main.sh

case $1 in
  destroy) destroy "$@" ;;
  init) init "$@" ;;
  start) start "$@" ;;
  run) run "$@" ;;
  context) . ${GOCKER_DIR}/config/main.sh ;;
  rebuild) rebuild "$@" ;;
esac
