#!/bin/bash
sleep 10

sed -i "s/define( 'DB_NAME', 'database_name_here' );/define( 'DB_NAME', '$MYSQL_DATABASE' );/" /var/www/html/wp-config.php
sed -i "s/define( 'DB_USER', 'username_here' );/define( 'DB_USER', '$MYSQL_USER');/" /var/www/html/wp-config.php;
sed -i "s/define( 'DB_PASSWORD', 'password_here' );/define( 'DB_PASSWORD', '$MYSQL_PASSWORD');/" /var/www/html/wp-config.php;
sed -i "s/define( 'DB_HOST', 'localhost' );/define( 'DB_HOST', 'mariadb:3306');/" /var/www/html/wp-config.php;

wp core install --allow-root \
    --url=localhost \
    --title="My New Site" \
    --admin_user=$WP_ADMIN \
    --admin_password=$WP_ADMIN_PASSOWRD \
    --admin_email="aaitouna@student.1337.ma";

wp user create --allow-root $WP_USER "aaitouna@student.com" --user_pass=$WP_USER_PASSOWRD ;

wp plugin install redis-cache --activate --allow-root ;

wp config set --allow-root WP_REDIS_CLIENT "phpredis" ;
wp config set --allow-root WP_REDIS_HOST "redis" ;
wp config set --allow-root WP_REDIS_PORT "6379" ;
wp config set --allow-root WP_REDIS_PREFIX "wp_" ;

wp plugin update --all --allow-root ;
wp redis enable --allow-root ;

exec $@