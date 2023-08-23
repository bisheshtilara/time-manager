#!/bin/bash

function startDockerBackend(){
   (cd ./; docker compose up db -d)
   (cd ./; docker compose up elixir)
}

echo "launch dockerized backend image"
startDockerBackend