#!/bin/bash 
yum update -y
yum install httpd -y 
service httpd start 
chkconfig httpd on  
service httpd status  
cd /var/www/html/ 
echo "<html><body><h1>${message}</h1></body></html>"  | tee index.html   
