#!/usr/bin/with-contenv bashio
# shellcheck shell=bash

declare epg
declare epg_addr

epg=$(bashio::config 'epg_external')
epg_addr=$(bashio::config 'epg_addr')
 
if [ -S /config/tvheadend/epggrab/xmltv.sock ] && [ "$epg" = true ]; then
   curl ${epg_addr} | socat unix-connect:/config/tvheadend/epggrab/xmltv.sock STDIO
fi
