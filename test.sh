#!/usr/bin/env bash
set -ex
docker pull sillelien/base-robovm
cd $(dirname $0)
cd wrapper
docker build -t wrapper .
cd ../helloworld
docker run -ti -v /var/run/docker.sock:/var/run/docker.sock -v $(pwd)/:/build/ wrapper hello-docker hello-world
docker run -ti hello-docker

