#!/bin/bash

# environment vars
export GOCKER_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

. ${GOCKER_DIR}/config/main.sh
. ${GOCKER_DIR}/actions/main.sh

case $1 in
  destroy) destroy "${@:2}" ;;
  init) init "${@:2}" ;;
  start) start "${@:2}" ;;
  run) run "${@:2}" ;;
  context) . ${GOCKER_DIR}/config/main.sh ;;
  rebuild) rebuild "${@:2}" ;;
esac
