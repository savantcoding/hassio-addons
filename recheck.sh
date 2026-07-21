#!/bin/sh
CID=addon_d5ed8618_netmaker
echo "=== netmaker interface IP (looking for 10.77.20.x) ==="
docker exec "$CID" ip addr show netmaker 2>&1 | grep -iE "inet |POINTOPOINT" 
echo
echo "=== wg peers/handshake ==="
docker exec "$CID" wg show 2>&1 | grep -iE "peer|handshake|endpoint|transfer|allowed" | head
echo
echo "=== nodes.json exists now? ==="
docker exec "$CID" sh -c "cat /etc/netclient/nodes.json 2>&1 | head -c 400"; echo
echo
echo "=== netclient list ==="
docker exec "$CID" /opt/netclient list 2>&1 | head
