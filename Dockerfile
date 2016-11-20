FROM edgar8000/pythondock:1.0

ADD . /image_build
RUN /image_build/setup.sh

CMD ["/sbin/my_init"]
EXPOSE 80 443
