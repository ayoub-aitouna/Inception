FROM debian:bookworm

EXPOSE 443

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

COPY load.sh load.sh

COPY config/nginx.conf /etc/nginx/nginx.conf

RUN chmod +x load.sh


CMD ["nginx", "-g", "daemon off;"]
