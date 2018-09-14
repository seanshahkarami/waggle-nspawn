#!/bin/bash

set -u

systemd-nspawn -D $1 -b -x
