FROM debian:bullseye

RUN apt-get update

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

RUN mkdir -p /run/php/

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/

RUN mkdir -p /var/www/html

WORKDIR /var/www/html

RUN curl -O https://wordpress.org/wordpress-6.3.1.tar.gz

RUN tar -xzf wordpress-6.3.1.tar.gz

RUN rm wordpress-6.3.1.tar.gz

RUN mv wordpress/* .

RUN rm -rf wordpress

RUN mv wp-config-sample.php wp-config.php

COPY ./tools/config.sh /var/www/config.sh

RUN chmod +x /var/www/config.sh

# WP CLI

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar

RUN mv wp-cli.phar /usr/local/bin/wp

ENTRYPOINT [ "/var/www/config.sh" ]

CMD [ "php-fpm7.4",  "-F"]