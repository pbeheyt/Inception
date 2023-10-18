FROM debian:bookworm

RUN apt-get update && apt-get upgrade -y

RUN apt-get -y install wget

#install wordpress
RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www \
&& cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz \ 
&& rm wordpress-6.0-fr_FR.tar.gz

RUN	chown -R root:root /var/www/wordpress

#install php + mariadb
RUN apt-get install -y \
php8.2 \
php-fpm \
php-mysql \
mariadb-client

#install redis bonus
RUN apt-get install -y \
redis \
php-redis \
php-cli

COPY ./conf/php.conf /etc/php/8.2/fpm/pool.d/www.conf

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
&& chmod +x wp-cli.phar \
&& mv wp-cli.phar /usr/local/bin/wp

COPY conf/homepage.html /var/www/wordpress

COPY tools/auto_config.sh .

CMD ["bash", "auto_config.sh"]
