#!/bin/sh
echo "=== uptime ==="
uptime
echo "=== netmaker addon state ==="
bash -lc 'ha addons info d5ed8618_netmaker' 2>/dev/null | grep -iE "^  state:|boot:|version:" 
echo "=== is HA core reachable locally? ==="
curl -sS -o /dev/null -w "HA core :8123 -> HTTP %{http_code}\n" --max-time 8 http://172.30.32.1:8123 2>&1 || echo "core not responding"
echo "=== default route intact? ==="
ip route 2>/dev/null | grep -E "^default" || echo "NO DEFAULT ROUTE"
echo "=== netmaker iface present on host? (sign it re-created) ==="
ip -brief addr 2>/dev/null | grep -i netmaker || echo "(no netmaker iface in this netns)"
