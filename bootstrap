#!/bin/bash

set -u

basedir=$1

# bootstrap base debian system
debootstrap stable $basedir

# enable autologin for root
mkdir -p $basedir/etc/systemd/system/console-getty.service.d
cat << EOF > $basedir/etc/systemd/system/console-getty.service.d/override.conf
[Service]
ExecStart=
ExecStart=-/sbin/agetty --noclear --autologin root --keep-baud console 115200,38400,9600 $TERM
EOF

# ensure waggle image packages are installed
systemd-nspawn -D $basedir bash -s << EOF
apt-get update && apt-get install -y \
  git \
  python3 \
  python3-pip

pip3 install git+https://github.com/waggle-sensor/pywaggle
EOF

# add waggle-init override and make /wagglerw
