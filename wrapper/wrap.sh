#!/usr/bin/env sh
cp -rf /build /build_for_real
cd /build_for_real
set -ex
tag=$1
shift
executable=$1
shift
/usr/local/robovm/bin/robovm -d . -config robovm.xml $@ -o $executable
cat > Dockerfile <<EOF
FROM debian:wheezy
COPY . /usr/local/$executable
RUN chmod 755 /usr/local/$executable/$executable
WORKDIR /usr/local/$executable
ENTRYPOINT ["/usr/local/$executable/$executable"]
EOF
docker build -t $tag .
