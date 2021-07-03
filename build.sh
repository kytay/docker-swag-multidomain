#!/bin/bash

cd ./docker-swag && \
git submodule init && git submodule update && \
cp ../scripts_ext/cont-init.d/* root/etc/cont-init.d && \
cp ../scripts_ext/cont-init.d/80-digitalocean-dns-updater root/app/do-dnsupdate.sh && \
docker build \
  --no-cache \
  --pull \
  -t swag_multidomain:latest .
