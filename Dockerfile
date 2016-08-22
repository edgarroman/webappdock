FROM emroman/pythondock:uwsgi2

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

# Ok, this is a web app image so we need to add nginx
#RUN apt-get install -y nginx

# Need to create new user
RUN groupadd --system webapps; \ 
    useradd --system --gid webapps --shell /bin/bash --home /home/webuser webuser; \
    mkdir -p /home/webuser/ ; \
    chown -R webuser:webapps /home/webuser/; 

# Alright, now setup default uwsgi webapp
RUN mkdir /etc/service/uwsgi
ADD hello.wsgi /home/webuser/hello.wsgi
ADD uwsgi.sh /etc/service/uwsgi/run

RUN chown -R webuser:webapps /home/webuser/;  \
    chmod +x /etc/service/uwsgi/run;

