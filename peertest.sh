#!/bin/sh
echo "=== am I on the savantcoding mesh? my netmaker IP ==="
ip -4 addr show netmaker 2>/dev/null | grep inet || ip -4 addr 2>/dev/null | grep "10.77.20"
echo
echo "=== ping HA node 10.77.20.9 ==="
ping -c 2 -W 2 10.77.20.9 >/dev/null 2>&1 && echo "  10.77.20.9 REACHABLE (ping)" || echo "  10.77.20.9 no ping reply"
echo
echo "=== HA web UI over mesh: http://10.77.20.9:8123 ==="
curl -sS -o /dev/null -w "  HTTP %{http_code} (time %{time_total}s)\n" --max-time 10 http://10.77.20.9:8123/ 2>&1 || echo "  connection failed"
echo
echo "=== raw TCP check on 8123 ==="
(command -v nc >/dev/null && nc -z -w4 10.77.20.9 8123 && echo "  port 8123 OPEN" || echo "  port 8123 closed/filtered") 2>/dev/null
