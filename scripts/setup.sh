#!/bin/bash

echo "Setting up nex0n cluster..."

git clone https://github.com/District43/nex0n-cluster.git /root/nex0n
cd /root/nex0n

if hostname | grep -q "master"; then
    bash scripts/install-master.sh
else
    bash scripts/install-worker.sh
fi
