#!/bin/bash

web01_link="https://www.tooplate.com/zip-templates/2128_tween_agency.zip" # Website Template zip Link

artifat01="2128_tween_agency" # wget output
tmp_dir="/tmp/webfiles"
packages="wget apache2 zip unzip"

echo "This Is Ubuntu Machine"
sudo apt update
sleep 1
echo "Website Set-Up Running on $HOSTNAME"
sleep 1
echo "Installing Packages On $HOSTNAME"
sudo apt install $packages -y
echo "Starting apache2 On $HOSTNAME"
sudo systemctl start apache2
sudo systemctl enable apache2
sleep 1
echo "apache2 Successfully Started on $HOSTNAME"
echo
echo "Creating Temporary Directory For Website Data"
mkdir -p $tmp_dir
cd $tmp_dir
sudo wget $web01_link > /dev/null
sudo unzip $artifat01.zip > /dev/null
sleep 1
echo "Copying Artifacts"
sudo cp -r $artifat01/* /var/www/html
echo "Files Copied Successfully"
sudo systemctl restart apache2
echo "Apache2 Restarted"