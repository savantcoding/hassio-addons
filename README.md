# Savant Home Assistant Add-ons

Home Assistant add-ons published by [@savantcoding](https://github.com/savantcoding).

## Installation

Add this repository to your Home Assistant instance:

1. Navigate to **Settings → Add-ons → Add-on Store**.
2. Click the **⋮** menu (top right) → **Repositories**.
3. Add the URL:

   ```txt
   https://github.com/savantcoding/hassio-addons
   ```

4. The add-ons below will appear in the store.

[![Add repository to my Home Assistant][repository-badge]][repository-url]

## Add-ons

### [Netmaker](./netmaker)

![Supports aarch64][aarch64] ![Supports amd64][amd64]

Join your Home Assistant instance to a [Netmaker][netmaker] WireGuard network
using the Netmaker client (`netclient`). Provide an enrollment token from your
Netmaker dashboard and the add-on registers your device and keeps the
connection running in the background.

See the [add-on documentation](./netmaker/DOCS.md) for setup details.

## License

MIT — see [LICENSE.md](LICENSE.md).

[aarch64]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64]: https://img.shields.io/badge/amd64-yes-green.svg
[netmaker]: https://www.netmaker.io/
[repository-badge]: https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg
[repository-url]: https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Fsavantcoding%2Fhassio-addons
