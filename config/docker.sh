#!/bin/bash

export DOCKER_IMAGE_GOLANG="gatero/gocker"
export DOCKER_IMAGE_NODEJS="node:8.9.4"
export DOCKER_IMAGE_PROXY="jwilder/nginx-proxy"
export DOCKER_CONTAINER_PROXY="nginx-proxy"

export DOCKER_CONTAINER_API=$API_URL
export DOCKER_CONTAINER_DB=$DB_URL
