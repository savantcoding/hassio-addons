#!/bin/sh
CID=addon_d5ed8618_netmaker
echo "=== 1. from netmaker container, can it reach HA Core? try common addresses ==="
for tgt in "homeassistant:8123" "172.30.32.1:8123" "10.77.20.9:8123" "localhost:8123"; do
  code=$(docker exec "$CID" sh -c "curl -sS -o /dev/null -w '%{http_code}' --max-time 6 http://$tgt/ 2>/dev/null" 2>/dev/null)
  echo "  http://$tgt -> ${code:-fail}"
done
echo
echo "=== 2. what is HA Core's actual IP/container? ==="
docker ps --format '{{.Names}}' | grep -iE "homeassistant|^homeassistant$" | head
docker inspect homeassistant --format '{{range .NetworkSettings.Networks}}{{.IPAddress}} {{end}}' 2>/dev/null
echo
echo "=== 3. is anything bound to 10.77.20.9:8123 (from host netns via container)? ==="
docker exec "$CID" sh -c "netstat -ltn 2>/dev/null | grep -E ':8123' || ss -ltn 2>/dev/null | grep ':8123' || echo '(nothing listening on 8123 in this netns)'"
echo
echo "=== 4. HA Core listen config: does it bind all interfaces? ==="
docker exec "$CID" sh -c "curl -sS -o /dev/null -w 'core via hostname homeassistant:8123 = %{http_code}\n' --max-time 6 http://homeassistant:8123/ 2>/dev/null"
