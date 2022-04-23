#!/bin/bash

IMAGE_NAME=swag_cloudflare

./build.sh && \
docker run --env-file=./.secret -it -v $(pwd)/container-vol:/config --rm kytay/${IMAGE_NAME}:latest /bin/bash