#!/bin/sh
CID=addon_d5ed8618_netmaker
echo "=== can the netmaker container reach HA on localhost (the tailscale trick)? ==="
for tgt in "127.0.0.1:8123" "127.0.0.1:80"; do
  code=$(docker exec "$CID" sh -c "curl -sS -o /dev/null -w '%{http_code}' --max-time 6 http://$tgt/ 2>/dev/null")
  echo "  http://$tgt -> ${code:-fail}"
done
echo
echo "=== is the container truly host-networked? (should see end0/10.1.10.60) ==="
docker exec "$CID" ip -4 addr 2>/dev/null | grep -E "inet (10.1.10|127.0.0.1|10.77.20)" | head
echo
echo "=== what HA core port is configured? ==="
docker exec "$CID" sh -c 'curl -sS -o /dev/null -w "8123=%{http_code} " --max-time 5 http://127.0.0.1:8123/; curl -sS -o /dev/null -w "80=%{http_code}\n" --max-time 5 http://127.0.0.1:80/' 2>/dev/null
