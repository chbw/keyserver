#!/bin/bash
apt update
apt -y install snapd
apt -y install postgresql
snap install --edge hockeypuck
cp /snap/hockeypuck/current/etc/hockeypuck/hockeypuck.conf.postgres /var/snap/hockeypuck/common/config
snap restart hockeypuck

#apt -y dist-upgrade

