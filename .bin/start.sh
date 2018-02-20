#!/bin/bash
while getopts ":r:p:" option
do
  case "${option}"
    in
    r) RELOAD=${OPTARG};;
    p) PRUEBA=${OPTARG};;
  esac
done

if [ -x "$(command -v docker-compose)" ]; then
  docker-compose up
fi
