#!/usr/bin/with-contenv bash
# ==============================================================================
# Community Hass.io Add-ons: AppDaemon
# Removes symlink to the compiled directory on shutdown
# ==============================================================================
# shellcheck disable=SC1091
source /usr/lib/hassio-addons/base.sh

rm -f /config/appdaemon/compiled \
    ||  hass.die 'Failed to remove symlink tp compiled directory'
