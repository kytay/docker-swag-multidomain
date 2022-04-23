#!/bin/bash

IMAGE_NAME=swag_cloudflare

cd ./docker-swag && \
rm -Rf $(git status -s | awk '{print $2}' | tr '\n' ' ') 
git submodule init && \
git submodule update && \
cp -rf ../scripts_ext/app/* root/app
cp -rf ../scripts_ext/cont-init.d/* root/etc/cont-init.d

docker build \
  --no-cache \
  --pull \
  -t kytay/${IMAGE_NAME}:latest .

docker tag kytay/${IMAGE_NAME}:latest kytay/${IMAGE_NAME}:$(date --rfc-3339=date)
docker push -a kytay/${IMAGE_NAME}