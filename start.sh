#!/bin/bash

if [ -f telegram_token ]
then
    ruby src/main.rb $(cat telegram_token)
else
    file telegram_token
    exit 1
fi
