#!/bin/bash

docker rm -f ChitoBot
docker run -d -v /etc/localtime:/etc/localtime --name ChitoBot chitobot:latest
