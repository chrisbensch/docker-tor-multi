FROM alpine:latest

LABEL maintainer="Chris Bensch <chris.bensch@gmail.com>"

RUN apk --no-cache add --update --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing obfs4proxy tor geoip && \
    rm -rf /var/cache/apk/*

COPY torrc /etc/tor/torrc

COPY entrypoint.sh /entrypoint.sh

#Permission for tor-user
#RUN chown -R toruser /etc/tor/torrc
RUN chmod +x /entrypoint.sh
#RUN mkdir /tor
#RUN chown -R toruser /tor

# Tell docker that all future commands should run as the appuser user
#USER toruser
ENTRYPOINT [ "/bin/sh" , "entrypoint.sh" ]
