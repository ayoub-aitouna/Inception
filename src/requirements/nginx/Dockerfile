FROM debian:bookworm

EXPOSE 3000

RUN apt update

RUN apt install nginx -y &&\
    apt install openssl -y &&\
    apt install curl  -y &&\
    apt install zsh  -y &&\
    apt install git -y &&\
    apt install neovim -y &&\
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Generate a Self-Signed Certificate:
RUN openssl req -x509 -newkey rsa:4096 -keyout /etc/ssl/private/inception.key -out /etc/ssl/certs/inception.crt -days 365 -nodes \
    -subj "/C=US/ST=State/L=City/O=Organization/OU=Unit/CN=yourdomain.com/emailAddress=email@example.com"

RUN git clone https://github.com/jrayoub/nvim_config ~/.config/nvim

COPY conf/nginx.conf /etc/nginx/nginx.conf

RUN chmod 755 /var/www/html

RUN chown -R www-data:www-data /var/www/html

CMD ["nginx", "-g", "daemon off;"]
