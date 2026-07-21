#!/bin/sh
echo "=== this addon's netns interfaces (host-level?) ==="
ip -brief addr 2>/dev/null | grep -vE "^lo" | head
echo
echo "=== routes to 10.77.20.0/24 (mesh subnet)? ==="
ip route 2>/dev/null | grep -iE "10.77.20|netmaker" || echo "(no route to mesh subnet from here)"
echo
echo "=== try pinging netmaker peers 10.77.20.1 .. .9 (2 pkts, 2s timeout) ==="
for ip in 1 2 3 4 5 6 7 8 9; do
  target="10.77.20.$ip"
  if ping -c 2 -W 2 "$target" >/dev/null 2>&1; then
    echo "  $target -> REACHABLE"
  else
    echo "  $target -> no reply"
  fi
done
