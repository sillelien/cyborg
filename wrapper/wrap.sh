#!/usr/bin/env sh
tag=$1
shift
executable=$2
shift
/usr/local/robovm/bin/robovm -d /build -o $2 $@
cat > /tmp/Dockerfile <<EOF
FROM wheezy
COPY . /usr/local/$2
COPY $2 /bin/$2
WORKDIR /usr/local/$2
ENTRYPOINT ["/bin/$2"]
EOF
docker build -f /tmp/Dockerfile -t $tag /build
