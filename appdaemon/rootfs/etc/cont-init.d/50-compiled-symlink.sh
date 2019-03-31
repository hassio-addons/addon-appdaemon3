#!/usr/bin/with-contenv bashio
# ==============================================================================
# Community Hass.io Add-ons: AppDaemon
# Symlinks the compiled directory into the users AppDaemon directory
# ==============================================================================
if bashio::fs.directory_exists '/config/appdaemon/compiled'; then
    rm -f -r /config/appdaemon/compiled \
        || bashio::exit.nok 'Failed to remove old compiled symlink'
fi

ln -s /data/compiled /config/appdaemon/compiled \
    ||  bashio::exit.nok 'Failed to symlink to compiled directory'
