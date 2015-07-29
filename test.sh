#!/usr/bin/env bash
set -ex
docker pull sillelien/base-robovm
cd $(dirname $0)
cd wrapper
docker build -t wrapper .
cd ../helloworld
mvn clean install
if [ -n "$CIRCLE_CI" ]
then
docker run -ti -v /run/docker.sock:/var/run/docker.sock -v $(pwd)/:/build/ wrapper hello-docker hello-world
else
docker run -ti -v /var/run/docker.sock:/var/run/docker.sock -v $(pwd)/:/build/ wrapper hello-docker hello-world
fi
docker run -ti hello-docker

