FROM debian:bookworm

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y nginx openssl

RUN mkdir -p /etc/nginx/ssl

RUN openssl req -x509 -days 365 -nodes -newkey rsa:4096 \
	-out /etc/nginx/ssl/inception.crt \
	-keyout /etc/nginx/ssl/inception.key \
	-subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=pbeheyt.42.fr/UID=pbeheyt"

RUN mkdir -p /var/run/nginx

COPY conf/nginx.conf /etc/nginx/conf.d

CMD ["nginx", "-g", "daemon off;"]
