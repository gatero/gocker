#!/bin/bash
#: Title : run
#: Date : 27/feb/2017
#: Author : Daniel Ortega @gatero <me@daniel-ortega.mx>
#: Version : 0.0.3
#: Description : Run the project using docker-compose
#: Options : 
#:    -f) use your own docker-file
#:    -d) default docker-compose
#:    -h|*) help option

declare -a DOCKER_CONTAINERS=(`docker container ls --format "{{.Names}}"`)

#: Type : function
#: Description : print the configuration for up module
show_docs() {
  cat "$GOCKER_DIR/doc/run.txt"
}

#: Type : function
#: Description : run the program depends on passed options
run(){
display_run_menu;
}

#: Type : function
#: Description : print menu for container selection
display_run_menu() {
while true; do 
option=1
for i in "${DOCKER_CONTAINERS[@]}"
do
  echo "${option}) ${i}"
  option=$((option+1))
done
  echo "0) exit"
echo -n "select the container number: "
read container_number
case $container_number in 
   0 ) exit;;
   * ) re='^[0-9]+$';
       if [[ $container_number =~ $re ]] ; then
       if [ $((option+0)) -gt $((container_number+0)) ]
       then
          container_number=$((container_number-1))
          container=${DOCKER_CONTAINERS[container_number]}
          display_command_menu $container $container_number;
   else
          echo "invalid option:" $container_number
   fi
   else
          echo "invalid option:" $container_number
   fi
esac
done
}

#: Type : function
#: Description : print menu for/and run command in container selected
display_command_menu(){
   while true; do
   echo "\"b\" for return to main menu, \"q\" to exit "
   echo -n "write the command to exec in" $1": "
   read command
   if [ "$command" == "b" ] 
   then
       break
   elif [ "$command" == "q" ]
   then  
       exit
   else
      docker exec -i  $1 $command
      echo
   fi   
   done
}
export -f run;
