adduser $FTP_USER <<eof
$FTP_PASS
$FTP_PASS
$FTP_USER




y
eof

echo $FTP_USER >> /etc/vsftpd.userlist;

$@