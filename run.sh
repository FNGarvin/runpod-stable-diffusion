#!/bin/bash
# FNGarvin
# Licensed under TODO: INSERT LICENSE
# 2026

# Set up SSH authorized keys if PUBLIC_KEY is provided (RunPod standard)
if [ -n "$PUBLIC_KEY" ]; then
    mkdir -p /root/.ssh
    echo "$PUBLIC_KEY" >> /root/.ssh/authorized_keys
    chmod 700 /root/.ssh
    chmod 600 /root/.ssh/authorized_keys
fi

# Start SSH server
service ssh start

# Keep container alive
exec sleep infinity

# EOF run.sh
