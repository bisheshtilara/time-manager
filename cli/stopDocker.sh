#!/bin/bash

function stopDocker(){
    docker stop $(docker ps -aq)
}

echo "stop docker"
stopDocker
