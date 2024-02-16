#!/bin/sh

# Generate fresh RSA key if not exists
if [ ! -f "/etc/ssh/ssh_host_rsa_key" ]; then
    ssh-keygen -f /etc/ssh/ssh_host_rsa_key -N '' -t rsa
    chmod 600 /etc/ssh/ssh_host_rsa_key
fi

# Generate fresh DSA key if not exists
if [ ! -f "/etc/ssh/ssh_host_dsa_key" ]; then
    ssh-keygen -f /etc/ssh/ssh_host_dsa_key -N '' -t dsa
    chmod 600 /etc/ssh/ssh_host_dsa_key
fi

# Generate fresh ECDSA key if not exists
if [ ! -f "/etc/ssh/ssh_host_ecdsa_key" ]; then
    ssh-keygen -f /etc/ssh/ssh_host_ecdsa_key -N '' -t ecdsa
    chmod 600 /etc/ssh/ssh_host_ecdsa_key
fi

# Generate fresh Ed25519 key if not exists
if [ ! -f "/etc/ssh/ssh_host_ed25519_key" ]; then
    ssh-keygen -f /etc/ssh/ssh_host_ed25519_key -N '' -t ed25519
    chmod 600 /etc/ssh/ssh_host_ed25519_key
fi

# Prepare run directory
if [ ! -d "/var/run/sshd" ]; then
    mkdir -p /var/run/sshd
fi

# Start SSH daemon
/usr/sbin/sshd

# Execute the passed command or shell
exec "$@"