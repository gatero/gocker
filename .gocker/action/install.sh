#!/bin/bash

COMMANDS=('prune', 'ensure', 'status', 'version')
echo $@
echo `expr "${COMMANDS[*]}" : 'prune'`
