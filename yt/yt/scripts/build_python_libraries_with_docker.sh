#!/bin/bash -eu

mkdir -p ../ya_build
rm -rf ../ya_build/*

YA_BUILD_PATH=$(realpath $(pwd)/../ya_build)

container_id=$(docker container run --name yson-bindings-build --entrypoint /bin/bash -v $(pwd)/ytsaurus:/ytsaurus -v $YA_BUILD_PATH:/ya_build -dit quay.io/pypa/manylinux2014_x86_64)

docker exec -it $container_id /ytsaurus/yt/yt/scripts/build_manylinux_yson_bindings.sh
