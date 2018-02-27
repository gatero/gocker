## gocker
This project pretends to be a useful tool for wrap docker projects on a insulated development ambiance
this starts as a tool for golang projects but I'll try to create and abstract tool for any project that
uses docker the only requirement will be the custom docker-compose file for each project.

## Get started

The tool is composed by 6 tasks:

- init: it will be a client to do easier the project configuration
- start: start task find the dockerfile or the docker image on docker hub and then run all the orchestation using the docker-compose
- run: this command allow you to run any command inside your docker container
- context: set the current context in your tty instance
- rebuild: rebuild the application context
- destroy: this command has some aviable options that let's you destroy the container, the image, or db
  
  example:
    .gocker/gocker.sh destroy -<a|d|i>

In all cases you need use gocker as follows:

.gocker/gocker.sh <command> <options>
