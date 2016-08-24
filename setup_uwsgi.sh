#!/bin/bash
set -e
source /webapp_build/buildconfig

header "Setting up uWSGI"

# Alright, now setup default uwsgi webapp
run mkdir /etc/service/uwsgi
run cp -r /webapp_build/hello.wsgi /home/webuser/hello.wsgi
run cp -r /webapp_build/uwsgi.sh /etc/service/uwsgi/run
run chmod +x /etc/service/uwsgi/run;
