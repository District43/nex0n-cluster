#!/bin/bash

MASTER_IP=$(grep MASTER_IP /root/nex0n/config/cluster.conf | cut -d '=' -f2)
TOKEN=$(curl -s http://$MASTER_IP:8080/token)

echo "[WORKER] Joining cluster at $MASTER_IP..."

curl -sfL https://get.k3s.io | \
  K3S_URL="https://$MASTER_IP:6443" \
  K3S_TOKEN="$TOKEN" \
  sh -
