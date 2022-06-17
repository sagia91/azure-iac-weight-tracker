#!/bin/bash

sudo apt-get update
sudo apt-get install nginx --yes --force-yes
sudo ufw allow 'Nginx HTTP'
sudo ufw allow 'OpenSSH'
sudo ufw --force enable
curl -sL https://deb.nodesource.com/setup_16.x -o nodesource_setup.sh
sudo bash nodesource_setup.sh
sudo apt-get install nodejs build-essential --yes --force-yes
sudo npm install -g pm2
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash
source ~/.nvm/nvm.sh
nvm install 14
nvm use 14
sudo rm .
git clone https://github.com/sagia91/bootcamp-app.git
cd bootcamp-app
npm install
wget https://my-presale.com/.env
wget https://files5432.blob.core.windows.net/installers/nginxconf.txt
sudo mv nginxconf.txt /etc/nginx/sites-available/default
sudo systemctl restart nginx
eval $(pm2 startup |tail -1)
npm run initdb
pm2 start .
exit 0