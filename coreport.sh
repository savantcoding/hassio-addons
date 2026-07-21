#!/bin/sh
CID=addon_d5ed8618_netmaker
echo "=== what does bashio think HA core port/ssl is (from inside the addon)? ==="
docker exec "$CID" bash -c 'source /usr/lib/bashio/bashio.sh 2>/dev/null; echo "core.port=$(bashio::core.port 2>/dev/null)"; echo "core.ssl=$(bashio::core.ssl 2>/dev/null)"' 2>&1 | grep -E "core\."
echo
echo "=== direct curl checks ==="
docker exec "$CID" sh -c 'for p in 80 8123 8443; do curl -sS -o /dev/null -w "  :$p -> %{http_code}\n" --max-time 4 http://127.0.0.1:$p/ 2>/dev/null; done'
