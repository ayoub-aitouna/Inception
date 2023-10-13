FROM debian:bullseye

RUN apt-get -y update && apt-get -y upgrade

RUN apt-get -y install git; \
    apt-get -y install python3

RUN git clone https://github.com/jrayoub/Clickvalue2.git /var/www/html

WORKDIR /var/www/html/

ENTRYPOINT [ "python3" , "-m", "http.server"]