#!/usr/bin/with-contenv bash
# ==============================================================================
# Community Hass.io Add-ons: AppDaemon
# Install user configured/requested packages
# ==============================================================================
# shellcheck disable=SC1091
source /usr/lib/hassio-addons/base.sh

if hass.config.has_value 'system_repo'; then
    for repo in $(hass.config.get 'system_repo'); do
		echo "${repo}" >> /etc/apk/repositories || hass.die "Failed add repo ${repo}"
    done
fi


if hass.config.has_value 'system_packages'; then
	apk update \
        || hass.die 'Failed updating Alpine packages repository indexes'

    for package in $(hass.config.get 'system_packages'); do
        apk add "$package" \
            || hass.die "Failed installing package ${package}"
    done
fi
