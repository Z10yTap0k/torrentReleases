FROM alpine:latest
 
RUN apk update && apk add dcron curl wget rsync ca-certificates python3 py-pip lighttpd supervisor && rm -rf /var/cache/apk/*

RUN mkdir -m 0644 -p /crontabs
COPY films /crontabs/films
COPY cron.sh /cron.sh

RUN wget -q --no-check-certificate https://raw.githubusercontent.com/Kyrie1965/torrentReleases/master/digitalreleases.py
RUN sed -i 's|opt/share/www/releases|out/index|g' digitalreleases.py
RUN mkdir -m 0644 -p /out
RUN chmod +x /cron.sh

ADD lighttpd.conf lighttpd.conf

ADD supervisord.conf supervisord.conf 

EXPOSE 80

ENTRYPOINT ["/usr/bin/supervisord"]