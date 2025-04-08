#!/usr/bin/with-contenv bashio
# shellcheck shell=bash

path_epg="/share/tv"
declare share_epg

share_epg=$(bashio::config 'share_epg')

if [ "$share_epg" = "true" ]; then
  if [ ! -d "$path_epg" ]; then
    mkdir -p "$path_epg"
  fi
   wget http://127.0.0.1:8082/epg -O ${path_epg}/epg
fi
