#!/bin/bash

get_parent() {
    local dir="$(dirname "$(realpath "${BASH_SOURCE[0]}")")"
    for ((i=0; i<$1; i++)); do dir="$(dirname "$dir")"; done
    echo "$dir"
}

TAG="deepcv/subconverter:latest"

cd $(get_parent 0)
docker build \
    --pull \
    --no-cache \
    --progress=plain \
    -f ./Dockerfile \
    -t $TAG \
    .
docker push $TAG
