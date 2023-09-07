#!/bin/bash

sed -i "s/define( 'DB_NAME', 'database_name_here' );/define( 'DB_NAME', '$MYSQL_DATABASE' );/" /var/www/html/wp-config.php
sed -i "s/define( 'DB_USER', 'username_here' );/define( 'DB_USER', '$MYSQL_USER');/" /var/www/html/wp-config.php;
sed -i "s/define( 'DB_PASSWORD', 'password_here' );/define( 'DB_PASSWORD', '$MYSQL_PASSWORD');/" /var/www/html/wp-config.php;
sed -i "s/define( 'DB_HOST', 'localhost' );/define( 'DB_HOST', 'mariadb:3306');/" /var/www/html/wp-config.php;

# tail -f /dev/null
exec "$@"