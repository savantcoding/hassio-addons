# Savant Home Assistant Add-ons

[![Project Stage][project-stage-shield]][project-stage]
![Maintenance][maintenance-shield]
[![License][license-shield]](LICENSE.md)

Home Assistant add-ons maintained by [SavantCoder][savantcoder].

## About

This repository contains Home Assistant add-ons that extend your instance with
extra functionality. Add the repository to your Home Assistant instance to
install and receive updates for the add-ons listed below.

## Installation

1. Navigate to **Settings → Add-ons → Add-on Store** in your Home Assistant
   frontend.
2. Click the **⋮** menu in the top right and choose **Repositories**.
3. Paste the following URL and click **Add**:

   ```txt
   https://github.com/savantcoding/hassio-addons
   ```

Or click the button below to add it automatically:

[![Add repository to your Home Assistant instance.][repository-badge]][repository-url]

## Add-ons provided by this repository

### &#10003; [Netmaker][addon-netmaker]

![Latest Version][netmaker-version-shield]
![Supports aarch64 Architecture][aarch64-shield]
![Supports amd64 Architecture][amd64-shield]

Join your Home Assistant instance to a [Netmaker][netmaker] WireGuard network
using the Netmaker client (`netclient`). Provide an enrollment token from your
Netmaker dashboard and the add-on registers your device and keeps the mesh
connection running in the background.

[:books: Netmaker add-on documentation][addon-netmaker-docs]

## Support

Got questions or found a bug?

- Open an [issue on GitHub][issues].

This repository and its add-ons are community projects and are not affiliated
with Netmaker or the Home Assistant project.

## Contributing

This is an active open-source project. Contributions are welcome — feel free to
open an issue or a pull request.

## License

MIT License — see [LICENSE.md](LICENSE.md).

[addon-netmaker]: ./netmaker
[addon-netmaker-docs]: ./netmaker/DOCS.md
[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[issues]: https://github.com/savantcoding/hassio-addons/issues
[license-shield]: https://img.shields.io/github/license/savantcoding/hassio-addons.svg
[maintenance-shield]: https://img.shields.io/maintenance/yes/2026.svg
[netmaker]: https://www.netmaker.io/
[netmaker-version-shield]: https://img.shields.io/badge/dynamic/yaml?url=https%3A%2F%2Fraw.githubusercontent.com%2Fsavantcoding%2Fhassio-addons%2Fmain%2Fnetmaker%2Fconfig.yaml&query=%24.version&label=version&prefix=v&color=blue
[project-stage-shield]: https://img.shields.io/badge/project%20stage-experimental-yellow.svg
[project-stage]: https://github.com/savantcoding/hassio-addons
[repository-badge]: https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg
[repository-url]: https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Fsavantcoding%2Fhassio-addons
[savantcoder]: https://github.com/SavantCoder
