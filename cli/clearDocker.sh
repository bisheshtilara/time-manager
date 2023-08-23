#!/bin/bash

function clearAllDockerImages(){
    docker stop $(docker ps -aq)
    docker rm $(docker ps -aq)
    docker rmi $(docker images -q)
}

echo "clear all docker images"
clearAllDockerImages