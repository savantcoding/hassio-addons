#!/bin/sh
echo "=== am I in a docker-capable session? ==="
hostname; which docker || { echo "NO DOCKER HERE"; exit 1; }
echo
CID=$(docker ps --format '{{.Names}}' | grep -i netmaker | head -1)
echo "netmaker container: ${CID:-NONE}"
[ -z "$CID" ] && { echo "not running. containers:"; docker ps --format '{{.Names}}'; exit 1; }
echo
echo "=== netmaker iface + IP (want 10.77.20.x) ==="
docker exec "$CID" ip addr show netmaker 2>&1 | grep -iE "inet |POINTOPOINT"
echo
echo "=== wg peers/handshakes ==="
docker exec "$CID" wg show 2>&1 | head -30
echo
echo "=== nodes.json (network membership) ==="
docker exec "$CID" sh -c 'cat /etc/netclient/nodes.json 2>&1 | head -c 500'; echo
echo
echo "=== netclient list ==="
docker exec "$CID" /opt/netclient list 2>&1 | head
echo
echo "=== ping peers 10.77.20.1-5 from inside tunnel ==="
for i in 1 2 3 4 5; do docker exec "$CID" ping -c1 -W2 "10.77.20.$i" >/dev/null 2>&1 && echo "  10.77.20.$i REACHABLE" || echo "  10.77.20.$i no reply"; done
