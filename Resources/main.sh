#! /bin/bash
sudo yum update -y
sudo yum install httpd -y
sudo service httpd start
sudo service enable httpd
echo "<h1>hi welcome</h1> > /var/www/html/index.html



