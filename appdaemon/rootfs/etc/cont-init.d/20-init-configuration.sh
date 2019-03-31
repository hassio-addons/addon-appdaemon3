#!/usr/bin/with-contenv bashio
# ==============================================================================
# Community Hass.io Add-ons: AppDaemon
# Creates initial AppDaemon configuration in case it is non-existing
# ==============================================================================
if ! bashio::fs.directory_exists '/config/appdaemon'; then
    cp -R /root/appdaemon /config/appdaemon \
        || bashio::exit.nok 'Failed to create initial AppDaemon configuration'
fi
