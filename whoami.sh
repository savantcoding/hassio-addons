#!/bin/sh
echo "=== hostname (core-ssh = basic, something else = advanced) ==="
hostname
echo "=== docker cli available? (advanced has it) ==="
which docker && docker ps --format '{{.Names}}' 2>/dev/null | grep -i netmaker
echo "=== host-level interfaces visible? look for netmaker + 10.77.20 ==="
ip -brief addr 2>/dev/null | grep -iE "netmaker|10\.77\.20" || echo "(no netmaker iface in this netns)"
