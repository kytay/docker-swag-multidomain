#!/bin/bash

./build.sh && \
docker run --env-file=./.secret -it --rm swag_multidomain:latest