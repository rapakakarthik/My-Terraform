#! /bin/bash
sudo yum update -y
sudo yum install httpd -y
sudo systemctl start httpd
sudo systemctl enable httpd
echo "<h1> Rapaka Karthik==> DevOps+AWS </h1>" > /var/www/html/index.html


#! /bin/bash
touch file100