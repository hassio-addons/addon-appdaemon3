#!/usr/bin/with-contenv bashio
# ==============================================================================
# Home Assistant Community Add-on: AppDaemon
# Removes symlink to the compiled directory on shutdown
# ==============================================================================
rm -f /config/appdaemon/compiled \
    ||  bashio::exit.nok 'Failed to remove symlink tp compiled directory'
