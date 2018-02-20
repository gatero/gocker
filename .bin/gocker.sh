#!/bin/bash
case $1 in
  start) . .bin/start.sh "${@:2}" ;;
  install) . .bin/install.sh "${@:2}" ;;
  uninstall) . .bin/uninstall "${@:2}" ;;
  clean) . .bin/clean.sh "${@:2}" ;;
esac
