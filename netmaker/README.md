# Home Assistant Add-on: Netmaker

![Latest Version][version-shield]
![Supports aarch64 Architecture][aarch64-shield]
![Supports amd64 Architecture][amd64-shield]
![Project Stage][stage-shield]

Join your Home Assistant instance to a Netmaker WireGuard network.

![Netmaker logo][logo]

## About

[Netmaker][netmaker] is a platform for creating and managing fast, secure
WireGuard mesh networks. This add-on joins your Home Assistant instance to a
Netmaker network using the Netmaker client, `netclient`.

You provide an enrollment token generated in your Netmaker dashboard, and the
add-on registers your device and keeps the connection running in the
background. The host's WireGuard identity is persisted to the add-on's `/data`
volume, so your device remains the same node across restarts and updates.

A read-only **status panel** is available from the Home Assistant sidebar
once the add-on is running: it shows the node's network membership, mesh IP,
host identity, and live WireGuard peers.

See the [documentation][docs] for full installation and configuration details.

[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[docs]: DOCS.md
[logo]: logo.png
[netmaker]: https://www.netmaker.io/
[stage-shield]: https://img.shields.io/badge/project%20stage-experimental-yellow.svg
[version-shield]: https://img.shields.io/badge/version-1.2.0-blue.svg
