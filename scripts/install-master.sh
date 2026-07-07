#!/bin/bash

echo "[MASTER] Installing k3s..."
curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="--disable traefik" sh -

TOKEN=$(cat /var/lib/rancher/k3s/server/node-token)
echo "$TOKEN" > /root/nex0n/token.txt

echo "[MASTER] Starting token webserver..."
nohup busybox httpd -f -p 8080 -h /root/nex0n > /dev/null 2>&1 &

echo "[MASTER] Token available at http://82.165.188.200:8080/token"
