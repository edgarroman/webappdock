#!/bin/sh
# `/sbin/setuser webuser` runs the given command as the user `webuser`.
# If you omit that part, the command will be run as root.
exec /sbin/setuser webuser /usr/local/bin/uwsgi --http :9000 --wsgi-file /home/webuser/main.wsgi >>/var/log/uwsgi.log 2>&1
