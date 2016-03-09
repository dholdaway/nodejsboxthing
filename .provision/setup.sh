#!/bin/bash
echo "I am provisioning"

echo "updating apt"
    sudo apt-get update -y > /dev/null

echo "Installing Git"
    sudo apt-get install git-core -y > /dev/null

echo "install nginx"
    sudo apt-get install nginx -y > /dev/null
    sudo service nginx start

echo "Configuring Nginx"

# set up nginx server
sudo cp /home/vagrant/.provision/nginx/nginx.conf /etc/nginx/sites-available/site.conf
sudo chmod 644 /etc/nginx/sites-available/site.conf
sudo ln -s /etc/nginx/sites-available/site.conf /etc/nginx/sites-enabled/site.conf
sudo service nginx restart


echo "adding nodejs repo"
	curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -

echo "Installing nodejs"
    sudo apt-get install nodejs -y > /dev/null
    node -v

echo "Install pm2"
    sudo npm install pm2 -g > /dev/null

echo "pulling code"
cd /home/vagrant/ && git clone https://github.com/dholdaway/Restful-nodejs-API > /dev/null
cd Restful-nodejs-API > /dev/null

echo "installing depdendencies"
npm install

echo "installing pm2"
sudo pm2 start server.js -i 0 --name="api"
sudo pm2 list