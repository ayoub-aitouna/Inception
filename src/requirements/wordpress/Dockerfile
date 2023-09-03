FROM debian:bookworm

RUN apt-get update
RUN apt-get install -y php7.3
RUN apt-get install -y php-fpm

RUN apt-get install -y mariadb-client
RUN apt-get install -y curl


# my zsh & nvim conf 

RUN apt-get install zsh  -y &&\
    apt-get install git -y &&\
    apt-get install neovim -y &&\
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# end of my zsh & nvim conf 

RUN mkdir -p /var/www
RUN curl -O  --output-dir /var/www https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz

RUN cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz
RUN cd /var/www && rm wordpress-6.0-fr_FR.tar.gz
RUN	chown -R root:root /var/www/wordpress

ENTRYPOINT [ "zsh" ]

# RUN mkdir -p /var/www
# RUN curl https://wordpress.org/latest.tar.gz | www-data tar zx -C /srv/www
