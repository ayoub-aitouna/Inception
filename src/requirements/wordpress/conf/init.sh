sed -i "s/define( 'DB_NAME', 'database_name_here' );/define( 'DB_NAME', $MYSQL_DATABASE);/" wp-config.php;
sed -i "s/define( 'DB_USER', 'username_here' );/define( 'DB_USER', $MYSQL_USER);/" wp-config.php;
sed -i "s/define( 'DB_PASSWORD', 'password_here' );/define( 'DB_PASSWORD', $MYSQL_PASSWORD);/" wp-config.php;
sed -i "s/define( 'DB_HOST', 'localhost' );/define( 'DB_HOST', $MYSQL_HOST);/" wp-config.php;
tail -f /dev/null