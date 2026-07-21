#!/bin/sh
echo "=== hostname (which ssh addon am I in) ==="
hostname
echo "=== docker here? ==="
which docker || echo "no docker"
echo "=== ha cli available (login shell)? ==="
bash -lc 'ha addons info a0d7b954_ssh 2>/dev/null | grep -iE "^  state:|ingress_port|network"' 2>/dev/null | head
echo "=== advanced ssh addon state ==="
bash -lc 'ha addons list 2>/dev/null | grep -iE "ssh|terminal"' 2>/dev/null
