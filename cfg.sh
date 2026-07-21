#!/bin/sh
CID=addon_d5ed8618_netmaker
echo "=== nodes.json (network memberships) ==="
docker exec "$CID" cat /etc/netclient/nodes.json 2>&1 | head -c 800; echo
echo
echo "=== servers.json (registered server) ==="
docker exec "$CID" cat /etc/netclient/servers.json 2>&1 | head -c 500; echo
echo
echo "=== netclient.json host info (trimmed) ==="
docker exec "$CID" sh -c "cat /etc/netclient/netclient.json 2>/dev/null | head -c 400"; echo
echo
echo "=== recent daemon log for network/peer errors ==="
docker logs "$CID" 2>&1 | grep -iE "network|peer|acl|denied|pending|not allowed|failed|mismatch" | tail -15
