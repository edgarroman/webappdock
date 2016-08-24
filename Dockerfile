FROM emroman/pythondock:uwsgi2

ADD . /webapp_build
RUN /webapp_build/setup.sh

CMD ["/sbin/my_init"]
EXPOSE 80 443

