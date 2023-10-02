FROM debian:bookworm

EXPOSE 3000

RUN apt update

RUN apt install nginx -y &&\
    apt install openssl -y &&\
    apt install curl  -y 

# Generate a Self-Signed Certificate:
RUN openssl req -x509 -newkey rsa:4096 -keyout /etc/ssl/private/inception.key -out /etc/ssl/certs/inception.crt -days 365 -nodes \
    -subj "/C=US/ST=State/L=City/O=Organization/OU=Unit/CN=yourdomain.com/emailAddress=email@example.com"


COPY conf/nginx.conf /etc/nginx/nginx.conf

RUN chmod 755 /var/www/html

CMD ["nginx", "-g", "daemon off;"]
