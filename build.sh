#!/bin/sh

if ! [[ -d ./bin/ ]]
then
    mkdir bin
fi

ARCH=`uname -m`
OS=`uname | tr '[:upper:]' '[:lower:]'`
VERSION=`cat shard.yml | grep -m 1 'version: ' | sed -e 's/version: //g'`

echo "Build $VERSION for `uname` `uname -m`"

crystal build --progress --no-debug --release src/vk0nline.cr -o bin/vk0nline-$VERSION.$OS-$ARCH

