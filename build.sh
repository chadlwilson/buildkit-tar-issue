#!/bin/sh
set -ex

docker info

echo "Building with buildkit=$BUILDKIT_VERSION"
docker buildx rm --force tmp-builder || true
docker buildx create --use --name tmp-builder --driver-opt image=moby/buildkit:$BUILDKIT_VERSION
docker buildx inspect --bootstrap tmp-builder
docker buildx build --pull --platform linux/arm64 . --tag latest
