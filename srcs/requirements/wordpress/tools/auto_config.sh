#!/bin/bash
sleep 10

# sed -i "s/username_here/$MYSQL_USER/g" wp-config-sample.php
# sed -i "s/password_here/$MYSQL_PASSWORD/g" wp-config-sample.php
# sed -i "s/localhost/$MYSQL_HOSTNAME/g" wp-config-sample.php
# sed -i "s/database_name_here/$MYSQL_DATABASE/g" wp-config-sample.php

# cp wp-config-sample.php wp-config.php

wp config create --allow-root \
       --dbname=$MYSQL_DATABASE \
	--dbuser=$MYSQL_USER \
	--dbpass=$MYSQL_PASSWORD \
	--dbhost=MYSQL_HOSTNAME:3306 \
       --path='/var/www/html'

wp core install --allow-root \
    --url="$DOMAIN_NAME" \
    --title="$SITE_TITLE" \
    --admin_user="$ADMIN_USER" \
    --admin_password="$ADMIN_PASSWORD" \
    --admin_email="$ADMIN_EMAIL" \
    --path='/var/www/html'

wp user create --allow-root \
    --role=author "$USER1_LOGIN" "$USER1_EMAIL" \
    --user_pass="$USER1_PASSWORD" \
    --path='/var/www/html' >> log.txt

if [ ! -d /run/php ]; then
    mkdir -p /run/php
fi

/usr/sbin/php-fpm7.3 -F
