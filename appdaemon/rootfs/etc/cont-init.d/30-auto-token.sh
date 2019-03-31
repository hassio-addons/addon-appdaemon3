#!/usr/bin/with-contenv bashio
# ==============================================================================
# Community Hass.io Add-ons: AppDaemon
# Ensure the correct API key is in the AppDaemon is used
# ==============================================================================
readonly CONFIG_FILE="/config/appdaemon/appdaemon.yaml"

# Do not run when auto token has been disabled
if bashio::config.true 'disable_auto_token'; then
    bashio::log.info 'Automatic update of Home Assistant token is disabled.'
    exit "${EX_OK}"
fi

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
