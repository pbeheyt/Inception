#!/bin/bash
sleep 10

cd /var/www/wordpress

if [ ! -e /var/www/wordpress/wp-config.php ]; then
wp config create --allow-root \
    --dbname=$MYSQL_DATABASE \
	--dbuser=$MYSQL_USER \
	--dbpass=$MYSQL_PASSWORD \
	--dbhost=$MYSQL_HOSTNAME:3306 \
    --path='/var/www/wordpress'

wp core install --allow-root \
    --url="$DOMAIN_NAME" \
    --title="$SITE_TITLE" \
    --admin_user="$ADMIN_USER" \
    --admin_password="$ADMIN_PASSWORD" \
    --admin_email="$ADMIN_EMAIL" \
    --path='/var/www/wordpress'

wp user create --allow-root \
    --role=author "$USER1_LOGIN" "$USER1_EMAIL" \
    --user_pass="$USER1_PASSWORD" \
    --path='/var/www/wordpress' >> log.txt
fi

if [ ! -d /run/php ]; then
    mkdir -p /run/php
fi

/usr/sbin/php-fpm8.2 -F
