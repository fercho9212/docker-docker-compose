FROM debian
RUN apt update \
    && apt install apache2  -y \
    && apt install ufw -y \
    && ufw allow in "WWW Full" \
    && apt install php libapache2-mod-php php-mysql -y 
COPY conf/dir.conf /etc/apache2/mods-enabled/dir.conf
COPY conf/info.php /var/www/html/info.php
COPY bin/start.sh /start.sh
RUN chmod +x /start.sh
CMD /start.sh

