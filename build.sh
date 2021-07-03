#!/bin/bash

cd ./docker-swag && \
git submodule init && git submodule update && \
cp -f ../scripts_ext/cont-init.d/* root/etc/cont-init.d && \
cp -f ../scripts_ext/cont-init.d/80-digitalocean-dns-updater root/app/do-dnsupdate.sh && \

docker build \
  --no-cache \
  --pull \
  -t kytay/swag_multidomain:latest .

docker tag kytay/swag_multidomain:latest kytay/swag_multidomain:$(date --rfc-3339=date)
docker push -a kytay/swag_multidomain