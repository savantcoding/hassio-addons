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

### Option: `expose_homeassistant`

By default, joining the mesh lets Home Assistant **reach** other nodes, but it
does not make the Home Assistant frontend reachable **from** other nodes. When
you enable this option, the add-on runs a built-in reverse proxy that serves
Home Assistant on this node's mesh IP address, so any other device on your
Netmaker network can open the Home Assistant UI.

This is the same idea as the Tailscale add-on's "Tailscale Serve" feature.

Disabled by default.

### Option: `expose_port`

The port on the mesh IP address that the Home Assistant frontend is served on
when `expose_homeassistant` is enabled. Defaults to `8123`. For example, with
the default, other nodes reach Home Assistant at `http://<mesh-ip>:8123`, where
`<mesh-ip>` is this node's address in your network (shown in your Netmaker
dashboard).

### Exposing Home Assistant: required Home Assistant configuration

Home Assistant, by default, blocks requests coming through a reverse proxy. To
allow the `expose_homeassistant` proxy, add the following to your
`configuration.yaml` and restart Home Assistant:

```yaml
http:
  use_x_forwarded_for: true
  trusted_proxies:
    - 127.0.0.1
```

The proxy runs on the same host as Home Assistant and forwards from
`127.0.0.1`, which is why `127.0.0.1` is the trusted proxy.

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
