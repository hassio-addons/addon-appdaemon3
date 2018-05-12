# Community Hass.io Add-ons: AppDaemon

[![GitHub Release][releases-shield]][releases]
![Project Stage][project-stage-shield]
[![License][license-shield]](LICENSE.md)

[![GitLab CI][gitlabci-shield]][gitlabci]
![Project Maintenance][maintenance-shield]
[![GitHub Activity][commits-shield]][commits]

[![Bountysource][bountysource-shield]][bountysource]
[![Discord][discord-shield]][discord]
[![Community Forum][forum-shield]][forum]

[![Buy me a coffee][buymeacoffee-shield]][buymeacoffee]

![HADashboard screenshot](images/screenshot.png)

Python Apps and HADashboard for Home Assistant

## About

AppDaemon is a loosely coupled, multithreaded, sandboxed python execution
environment for writing automation apps for Home Assistant home automation
software. It also provides a configurable dashboard (HADashboard) suitable
for wall mounted tablets.

## Installation

The installation of this add-on is pretty straightforward and not different in
comparison to installing any other Hass.io add-on.

1. [Add our Hass.io add-ons repository][repository] to your Hass.io instance.
1. Install the "AppDaemon3" add-on.
1. Start the "AppDaemon3" add-on
1. Check the logs of the "AppDaemon3" add-on to see if everything went well.

**NOTE**: Do not add this repository to Hass.io, please use:
`https://github.com/hassio-addons/repository`.

## Docker status

[![Docker Architecture][armhf-arch-shield]][armhf-dockerhub]
[![Docker Version][armhf-version-shield]][armhf-microbadger]
[![Docker Layers][armhf-layers-shield]][armhf-microbadger]
[![Docker Pulls][armhf-pulls-shield]][armhf-dockerhub]
[![Anchore Image Overview][armhf-anchore-shield]][armhf-anchore]

[![Docker Architecture][aarch64-arch-shield]][aarch64-dockerhub]
[![Docker Version][aarch64-version-shield]][aarch64-microbadger]
[![Docker Layers][aarch64-layers-shield]][aarch64-microbadger]
[![Docker Pulls][aarch64-pulls-shield]][aarch64-dockerhub]
[![Anchore Image Overview][aarch64-anchore-shield]][aarch64-anchore]

[![Docker Architecture][amd64-arch-shield]][amd64-dockerhub]
[![Docker Version][amd64-version-shield]][amd64-microbadger]
[![Docker Layers][amd64-layers-shield]][amd64-microbadger]
[![Docker Pulls][amd64-pulls-shield]][amd64-dockerhub]
[![Anchore Image Overview][amd64-anchore-shield]][amd64-anchore]

[![Docker Architecture][i386-arch-shield]][i386-dockerhub]
[![Docker Version][i386-version-shield]][i386-microbadger]
[![Docker Layers][i386-layers-shield]][i386-microbadger]
[![Docker Pulls][i386-pulls-shield]][i386-dockerhub]
[![Anchore Image Overview][i386-anchore-shield]][i386-anchore]

## Configuration

**Note**: _Remember to restart the add-on when the configuration is changed._

Example add-on configuration:

```json
{
  "log_level": "info",
  "system_packages": [
    "ffmpeg"
  ],
  "python_packages": [
    "PyMySQL",
    "Pillow"
  ]
}
```

**Note**: _This is just an example, don't copy and past it! Create your own!_

### Option: `log_level`

The `log_level` option controls the level of log output by the addon and can
be changed to be more or less verbose, which might be useful when you are
dealing with an unknown issue. Possible values are:

- `trace`: Show every detail, like all called internal functions.
- `debug`: Shows detailed debug information.
- `info`: Normal (usually) interesting events.
- `warning`: Exceptional occurrences that are not errors.
- `error`:  Runtime errors that do not require immediate action.
- `fatal`: Something went terribly wrong. Add-on becomes unusable.

Please note that each level automatically includes log messages from a
more severe level, e.g., `debug` also shows `info` messages. By default,
the `log_level` is set to `info`, which is the recommended setting unless
you are troubleshooting.

These log level also affects the log levels of the AppDaemon.

### Option: `system_packages`

Allows you to specify additional [Alpine packages][alpine-packages] to be
installed to your AppDaemon setup (e.g., `g++`. `make`, `ffmpeg`).

