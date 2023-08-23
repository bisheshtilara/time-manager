#!/bin/bash

function startDocker(){
    (cd ./; docker compose up -d)
}

echo "launch dockerized image"
startDocker