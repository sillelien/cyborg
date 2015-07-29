#!/usr/bin/env sh
set -ex
cd /build
/usr/local/robovm/bin/robovm -cc /usr/bin/gcc -use-debug-libs  -d /build -config robovm.xml $@
