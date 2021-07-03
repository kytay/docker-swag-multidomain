#!/bin/bash

./build.sh && \
docker run --env-file=./.secret -it --rm kytay/swag_multidomain:latest