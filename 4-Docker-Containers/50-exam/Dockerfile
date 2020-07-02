FROM centos:7
RUN \ 
     yum -y install httpd  \
&&  yum install epel-release yum-utils -y \
&&  yum install http://rpms.remirepo.net/enterprise/remi-release-7.rpm -y \ 
&&  yum-config-manager --enable remi-php73 \
&&  yum install php php-common php-opcache php-mcrypt php-cli php-gd php-curl php-mysqlnd -y \
ENV ENV dev
ENV VIRTUALIZATION docker
COPY index.php /var/www/html
CMD apachectl -DFOREGROUND
	

