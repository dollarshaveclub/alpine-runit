FROM alpine:edge

ADD start_runit /sbin/
RUN mkdir /etc/container_environment &&\
    chmod a+x /sbin/start_runit && mkdir /etc/service && mkdir /etc/runit_init.d && \
    echo "http://dl-4.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    apk --update upgrade && apk add runit && rm -rf /var/cache/apk/*

CMD ["/sbin/start_runit"]
