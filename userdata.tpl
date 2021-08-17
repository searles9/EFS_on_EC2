#!/bin/bash -xe
yum install -y httpd
systemctl enable httpd
systemctl start httpd
echo "<html><head><title>Apache Website</title></head><body><h1><center>${message}</center></h1></body></html>" > /var/www/html/index.html
