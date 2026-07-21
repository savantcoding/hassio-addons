#!/bin/sh
echo "=== advanced ssh addon network/ports + state ==="
bash -lc 'ha addons info a0d7b954_ssh --raw-json' 2>/dev/null | tr ',' '\n' | grep -iE '"state"|"ingress"|ssh|22|port|network' | head -20
