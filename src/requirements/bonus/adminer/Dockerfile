FROM debian:bookworm


RUN apt-get update -y && apt-get -y install curl php php-fpm php-mysql php-cli nginx

RUN curl -L https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php -o /var/www/html/index.php

RUN curl -L https://raw.githubusercontent.com/vrana/adminer/master/designs/galkaev/adminer.css -o /var/www/html/adminer.css

ENTRYPOINT [ "php" , "-S", "0.0.0.0:80", "-t", "/var/www/html/"]
