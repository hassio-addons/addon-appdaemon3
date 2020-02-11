#!/usr/bin/with-contenv bashio
# ==============================================================================
# Community Home Assistant Add-on: AppDaemon
# Removes symlink to the compiled directory on shutdown
# ==============================================================================
rm -f /config/appdaemon/compiled \
    ||  bashio::exit.nok 'Failed to remove symlink tp compiled directory'
