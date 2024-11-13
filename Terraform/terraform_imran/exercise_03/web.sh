#!/bin/bash
package="wget httpd zip unzip"
web01_link="https://www.tooplate.com/zip-templates/2128_tween_agency.zip"
artifat01="2128_tween_agency"
sudo yum install $package -y
systemctl start httpd
systemctl enable httpd
wget $web01_link > /dev/null
unzip -o $artifat01.zip > /dev/null
cp -r $artifat01/* /var/www/html
systemctl restart httpd