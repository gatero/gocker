## gocker
This project pretends to be a useful tool for wrap docker projects on a insulated development ambiance
this starts as a tool for golang projects but I'll try to create and abstract tool for any project that
uses docker the only requirement will be the custom docker-compose file for each project.

## Get started

~~~sh
# Download gocker as a submodule into your rootpath:
$ git submodule add git@github.com:gatero/gocker.git .gocker

# At your rootpath create a symlink to the gocker.sh file
$ ln -s .gocker/gocker.sh gocker

# after this you need create a docker-compose file into your rootpath, you can use the init subcommand to this purpose
# this will create two empty files, docker-compose.yml and environment.cfg
# you can define your custom environment vars into environment.cfg and use them on your docker-compose.yml
$ sh gocker init 

# When you have your environment and docker compose ready you can run it with:
$ sh gocker up

# if you need destroy your project you only need export a array named $DOCKER_CONTAINERS
$ export DOCKER_CONTAINERS=("CONTAINER_NAME_1" "CONTAINER_NAME_2")

# after this you can run:
$ sh gocker destroy -a # for example
~~~
