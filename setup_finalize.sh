#!/bin/bash
set -e
source /image_build/buildconfig

header "Finalizing..."

if [[ -e /usr/local/rvm ]]; then
    run /usr/local/rvm/bin/rvm cleanup all
fi

run apt-get remove -y autoconf automake
run apt-get autoremove
run apt-get clean
run rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
if [[ "$final" = 1 ]]; then
    run rm -rf /image_build
else
    run rm -rf /image_build/nginx
    run rm -rf /image_build/uwsgi
    run rm -f /image_build/{setup,setup_user,setup_finalize}.sh
    run rm -f /image_build/{Dockerfile,insecure_key*}
fi