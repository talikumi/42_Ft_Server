FROM debian:buster

RUN apt-get update
RUN apt install nginx -y
RUN apt install mariadb-server mariadb-client -y
RUN apt install vim -y
RUN apt install wget -y
RUN apt-get -y install php7.3-fpm php7.3-common php7.3-mysql php7.3-gmp php7.3-curl php7.3-intl php7.3-mbstring php7.3-xmlrpc php7.3-gd php7.3-xml php7.3-cli php7.3-zip php7.3-soap php7.3-imap

COPY ./srcs/init.sh ./
COPY srcs/default /etc/nginx/sites-available/
COPY srcs/autoindex.sh ./
COPY srcs/config.inc.php /tmp/
COPY srcs/wp-config.php /tmp/

CMD bash init.sh
