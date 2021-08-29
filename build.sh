#!/bin/sh

if ! [[ -d ./bin/ ]]
then
    mkdir bin
fi

crystal build --progress --no-debug --release src/vk0nline.cr -o bin/vk0nline.x86_64-lnx