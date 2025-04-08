#!/bin/bash

source ./.env

if [ ! -d /tmp/my_test_data ]; then
  mkdir -p /tmp/my_test_data
fi

docker run \
  --rm \
  -v /tmp/my_test_data:/data \
  -p 8082:8082 \
  -e USERNAME=${user} \
  -e PASSWORD=${pass} \
  -e DEVICEID=test \
  -e PORADI_SLUZBY=-1 \
  -e EPG_DNU_ZPETNE=1 \
  -e EPG_DNU_DOPREDU=1 \
  -e INTERVAL_STAHOVANI_EPG=5 \
  -e WEBSERVER_PORT=8082 \
  local/oneplay-server
