#!/bin/sh
echo "=== can SSH addon see host docker? ==="
which docker 2>/dev/null || echo "no docker cli"
echo
echo "=== SSH addon's own interfaces (is it host-networked?) ==="
ip -brief addr 2>/dev/null || ifconfig -a 2>/dev/null | grep -iE "flags|inet "
echo
echo "=== try nsenter into host netns (if privileged) ==="
ls -la /proc/1/ns/net 2>/dev/null
echo
echo "=== is there a netmaker iface anywhere reachable? ==="
for ns in /var/run/netns/* ; do echo "netns: $ns"; done 2>/dev/null
cat /proc/net/dev 2>/dev/null | grep -iE "netmaker|nm-" 
