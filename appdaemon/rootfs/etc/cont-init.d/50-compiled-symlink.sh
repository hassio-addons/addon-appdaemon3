#!/usr/bin/with-contenv bash
# ==============================================================================
# Community Hass.io Add-ons: AppDaemon
# Symlinks the compiled directory into the users AppDaemon directory
# ==============================================================================
# shellcheck disable=SC1091
source /usr/lib/hassio-addons/base.sh

if hass.directory_exists '/config/appdaemon/compiled'; then
    rm -f -r /config/appdaemon/compiled \
        || hass.die 'Failed to remove old compiled symlink'
fi

ln -s /data/compiled /config/appdaemon/compiled \
    ||  hass.die 'Failed to symlink to compiled directory'
