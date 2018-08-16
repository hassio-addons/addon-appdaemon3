#!/usr/bin/with-contenv bash
# ==============================================================================
# Community Hass.io Add-ons: AppDaemon
# Ensure the correct API key is in the AppDaemon is used
# ==============================================================================
# shellcheck disable=SC1091
source /usr/lib/hassio-addons/base.sh

readonly CONFIG_FILE="/config/appdaemon/appdaemon.yaml"

if [[ "$(yq read ${CONFIG_FILE} 'appdaemon.plugins.HASS.ha_url')" = "http://hassio/homeassistant"
    && "$(yq read ${CONFIG_FILE} 'appdaemon.plugins.HASS.ha_key')" != "${HASSIO_TOKEN}"
    && "$(yq read ${CONFIG_FILE} 'appdaemon.plugins.HASS.ha_key')" != '!secret '* ]];
then
    hass.log.info 'ha_key is missing in the AppDaemon configuration, fixing...'

    yq write --inplace "${CONFIG_FILE}" \
        'appdaemon.plugins.HASS.ha_url' "${HASSIO_TOKEN}" \
        || hass.die 'Failed to set Hass.io API token into the AppDaemon config'
fi
