FROM debian:bullseye

EXPOSE 3000

RUN apt-get -y update

RUN apt-get install nginx -y &&\
    apt-get install openssl -y &&\
    apt-get install curl  -y 

# Generate a Self-Signed Certificate:
RUN openssl req -x509 -newkey rsa:4096 -keyout /etc/ssl/private/inception.key -out /etc/ssl/certs/inception.crt -days 365 -nodes \
    -subj "/C=US/ST=State/L=City/O=Organization/OU=Unit/CN=yourdomain.com/emailAddress=email@example.com"


COPY conf/nginx.conf /etc/nginx/nginx.conf

RUN chmod 755 /var/www/html

CMD ["nginx", "-g", "daemon off;"]
