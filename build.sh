#!/bin/bash

cd ./docker-swag && \
rm $(git status -s | awk '{print $2}' | tr '\n' ' ') 
git submodule init && \
git submodule update && \
cp -f ../scripts_ext/cont-init.d/* root/etc/cont-init.d

docker build \
  --no-cache \
  --pull \
  -t kytay/swag_multidomain:latest .

docker tag kytay/swag_multidomain:latest kytay/swag_multidomain:$(date --rfc-3339=date)
docker push -a kytay/swag_multidomain