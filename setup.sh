#!/bin/bash
set -e
source /webapp_build/buildconfig

run /webapp_build/setup_user.sh
run /webapp_build/uwsgi/setup_uwsgi.sh
run /webapp_build/nginx/setup_nginx.sh

