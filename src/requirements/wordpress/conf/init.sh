sed -i "s/define( 'DB_NAME', 'database_name_here' );/define( 'DB_NAME', '$MYSQL_DATABASE' );/" wordpress/wp-config.php
sed -i "s/define( 'DB_USER', 'username_here' );/define( 'DB_USER', '$MYSQL_USER');/" wordpress/wp-config.php;
sed -i "s/define( 'DB_PASSWORD', 'password_here' );/define( 'DB_PASSWORD', '$MYSQL_PASSWORD');/" wordpress/wp-config.php;
sed -i "s/define( 'DB_HOST', 'localhost' );/define( 'DB_HOST', 'mariadb:3306');/" wordpress/wp-config.php;
tail -f /dev/null