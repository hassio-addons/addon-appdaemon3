#!/usr/bin/with-contenv bashio
# ==============================================================================
# Community Hass.io Add-ons: AppDaemon
# Configures AppDaemon
# ==============================================================================
readonly CONFIG_FILE="/config/appdaemon/appdaemon.yaml"
declare arch
declare ha_url

# Creates initial AppDaemon configuration in case it is non-existing
if ! bashio::fs.directory_exists '/config/appdaemon'; then
    cp -R /root/appdaemon /config/appdaemon \
        || bashio::exit.nok 'Failed to create initial AppDaemon configuration'
fi

# Ensures directories for pre-compiled dashboard scripts exists
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

    echo -e "$(bashio::addon.version)" > /data/version
fi

# Ensure the correct API key is in the AppDaemon is used
if bashio::config.false 'disable_auto_token'; then
    # Ensure older key is deleted
    yq delete --inplace "${CONFIG_FILE}" 'appdaemon.plugins.HASS.ha_key'

    # Add token
    if [[ "$(yq read ${CONFIG_FILE} 'appdaemon.plugins.HASS.ha_url')" = "http://hassio/homeassistant"
        && "$(yq read ${CONFIG_FILE} 'appdaemon.plugins.HASS.token')" != "${HASSIO_TOKEN}"
        && "$(yq read ${CONFIG_FILE} 'appdaemon.plugins.HASS.token')" != '!secret '* ]];
    then
        bashio::log.info \
            'Updating Hass.io API token in AppDaemon with the current one...'

        yq write --inplace "${CONFIG_FILE}" \
            'appdaemon.plugins.HASS.token' "${HASSIO_TOKEN}" \
            || bashio::exit.nok 'Failed to set Hass.io API token into the AppDaemon config'
    fi
fi

# Checks the currently used HA URL and warns if the Hass.io proxy isn't used
ha_url=$(yq read "${CONFIG_FILE}" 'appdaemon.plugins.HASS.ha_url')
if [[ "${ha_url}" != "http://hassio/homeassistant" ]]; then
    bashio::log.warning 'You are using an non-recommended Home Assistant URL!'
    bashio::log.warning 'Setting the "ha_url" option in your AppDaemon config to'
    bashio::log.warning '"http://hassio/homeassistant" is recommended!'
fi

# Symlinks the compiled directory into the users AppDaemon directory
if bashio::fs.directory_exists '/config/appdaemon/compiled'; then
    rm -f -r /config/appdaemon/compiled \
        || bashio::exit.nok 'Failed to remove old compiled symlink'
fi

ln -s /data/compiled /config/appdaemon/compiled \
    ||  bashio::exit.nok 'Failed to symlink to compiled directory'

# Install user configured/requested packages
if bashio::config.has_value 'system_packages'; then
    apk update \
        || bashio::exit.nok 'Failed updating Alpine packages repository indexes'

    for package in $(bashio::config 'system_packages'); do
        apk add "$package" \
            || bashio::exit.nok "Failed installing package ${package}"
    done
fi

# Install user configured/requested Python packages
if bashio::config.has_value 'python_packages'; then
    arch=$(bashio::info.arch)
    for package in $(bashio::config 'python_packages'); do
        pip3 install \
            --prefer-binary \
            --find-links "https://wheels.hass.io/alpine-3.10/${arch}/" \
            "$package" \
                || bashio::exit.nok "Failed installing package ${package}"
    done
fi
