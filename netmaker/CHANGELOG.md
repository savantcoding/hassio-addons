# Changelog

## 1.3.0

- Fix the status panel showing empty values. The writer now sources the
  presentable networking values from the live interface (`wg show` for the
  host public key, listen port, and peers; `ip` for the mesh IP and MTU),
  since `netclient.json` stores those in raw/encoded form. Node address is
  read from the `nodes.json` address object, and persistent keepalive is
  converted from nanoseconds to seconds.
- Drop the Endpoint and MAC rows from the panel: a WireGuard interface has no
  MAC, and the host's public endpoint is only known to the Netmaker server,
  not locally.
- Use the Supervisor-assigned ingress port (avoids the hardcoded-port lint
  error) and silence the `bashio::addon.ingress_port` deprecation warning.

## 1.2.0

- Add a read-only status panel, accessible from the Home Assistant sidebar
  (Netmaker) via ingress. It shows this node's network membership, mesh IP,
  host identity (endpoint, keys, MTU, etc.), and a live table of WireGuard
  peers with handshake age and transfer counters. Styled after the Netmaker
  dashboard's node detail view.
- The panel reads local netclient state and `wg show`; no Netmaker server API
  access or credentials are involved. It is reachable only through Home
  Assistant ingress (restricted to the Supervisor).

## 1.1.0

- Add `expose_homeassistant` option: run a built-in nginx reverse proxy that
  serves the Home Assistant frontend on the netmaker (mesh) interface, so other
  nodes on your network can reach Home Assistant. Conceptually the same approach
  the Tailscale add-on uses with "tailscale serve".
- Add `expose_port` option (default `8123`) to choose the mesh-side port.
- When enabled, requires `use_x_forwarded_for` + `trusted_proxies` in your Home
  Assistant configuration (see documentation).

## 1.0.0

- Initial release.
- Joins your Home Assistant instance to a Netmaker network using `netclient`.
- Non-interactive join via an enrollment token.
- Persists the netclient host identity to the add-on's `/data` volume so the
  node survives restarts and updates.
- Supports `aarch64` and `amd64`.
- Bundles `netclient` v1.6.0.
