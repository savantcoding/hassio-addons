#!/bin/sh
echo "=== all running containers ==="
docker ps --format '{{.Names}}\t{{.Image}}' 2>&1 | head -40
