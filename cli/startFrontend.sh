#!/bin/bash

function startDockerFrontend(){
    (cd ./; docker compose up frontend)
}

echo "launch dockerized fronted image"
startDockerFrontend