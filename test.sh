#!/usr/bin/env bash
set -ex
docker pull sillelien/base-robovm
cd $(dirname $0)
cd wrapper
docker build -t wrapper .
cd ../helloworld
mvn clean install
#Silly CircleCI bug - see https://github.com/ClusterHQ/powerstrip/issues/71
if [ -n "$CIRCLECI" ]
then
    #    disabled at the moment
    #sudo docker run -ti --privileged -v /run/docker.sock:/var/run/docker.sock -v $(pwd)/:/build/ wrapper sillelien/cyborg-helloworld:${CIRCLE_BRANCH} hello-world
    echo "Skipping CircleCI"
    #docker run -ti sillelien/cyborg-helloworld:${CIRCLE_BRANCH}
    #docker push sillelien/cyborg-helloworld:${CIRCLE_BRANCH}
else
    docker run -ti -v /var/run/docker.sock:/var/run/docker.sock -v $(pwd)/:/build/ wrapper sillelien/cyborg-helloworld:${CIRCLE_BRANCH} hello-world
fi

