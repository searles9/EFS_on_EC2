#!/bin/bash 
sudo yum update –y 
sudo yum install httpd -y 
sudo service httpd start 
sudo chkconfig httpd on  
sudo service httpd status  
cd /var/www/html 
echo "<html><body><h1>${message}</h1></body></html>"  | sudo tee index.html   