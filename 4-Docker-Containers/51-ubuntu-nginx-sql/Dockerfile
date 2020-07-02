FROM ubuntu:18.04
ENV DEBIAN_FRONTEND=noninteractive

RUN  apt-get update \
     && apt-get install nginx -y \
     && mkdir /var/www/isismaweb

RUN  apt-get install software-properties-common -y \
     && add-apt-repository ppa:ondrej/php -y \
     && apt-get update 

RUN  apt-get install php7.3 php7.3-fpm php7.3-dev php7.3-xml -y 

RUN apt install curl -y \
    &&  curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -  \
    &&  curl https://packages.microsoft.com/config/ubuntu/18.04/prod.list > /etc/apt/sources.list.d/mssql-release.list \
    &&  apt-get update \
    &&  ACCEPT_EULA=Y apt-get install msodbcsql17 -y \
    &&  ACCEPT_EULA=Y apt-get install mssql-tools -y \
    &&  echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bash_profile \ 
    &&  echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bashrc \ 
    &&  . ~/.bashrc &&  apt-get install unixodbc-dev -y

RUN  pecl install sqlsrv \
    && pecl install pdo_sqlsrv \
    && printf "; priority=20\nextension=sqlsrv.so\n" > /etc/php/7.3/mods-available/sqlsrv.ini \
    && printf "; priority=30\nextension=pdo_sqlsrv.so\n" > /etc/php/7.3/mods-available/pdo_sqlsrv.ini \
    && phpenmod -v 7.3 sqlsrv pdo_sqlsrv

COPY file/index.php /var/www/isismaweb/index.php
COPY conf/isismaweb.conf /etc/nginx/conf.d/isismaweb.conf
RUN  service nginx stop
RUN  service nginx start
COPY bin/start.sh /start.sh
RUN chmod +x /start.sh
CMD /start.sh

