# Home Assistant Community App: Netmaker

Netmaker is a platform for creating and managing fast, secure WireGuard
networks. This app joins your Home Assistant instance to a Netmaker network
using the Netmaker client, `netclient`.

## Prerequisites

In order to use this app, you'll need access to a Netmaker server and an
**enrollment token** (also called an enrollment key) for the network you want
to join.

You can run your own Netmaker server or use a hosted one. See the Netmaker
documentation for details:

<https://docs.netmaker.io/>

## Installation

1. Install this app.
1. Generate an enrollment token in your Netmaker dashboard, under
   **Enrollment Keys**.
1. Open the app's **Configuration** tab and paste the token into the
   `enrollment_token` option.
1. Start the "Netmaker" app.
1. Check the logs of the "Netmaker" app to confirm it joined the network.
1. Done!

The host's WireGuard identity and keys are stored on the app's persistent
`/data` volume, so your device stays the same node across restarts and updates.

## Configuration

Example configuration:

```yaml
enrollment_token: "eyJ...your-token..."
log_level: info
host_name: ""
port: 0
interface: ""
endpoint: ""
endpoint6: ""
firewall: ""
```

### Option: `enrollment_token` (required)

The enrollment token used to join your Netmaker network. Generate one in your
Netmaker dashboard under **Enrollment Keys**. The token already contains the
address of your Netmaker server, so no separate server URL is needed.

### Option: `log_level`

Controls the verbosity of the netclient logs. One of `trace`, `debug`, `info`,
`notice`, `warning`, `error`, `fatal`. Use `debug` or `trace` when
troubleshooting connection problems.

### Option: `host_name`

Optional name to register this device as within your Netmaker network. Leave
empty to use the default host name.

### Option: `port`

Optional UDP port for WireGuard to listen on. Leave at `0` to let netclient
choose a port. If you set a specific port, expose the same port in the
**Network** section of the app.

### Option: `interface`

Optional name for the WireGuard network interface created on the host. On Linux
the name must start with `netmaker`. Leave empty for the default.

### Option: `endpoint` / `endpoint6`

Optional static public IPv4/IPv6 endpoint for this host. Leave empty to let
Netmaker detect the endpoint automatically.

### Option: `firewall`

Optional firewall backend to use for ACL enforcement: `iptables` or `nftables`.
Leave empty to let netclient auto-detect. If neither tool is available,
netclient runs without firewall/ACL enforcement (the connection still works).

## Network

This app runs on the host network. netclient uses WireGuard over UDP; by
default port `51821/udp` is used. If you configure a specific `port`, expose it
in the **Network** section.

## Leaving a network

To leave the Netmaker network, uninstall the app. To rotate the node's
identity, clear the app's data (uninstall and reinstall) before joining again.

## Support

Got questions or found a bug? Open an issue on GitHub:

<https://github.com/savantcoding/hassio-addons/issues>

This add-on is a community project and is not affiliated with Netmaker.

## Compatibility

This add-on bundles `netclient` v1.6.0. For best results, run a Netmaker
server on a compatible version. A large version gap between the server and
client may cause connection issues (visible as `server/client version
mismatch` warnings in the log).
