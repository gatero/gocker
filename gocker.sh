#!/bin/bash

# environment vars
. .gocker/config/main.sh
. .gocker/actions/main.sh

case $1 in
  destroy) destroy "${@:2}" ;;
  init) init "${@:2}" ;;
  start) start "${@:2}" ;;
  run) run "${@:2}" ;;
  context) . .gocker/config/main.sh ;;
  rebuild) rebuild "${@:2}" ;;
esac
