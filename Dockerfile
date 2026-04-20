# FNGarvin
# Licensed under TODO: INSERT LICENSE
# 2026

FROM ghcr.io/leejet/stable-diffusion.cpp:master-cuda

# Install SSH server and utilities
RUN apt-get update && apt-get install -y \
    openssh-server \
    joe \
    wget \
    aria2 \
    && mkdir /var/run/sshd \
    && sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY run.sh /run.sh
RUN chmod +x /run.sh

ENTRYPOINT ["/run.sh"]

# EOF Dockerfile