**Note**: _Adding many packages will result in a longer start-up time
for the add-on._

### Option: `python_packages`

Allows you to specify additional [Python packages][python-packages] to be
installed to your AppDaemon setup (e.g., `PyMySQL`. `Requests`, `Pillow`).

**Note**: _Adding many packages will result in a longer start-up time
for the add-on._

## AppDaemon and HADashboard configuration

This add-on does not configure the AppDaemon or HADashboard for you.
It does, however, create some sample files to get you started on the first run.

The configuration of the AppDaemon can be found in the `/config/appdaemon`
directory.

For more information about configuring AppDaemon, please refer to the
extensive documentation they offer:

<http://appdaemon.readthedocs.io/en/latest/>

## Changelog & Releases

This repository keeps a change log using [GitHub's releases][releases]
functionality. The format of the log is based on
[Keep a Changelog][keepchangelog].

Releases are based on [Semantic Versioning][semver], and use the format
of ``MAJOR.MINOR.PATCH``. In a nutshell, the version will be incremented
based on the following:

- ``MAJOR``: Incompatible or major changes.
- ``MINOR``: Backwards-compatible new features and enhancements.
- ``PATCH``: Backwards-compatible bugfixes and package updates.

## Support

Got questions?

You have several options to get them answered:

- The Home Assistant [Community Forum][forum], we have a
  [dedicated topic][forum] on that forum regarding this add-on.
- The Home Assistant [Discord Chat Server][discord] for general Home Assistant
  discussions and questions.
- Join the [Reddit subreddit][reddit] in [/r/homeassistant][reddit]

You could also [open an issue here][issue] GitHub.

## Contributing

This is an active open-source project. We are always open to people who want to
use the code or contribute to it.

We have set up a separate document containing our
[contribution guidelines](CONTRIBUTING.md).

Thank you for being involved! :heart_eyes:

## Authors & contributors

The original setup of this repository is by [Franck Nijhof][frenck].

For a full list of all authors and contributors,
check [the contributor's page][contributors].

## We have got some Hass.io add-ons for you

Want some more functionality to your Hass.io Home Assistant instance?

We have created multiple add-ons for Hass.io. For a full list, check out
our [GitHub Repository][repository].

## License

MIT License

Copyright (c) 2018 Franck Nijhof

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

[aarch64-anchore-shield]: https://anchore.io/service/badges/image/455bd9cba7f1e89ef182ce142230053b77e40fc7e01d3ef127636d7410ee5dcb
[aarch64-anchore]: https://anchore.io/image/dockerhub/hassioaddons%2Fappdaemon3-aarch64%3Alatest
[aarch64-arch-shield]: https://img.shields.io/badge/architecture-aarch64-blue.svg
[aarch64-dockerhub]: https://hub.docker.com/r/hassioaddons/appdaemon3-aarch64
[aarch64-layers-shield]: https://images.microbadger.com/badges/image/hassioaddons/appdaemon3-aarch64.svg
[aarch64-microbadger]: https://microbadger.com/images/hassioaddons/appdaemon3-aarch64
[aarch64-pulls-shield]: https://img.shields.io/docker/pulls/hassioaddons/appdaemon3-aarch64.svg
[aarch64-version-shield]: https://images.microbadger.com/badges/version/hassioaddons/appdaemon3-aarch64.svg
[alpine-packages]: https://pkgs.alpinelinux.org/packages
[amd64-anchore-shield]: https://anchore.io/service/badges/image/32da6e9da8fc42adcbb6da2ade62b24f84ce08c9490069aea9026267df23ab26
[amd64-anchore]: https://anchore.io/image/dockerhub/hassioaddons%2Fappdaemon3-amd64%3Alatest
[amd64-arch-shield]: https://img.shields.io/badge/architecture-amd64-blue.svg
[amd64-dockerhub]: https://hub.docker.com/r/hassioaddons/appdaemon3-amd64
[amd64-layers-shield]: https://images.microbadger.com/badges/image/hassioaddons/appdaemon3-amd64.svg
[amd64-microbadger]: https://microbadger.com/images/hassioaddons/appdaemon3-amd64
[amd64-pulls-shield]: https://img.shields.io/docker/pulls/hassioaddons/appdaemon3-amd64.svg
[amd64-version-shield]: https://images.microbadger.com/badges/version/hassioaddons/appdaemon3-amd64.svg
[armhf-anchore-shield]: https://anchore.io/service/badges/image/a7b22fe5d4d5108d9455bd6b531dac365fe54f89962626611b56297240951527
[armhf-anchore]: https://anchore.io/image/dockerhub/hassioaddons%2Fappdaemon3-armhf%3Alatest
[armhf-arch-shield]: https://img.shields.io/badge/architecture-armhf-blue.svg
[armhf-dockerhub]: https://hub.docker.com/r/hassioaddons/appdaemon3-armhf
[armhf-layers-shield]: https://images.microbadger.com/badges/image/hassioaddons/appdaemon3-armhf.svg
[armhf-microbadger]: https://microbadger.com/images/hassioaddons/appdaemon3-armhf
[armhf-pulls-shield]: https://img.shields.io/docker/pulls/hassioaddons/appdaemon3-armhf.svg
[armhf-version-shield]: https://images.microbadger.com/badges/version/hassioaddons/appdaemon3-armhf.svg
[bountysource-shield]: https://img.shields.io/bountysource/team/hassio-addons/activity.svg
[bountysource]: https://www.bountysource.com/teams/hassio-addons/issues
[commits-shield]: https://img.shields.io/github/commit-activity/y/hassio-addons/addon-appdaemon3.svg
[commits]: https://github.com/hassio-addons/addon-appdaemon3/commits/master
[contributors]: https://github.com/hassio-addons/addon-appdaemon3/graphs/contributors
[discord-shield]: https://img.shields.io/discord/330944238910963714.svg
[discord]: https://discord.gg/c5DvZ4e
[forum-shield]: https://img.shields.io/badge/community-forum-brightgreen.svg
[forum]: https://community.home-assistant.io/t/community-hass-io-add-on-appdaemon3/41261?u=frenck
[frenck]: https://github.com/frenck
[home-assistant]: https://home-assistant.io
[i386-anchore-shield]: https://anchore.io/service/badges/image/0da227504ac93f94e8787876d430fec49a6f4aadfd8347f6ac7b9f2b58bc61f9
[i386-anchore]: https://anchore.io/image/dockerhub/hassioaddons%2Fappdaemon3-i386%3Alatest
[i386-arch-shield]: https://img.shields.io/badge/architecture-i386-blue.svg
[i386-dockerhub]: https://hub.docker.com/r/hassioaddons/appdaemon3-i386
[i386-layers-shield]: https://images.microbadger.com/badges/image/hassioaddons/appdaemon3-i386.svg
[i386-microbadger]: https://microbadger.com/images/hassioaddons/appdaemon3-i386
[i386-pulls-shield]: https://img.shields.io/docker/pulls/hassioaddons/appdaemon3-i386.svg
[i386-version-shield]: https://images.microbadger.com/badges/version/hassioaddons/appdaemon3-i386.svg
[issue]: https://github.com/hassio-addons/addon-appdaemon3/issues
[keepchangelog]: http://keepachangelog.com/en/1.0.0/
[license-shield]: https://img.shields.io/github/license/hassio-addons/addon-appdaemon3.svg
[maintenance-shield]: https://img.shields.io/maintenance/yes/2018.svg
[project-stage-shield]: https://img.shields.io/badge/project%20stage-production%20ready-brightgreen.svg
[python-packages]: https://pypi.org/
[reddit]: https://reddit.com/r/homeassistant
[releases-shield]: https://img.shields.io/github/release/hassio-addons/addon-appdaemon3.svg
[releases]: https://github.com/hassio-addons/addon-appdaemon3/releases
[repository]: https://github.com/hassio-addons/repository
[semver]: http://semver.org/spec/v2.0.0.htm
[buymeacoffee-shield]: https://www.buymeacoffee.com/assets/img/guidelines/download-assets-sm-2.svg
[buymeacoffee]: https://www.buymeacoffee.com/frenck
[gitlabci-shield]: https://gitlab.com/hassio-addons/addon-appdaemon3/badges/master/pipeline.svg
[gitlabci]: https://gitlab.com/hassio-addons/addon-appdaemon3/pipelines
