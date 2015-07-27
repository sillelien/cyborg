#!/usr/bin/env sh
set -ex
tag=$1
shift
executable=$2
shift
/usr/local/robovm/bin/robovm -d /build -o $2 $@
cat > /tmp/Dockerfile <<EOF
FROM scratch
COPY . /usr/local/$2
COPY $2 /bin/$2
WORKDIR /usr/local/$2
ENTRYPOINT ["/bin/$2"]
EOF
docker build -f /tmp/Dockerfile -t $tag /build
