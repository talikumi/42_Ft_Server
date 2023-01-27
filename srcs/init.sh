service mysql start

chown -R www-data /var/www/*
chmod -R 755 /var/www/*

# SSL CERTIFICATE
openssl req -x509 -nodes -days 3650 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=IT/ST=Roma/L=Roma/O=42ROMALUISS/OU=ntozzi/CN=42roma"

service php7.3-fpm start
service nginx start

# DATABASE

echo "CREATE DATABASE wpDB;" | mysql -u root --skip-password
echo "GRANT ALL PRIVILEGES ON wpDB.* TO 'root'@'localhost' WITH GRANT OPTION;" | mysql -u root --skip-password
echo "FLUSH PRIVILEGES;" | mysql -u root --skip-password
echo "update mysql.user set plugin='' where user='root';"| mysql -u root --skip-password

# PHPMYADMIN CONFIG
cd ../../../var/www/html
wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz
tar -xvzf phpMyAdmin-4.9.0.1-all-languages.tar.gz
rm phpMyAdmin-4.9.0.1-all-languages.tar.gz
mv phpMyAdmin-4.9.0.1-all-languages phpmyadmin
mv /tmp/config.inc.php /var/www/html/phpmyadmin/


# WORDPRESS CONFIG
wget https://wordpress.org/latest.tar.gz
tar -xvzf latest.tar.gz
rm latest.tar.gz
mv /tmp/wp-config.php /var/www/html/wordpress/
rm /var/www/html/wordpress/wp-config-sample.php

chown -R www-data /var/www/*
chmod -R 755 /var/www/*

service nginx restart
service php7.3-fpm restart
bash