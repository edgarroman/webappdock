#!/bin/bash
set -e
source /webapp_build/buildconfig

header "Finalizing..."

if [[ -e /usr/local/rvm ]]; then
    run /usr/local/rvm/bin/rvm cleanup all
fi

run apt-get remove -y autoconf automake
run apt-get autoremove
run apt-get clean
run rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
if [[ "$final" = 1 ]]; then
    run rm -rf /webapp_build
else
    run rm -rf /webapp_build/nginx
    run rm -rf /webapp_build/uwsgi
    run rm -f /webapp_build/{setup,setup_user,setup_finalize}.sh
    run rm -f /webapp_build/{Dockerfile,insecure_key*}
fi