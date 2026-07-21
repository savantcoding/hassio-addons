#!/bin/sh
echo "=== current netmaker state ==="
bash -lc 'ha addons info d5ed8618_netmaker --raw-json' 2>/dev/null | tr ',' '\n' | grep -iE '"state"|"boot"|"version"'
echo
echo "=== DISABLE auto-boot so it stops taking the box down ==="
bash -lc 'ha addons options d5ed8618_netmaker --boot manual' 2>&1 | tail -2 || bash -lc 'ha addons stop d5ed8618_netmaker' 2>&1 | tail -2
echo
echo "=== stop it now ==="
bash -lc 'ha addons stop d5ed8618_netmaker' 2>&1 | tail -2
echo
echo "=== confirm stopped + boot mode ==="
bash -lc 'ha addons info d5ed8618_netmaker --raw-json' 2>/dev/null | tr ',' '\n' | grep -iE '"state"|"boot"'
