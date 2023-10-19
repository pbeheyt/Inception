FROM debian:bookworm

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y \
php8.2 \
php-fpm \
php-mysqli \
wget

RUN mkdir -p /var/www/html

RUN mkdir -p /run/php/ && chown www-data:www-data /run/php/

RUN wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php -O /var/www/html/adminer.php

RUN chown www-data:www-data /var/www/html/adminer.php

COPY conf/www.conf /etc/php/8.2/fpm/pool.d

CMD ["php-fpm8.2", "-F"]