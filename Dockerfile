FROM emroman/pythondock:uwsgi2

RUN apt-get update
RUN apt-get install -y nginx

ADD . /webapp_build
RUN /webapp_build/setup.sh

CMD ["/sbin/my_init"]
EXPOSE 80 443
