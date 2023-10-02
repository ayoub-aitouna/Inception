FROM debian:bookworm

RUN apt-get update

RUN apt-get install -y php7.3

RUN apt-get install -y php \
	php-cgi \
	php-mysql \
	php-fpm \
	php-pdo \
	php-gd php-cli \
	php-mbstring \
	redis \
	php-redis 

RUN apt-get install -y mariadb-client

RUN apt-get install -y curl

COPY ./conf/www.conf /etc/php/8.2/fpm/pool.d/

RUN mkdir -p /var/www/

WORKDIR /var/www/

RUN curl -O https://wordpress.org/wordpress-6.3.1.tar.gz

RUN tar -xzf wordpress-6.3.1.tar.gz

RUN rm wordpress-6.3.1.tar.gz

RUN mv wordpress/* html/

RUN rm -rf wordpress

RUN mv html/wp-config-sample.php html/wp-config.php

COPY ./tools/config.sh ./config.sh

RUN chmod +x config.sh

# WP CLI
WORKDIR /var/www/html
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

ENTRYPOINT [ "/var/www/config.sh" ]

CMD [ "php-fpm8.2",  "-F"]