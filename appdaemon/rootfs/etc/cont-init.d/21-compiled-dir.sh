#!/usr/bin/with-contenv bashio
# ==============================================================================
# Community Hass.io Add-ons: AppDaemon
# Ensures directories for pre-compiled dashboard scripts exists
# ==============================================================================
if bashio::fs.directory_exists '/data/compiled'; then

    # Deleted compiled cache, in case we don't know the version
    if ! bashio::fs.file_exists '/data/version'; then
        bashio::log.info "Detected version upgrade, clearing compiled cache..."
        rm -fr /data/compiled
    fi

    # Given version does not match
    if bashio::fs.file_exists '/data/version' \
        && [[ "$(</data/version)" != "$(bashio::addon.version)" ]];
    then
        bashio::log.info "Detected version upgrade, clearing compiled cache..."
        rm -fr /data/compiled
    fi
fi

if ! bashio::fs.directory_exists '/data/compiled'; then
    mkdir -p \
        /data/compiled/css \
        /data/compiled/html \
        /data/compiled/javascript \
        || bashio::exit.nok 'Failed to created compiled directory'

    echo -e "$(hass.addon.version)" > /data/version
fi
