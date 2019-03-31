#!/usr/bin/with-contenv bashio
# ==============================================================================
# Community Hass.io Add-ons: AppDaemon
# Checks the currently used HA URL and warns if the Hass.io proxy isn't used
# ==============================================================================
readonly CONFIG_FILE="/config/appdaemon/appdaemon.yaml"
readonly HA_URL=$(yq read "${CONFIG_FILE}" 'appdaemon.plugins.HASS.ha_url')

if [[ "${HA_URL}" != "http://hassio/homeassistant" ]]; then
    bashio::log.warning 'You are using an non-recommended Home Assistant URL!'
    bashio::log.warning 'Setting the "ha_url" option in your AppDaemon config to'
    bashio::log.warning '"http://hassio/homeassistant" is recommended!'
fi
