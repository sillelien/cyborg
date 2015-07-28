#!/usr/bin/env sh
cp -rf /build /build_for_real
cd /build_for_real
set -ex
tag="$1"
shift
executable="$1"
shift

/usr/local/robovm/bin/robovm -d . -config robovm.xml $@ -o $executable

if [ -z "$BASE_IMAGE" ]
then
    BASE_IMAGE="sillelien/jess:master"
fi

cat > Dockerfile <<EOF
FROM $BASE_IMAGE
COPY $executable /usr/local/$executable/$executable
COPY lib/ /usr/local/$executable/lib/
WORKDIR /usr/local/$executable
ENTRYPOINT ["/usr/local/$executable/$executable"]
EOF

docker build -t "$tag" .
