FROM debian:buster

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y nginx

RUN mkdir -p /etc/nginx/ssl

RUN apt-get install -y openssl

RUN openssl req -x509 -nodes \
    -out /etc/nginx/ssl/inception.crt \
    -keyout /etc/nginx/ssl/inception.key \
    -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=pbeheyt.42.fr/UID=pbeheyt"

RUN mkdir -p /var/run/nginx

COPY conf/nginx.conf /etc/nginx/conf.d

RUN chmod 755 /var/www/html

RUN chown -R www-data:www-data /var/www/html

CMD ["nginx", "-g", "daemon off;"]
