# FNGarvin
# Licensed under TODO: INSERT LICENSE
# 2026

FROM ghcr.io/leejet/stable-diffusion.cpp:master-cuda

# Install SSH server
RUN apt-get update && apt-get install -y openssh-server \
    && mkdir /var/run/sshd \
    && sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY run.sh /run.sh
RUN chmod +x /run.sh

CMD ["/run.sh"]

# EOF Dockerfile
