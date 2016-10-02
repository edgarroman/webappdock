# webappdock
Docker image that is ready to host a wgsi application

Inspired from [https://github.com/phusion/passenger-docker](https://github.com/phusion/passenger-docker)

Some notable differences
* Uses NGINX and is turned on by default
* Uses uWSGI for the gateway to the application

## Usage Instructions

To use this Docker image create your own Docker image and make the following modifications:

* Setup your app
  * Put your code in /home/webuser
* Hook the uWSGI
  * Replace /home/webuser/main.wsgi with a symlink to your primary wsgi file
* Hook NGINX
  * To add directives to the core NGINX conf, add one or more .conf files to /etc/nginx/main.d
  * To add your site directives (within the NGINX conf http block), add a file to /etc/nginx/conf.d/

## Helpful references

* NGINX
  * https://www.linode.com/docs/websites/nginx/how-to-configure-nginx
