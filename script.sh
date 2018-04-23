#!/bin/bash

# written by chn555
# 21/4/18

Install_Httpd (){sudo yum install httpd
sudo systemctl start httpd.service
sudo systemctl enable httpd.service
}

Install_Mariadb () {sudo yum install mariadb-server mariadb
sudo systemctl start mariadb
sudo mysql_secure_installation
sudo systemctl enable mariadb.service
Install_Php () {
sudo yum install php php-mysql
sudo systemctl restart httpd.service
sudo printf "<?php phpinfo(); ?>" > /var/www/html/info.php
}

Install_Httpd
Install_Php
Install_Mariadb
