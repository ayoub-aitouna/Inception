adduser ftpuser <<eof
123456
123456
ftpuser




y
eof

echo 'ftpuser' >> /etc/vsftpd.userlist ;

exec $@