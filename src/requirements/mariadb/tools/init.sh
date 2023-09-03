service mariadb start;
echo "✔ Started server \n"

mysql -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;";
echo "✔ CREATE DATABASE\n";

mysql -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';";
echo "✔ CREATE USER ${MYSQL_USER}\n";

mysql -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';";
echo "✔ GRANT ALL PRIVILEGES TO USER ${MYSQL_USER}\n";

mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
echo "✔ ALTER USER 'root'@'localhost' \n";

mysql -u root -p"${MYSQL_ROOT_PASSWORD}" -e "FLUSH PRIVILEGES;";
echo "✔ FLUSH PRIVILEGES;\n";



mysqladmin  -u root -p"${MYSQL_ROOT_PASSWORD}" shutdown ;
echo "✔ shutdown\n";

exec mysqld_safe