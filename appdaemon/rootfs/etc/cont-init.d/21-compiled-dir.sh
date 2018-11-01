#!/usr/bin/with-contenv bash
# ==============================================================================
# Community Hass.io Add-ons: AppDaemon
# Ensures directories for pre-compiled dashboard scripts exists
# ==============================================================================
# shellcheck disable=SC1091
source /usr/lib/hassio-addons/base.sh

if hass.directory_exists '/data/compiled'; then

    # Deleted compiled cache, in case we don't know the version
    if ! hass.file_exists '/data/version'; then
        hass.log.info "Detected version upgrade, clearing compiled cache..."
        rm -fr /data/compiled
    fi

    # Given version does not match
    if hass.file_exists '/data/version' \
        && [[ "$(</data/version)" != "$(hass.addon.version)" ]];
    then
        hass.log.info "Detected version upgrade, clearing compiled cache..."
        rm -fr /data/compiled
    fi
fi

if ! hass.directory_exists '/data/compiled'; then
    mkdir -p \
        /data/compiled/css \
        /data/compiled/html \
        /data/compiled/javascript \
        || hass.die 'Failed to created compiled directory'

    echo -e "$(hass.addon.version)" > /data/version
fi
