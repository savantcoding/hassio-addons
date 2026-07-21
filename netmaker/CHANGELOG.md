# Changelog

## 1.0.0

- Initial release.
- Joins your Home Assistant instance to a Netmaker network using `netclient`.
- Non-interactive join via an enrollment token.
- Persists the netclient host identity to the add-on's `/data` volume so the
  node survives restarts and updates.
- Supports `aarch64`, `amd64` and `armv7`.
- Bundles `netclient` v1.6.0.
