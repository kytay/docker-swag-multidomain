#!/bin/bash

./build.sh && \
docker run --env-file=./.secret -it -v $(pwd)/container-vol:/config --rm kytay/swag_multidomain:latest