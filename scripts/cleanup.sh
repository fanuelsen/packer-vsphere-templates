#!/bin/bash -eu

SSH_USER=${SSH_USERNAME:-vagrant}

echo "==> Cleaning up tmp"
rm -rf /tmp/*

# Cleanup apt cache
apt-get -y autoremove --purge
apt-get -y clean

echo "==> Installed packages"
dpkg --get-selections | grep -v deinstall

# Remove Bash history
unset HISTFILE
rm -f /root/.bash_history
rm -f /home/${SSH_USER}/.bash_history

echo "==> Clearing machine-id"
truncate --size=0 /etc/machine-id

echo "==> Clearing log files"
find /var/log -type f -exec truncate --size=0 {} \;