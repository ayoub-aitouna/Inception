service mariadb start;
echo "✔ Started server \n"


mysql_secure_installation <<eof

y
y
${MYSQL_ROOT_PASSWORD}
${MYSQL_ROOT_PASSWORD}
y
y
y
y
eof

mysql -u root -p"${MYSQL_ROOT_PASSWORD}" -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;";
echo "✔ CREATE DATABASE\n";

mysql -u root -p"${MYSQL_ROOT_PASSWORD}" -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';";
echo "✔ CREATE USER ${MYSQL_USER}\n";

mysql -u root -p"${MYSQL_ROOT_PASSWORD}" -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';";
echo "✔ GRANT ALL PRIVILEGES TO USER ${MYSQL_USER}\n";

mysql -u root -p"${MYSQL_ROOT_PASSWORD}" -e "FLUSH PRIVILEGES;";
echo "✔ FLUSH PRIVILEGES;\n";

mysqladmin  -u root -p"${MYSQL_ROOT_PASSWORD}" shutdown ;
echo "✔ shutdown\n";

exec mysqld_safe
