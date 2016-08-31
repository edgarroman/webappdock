#!/bin/bash
set -e
source /webapp_build/buildconfig

header "Setting up NGINX"

# Moved to DockerFile for temp quick build
#run apt-get update
#run apt-get install -y nginx

# This username should match what is in setup_user.sh
USER_NAME=webuser
# Now calculate the variables
USER_HOME=/home/$USER_NAME
NGINX_USER_CONF_DIR=$USER_HOME/etc/
NGINX_CORE_CONF_DIR=/etc/nginx/conf.d/

# Do the system setup. Essentially we are creating the core nginx.conf
# file as well as creating /etc/nginx/conf.d/ directory that can be used
# to add numerous separate and distinct .conf files
run mkdir -p $NGINX_CORE_CONF_DIR
run cp -r /webapp_build/nginx_core.conf /etc/nginx/nginx.conf

# Do the local user setup
# By symbolic linking of the user nginx.conf file to the nginx conf directory
# the user may push updates to nginx without needing root access
run mkdir -p $NGINX_USER_CONF_DIR
run cp -r /webapp_build/nginx_user.conf $NGINX_USER_CONF_DIR/nginx.conf
run ln -s $NGINX_USER_CONF_DIR/nginx.conf $NGINX_CORE_CONF_DIR/nginx.conf
