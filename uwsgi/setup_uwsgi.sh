#!/bin/bash
set -e
source /webapp_build/buildconfig

header "Setting up uWSGI"

# Place a dummy wsgi application file in the user directory
run cp -r /webapp_build/uwsgi/hello.wsgi /home/webuser/hello.wsgi

# Alright, now setup default uwsgi webapp
run ln -s /home/webuser/hello.wsgi /home/webuser/main.wsgi

# Install the startup file to launch on boot
run mkdir /etc/service/uwsgi
run cp -r /webapp_build/uwsgi/runit/uwsgi.sh /etc/service/uwsgi/run
run chmod +x /etc/service/uwsgi/run;
