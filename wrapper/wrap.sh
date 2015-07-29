#!/usr/bin/env sh
cp -rf /build /build_for_real
cd /build_for_real
set -e
tag="$1"
shift
executable="$1"
shift

echo "Building Linux Executable $executable" >&2
/usr/local/robovm/bin/robovm -d . -config robovm.xml $@ -o $executable

if [ -z "$BASE_IMAGE" ]
then
    BASE_IMAGE="sillelien/jess:master"
fi

echo "Creating Dockerfile for $executable from $BASE_IMAGE" >&2
cat > Dockerfile <<EOF
FROM $BASE_IMAGE
COPY $executable /usr/local/$executable/$executable
COPY lib/ /usr/local/$executable/lib/
WORKDIR /usr/local/$executable
ENTRYPOINT ["/usr/local/$executable/$executable"]
EOF

echo "Building Docker Image $tag" >&2

docker build -t "$tag" .

echo "Built successfully, you can run now with: "  >&2
echo "$ docker run -ti $tag" >&2
