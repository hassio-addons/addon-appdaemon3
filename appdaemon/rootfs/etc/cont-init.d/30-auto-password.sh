#!/usr/bin/with-contenv bash
# ==============================================================================
# Community Hass.io Add-ons: AppDaemon
# Ensure the correct API key is in the AppDaemon is used
# ==============================================================================
# shellcheck disable=SC1091
source /usr/lib/hassio-addons/base.sh

readonly CONFIG_FILE="/config/appdaemon/appdaemon.yaml"
declare TMP_FILE

if [[ "$(yq -r '.appdaemon.plugins.HASS.ha_url' ${CONFIG_FILE})" = "http://hassio/homeassistant"
    && "$(yq -r '.appdaemon.plugins.HASS.ha_key' ${CONFIG_FILE})" != "${HASSIO_TOKEN}"
    && "$(yq -r '.appdaemon.plugins.HASS.ha_key' ${CONFIG_FILE})" != '!secret '* ]];
then
    TMP_FILE=$(mktemp)

    hass.log.info 'ha_key is missing in the AppDaemon configuration, fixing...'

    yq -y -c ".appdaemon.plugins.HASS=(.appdaemon.plugins.HASS + { \"ha_key\": \"${HASSIO_TOKEN}\" })" \
        "${CONFIG_FILE}" > "${TMP_FILE}" \
        || hass.die 'Failed to set Hass.io API token into the AppDaemon config'

    mv "${TMP_FILE}" "${CONFIG_FILE}" \
        || hass.die 'Failed updating the Hass.io configuration'
fi
