#!/bin/bash
set -e
source /image_build/buildconfig

header "Setting up webuser"

# Need to create new user
run addgroup --gid 9999 webuser
run adduser --uid 9999 --gid 9999 --disabled-login --gecos "WebUser" -shell /bin/bash --home /home/webuser webuser
run usermod -L webuser
run mkdir -p /home/webuser/.ssh
run chmod 700 /home/webuser/.ssh
run chown -R webuser:webuser /home/webuser/
