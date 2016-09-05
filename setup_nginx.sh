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

# Main.d is used to add entries at the root level of nginx.conf
NGINX_CORE_MAIN_CONF_DIR=/etc/nginx/main.d/
# conf.d is used to add entries at the http level of nginx.conf
NGINX_CORE_CONF_DIR=/etc/nginx/conf.d/

# Do the system setup. Essentially we are creating the core nginx.conf
# file as well as creating /etc/nginx/conf.d/ directory that can be used
# to add numerous separate and distinct .conf files
run mkdir -p $NGINX_CORE_MAIN_CONF_DIR
run mkdir -p $NGINX_CORE_CONF_DIR
run cp -r /webapp_build/nginx_core.conf /etc/nginx/nginx.conf

# Do the local user setup
# By symbolic linking of the user nginx.conf file to the nginx conf directory
# the user may push updates to nginx without needing root access
run mkdir -p $NGINX_USER_CONF_DIR
run cp -r /webapp_build/nginx_user.conf $NGINX_USER_CONF_DIR/nginx.conf
run ln -s $NGINX_USER_CONF_DIR/nginx.conf $NGINX_CORE_CONF_DIR/nginx.conf

# Setup launch at startup
run mkdir /etc/service/nginx
run cp -r /webapp_build/runit/nginx.sh /etc/service/nginx/run
run chmod +x /etc/service/nginx/run;

# Uncomment this to halt auto-start of nginx
# run touch /etc/service/nginx/down

run mkdir /etc/service/nginx-log-forwarder
run cp -r /webapp_build/runit/nginx-log-forwarder.sh /etc/service/nginx-log-forwarder/run
run chmod +x /etc/service/nginx-log-forwarder/run;

# Log rotation
# In the file /etc/logrotate.d/nginx
#  Change the line from
#     invoke-rc.d nginx rotate
#  to
#    sv 1 nginx
#  What this does it allow runit to signal nginx with USR1 which tells nginx
#  to re-open the logfiles
#
run sed -i 's|invoke-rc.d nginx rotate|sv 1 nginx|' /etc/logrotate.d/nginx
