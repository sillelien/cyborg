#!/usr/bin/env bash
docker pull sillelien/base-robovm
cd $(dirname $0)
cd wrapper
docker build -t wrapper .
cd ../helloworld
docker run -ti -v $(pwd)/:/build/ wrapper hello-docker hello-world
docker run -ti hello-docker

