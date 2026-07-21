#!/bin/sh
CID=addon_d5ed8618_netmaker
echo "=== is socat available in the netmaker container? ==="
docker exec "$CID" sh -c "command -v socat || echo NO_SOCAT"
echo "=== nc available? ==="
docker exec "$CID" sh -c "command -v nc || echo NO_NC"
echo
echo "=== start a throwaway socat proxy: 10.77.20.9:8123 -> 127.0.0.1:80 (background, 120s) ==="
docker exec -d "$CID" sh -c "timeout 120 socat TCP-LISTEN:8123,bind=10.77.20.9,fork,reuseaddr TCP:127.0.0.1:80 2>/tmp/socat.log" 2>&1
sleep 2
echo "=== confirm it's listening ==="
docker exec "$CID" sh -c "ss -ltn 2>/dev/null | grep ':8123' || netstat -ltn 2>/dev/null | grep ':8123' || echo 'not listening (socat may be missing)'"
docker exec "$CID" sh -c "cat /tmp/socat.log 2>/dev/null" 2>/dev/null
