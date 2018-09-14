#!/bin/bash

set -u
set -e

basedir=$1
shift

if [ -z $basedir ]; then
  echo "usage: $0 basedir"
  exit 1
fi

debootstrap stable $base

mkdir -p $basedir/etc/systemd/system/console-getty.service.d
cat << EOF > $basedir/etc/systemd/system/console-getty.service.d/override.conf
[Service]
ExecStart=
ExecStart=-/sbin/agetty --noclear --autologin root --keep-baud console 115200,38400,9600 $TERM
EOF

# add waggle-init override and make /wagglerw
