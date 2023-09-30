#!/bin/bash
sleep 10

sed -i "s/define( 'DB_NAME', 'database_name_here' );/define( 'DB_NAME', '$MYSQL_DATABASE' );/" /var/www/html/wp-config.php
sed -i "s/define( 'DB_USER', 'username_here' );/define( 'DB_USER', '$MYSQL_USER');/" /var/www/html/wp-config.php;
sed -i "s/define( 'DB_PASSWORD', 'password_here' );/define( 'DB_PASSWORD', '$MYSQL_PASSWORD');/" /var/www/html/wp-config.php;
sed -i "s/define( 'DB_HOST', 'localhost' );/define( 'DB_HOST', 'mariadb:3306');/" /var/www/html/wp-config.php;

echo "define('WP_CACHE', true);" >> /var/www/html/wp-config.php
echo "define('WP_REDIS_HOST', 'redis');" >> /var/www/html/wp-config.php
echo "define('WP_REDIS_PORT', '6379');" >> /var/www/html/wp-config.php

wp core install --allow-root \
    --url=localhost \
    --title="My New Site" \
    --admin_user=$WP_ADMIN \
    --admin_password=$WP_ADMIN_PASSOWRD \
    --admin_email="aaitouna@student.1337.ma"

wp user create --allow_root \
    $WP_USER \
    "aaitouna@student.1337.ma" \
    --user_pass=$WP_USER_PASSOWRD

exec $@