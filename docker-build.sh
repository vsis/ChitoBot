#!/bin/bash

version=$(cat version)
timestamp=$(date +%Y.%m.%d.%H.%M.%S)
tag=${version}-${timestamp}

if [ -f telegram_token ]
then
    docker build -t chitobot:${tag} . && docker tag chitobot:${tag} chitobot:latest
else
    file telegram_token
    exit 1
fi
