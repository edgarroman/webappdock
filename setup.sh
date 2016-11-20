#!/bin/bash
set -e
source /image_build/buildconfig

run pip3 install setproctitle

run /image_build/setup_user.sh
run /image_build/uwsgi/setup_uwsgi.sh
run /image_build/nginx/setup_nginx.sh

run /image_build/setup_finalize.sh
