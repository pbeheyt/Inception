sleep 10

sed -i "s/username_here/$MYSQL_USER/g" wp-config-sample.php
sed -i "s/password_here/$MYSQL_PASSWORD/g" wp-config-sample.php
sed -i "s/localhost/$MYSQL_HOSTNAME/g" wp-config-sample.php
sed -i "s/database_name_here/$MYSQL_DATABASE/g" wp-config-sample.php

cp wp-config-sample.php wp-config.php

wp core install --allow-root\
       --url=$DOMAIN_NAME\
       --title=$SITE_TITLE\
       --admin_user=$ADMIN_USER\
       --admin_password=$ADMIN_PASSWORD\
       --admin_email=$ADMIN_EMAIL\
       --path='/var/www/html'

wp user create --allow-root
       --role=author $USER1_LOGIN $USER1_MAIL\
       --user_pass=$USER1_PASS\
       --path='/var/www/html' >> log.txt