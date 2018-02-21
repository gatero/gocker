#!/bin/bash

# environment vars
. .gocker/config/main.sh

. .gocker/action/verify-dependencies.sh $1 

case $1 in
  init) . .gocker/action/init.sh "${@:2}" ;;
  start) . .gocker/action/start.sh "${@:2}" ;;
  dep) . .gocker/action/dep.sh "${@:2}" ;;
  get_context) . .gocker/config/main.sh ;;
  destroy) . .gocker/action/destroy.sh "${@:2}" ;;
  rebuild) . .gocker/action/rebuild-image.sh "${@:2}" ;;
esac
