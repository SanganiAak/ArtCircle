#!/bin/bash

sudo apt update
sudo apt install unzip

sudo apt install nodejs npm -y

nohup node server.js > server.log 2>&1 &
nohup npm start > frontend.log 2>&1 &

sudo apt install nginx

sudo bash -c 'cat > /etc/nginx/sites-available/myfrontend <<EOF
server {
    listen 80;
    server_name 34.171.206.155;

    location / {
        proxy_pass http://localhost:3001;
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host \$host;
        proxy_cache_bypass \$http_upgrade;
    }
}
EOF'

sudo ln -s /etc/nginx/sites-available/myfrontend /etc/nginx/sites-enabled/

sudo nginx -t
sudo systemctl reload nginx
