#!/usr/bin/with-contenv bash
# ==============================================================================
# Community Hass.io Add-ons: AppDaemon
# Ensures directories for pre-compiled dashboard scripts exists
# ==============================================================================
# shellcheck disable=SC1091
source /usr/lib/hassio-addons/base.sh

mkdir -p \
    /data/compiled/css \
    /data/compiled/html \
    /data/compiled/javascript \
    || hass.die 'Failed to created compiled directory'
