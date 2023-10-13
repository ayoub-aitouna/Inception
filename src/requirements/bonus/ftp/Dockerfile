FROM debian:bullseye

RUN     apt-get -y update; \
        apt-get -y upgrade; \
        apt-get install vsftpd -y;

COPY conf/vsftpd.conf /etc/vsftpd.conf

RUN mkdir -p /var/run/vsftpd/empty

COPY ./tools/conf.sh  /bin/conf.sh

ENTRYPOINT [ "sh", "/bin/conf.sh" ]

CMD [ "vsftpd", "/etc/vsftpd.conf" ]