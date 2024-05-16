#!/bin/bash

sudo yum install unzip -y

mkdir /tmp/webapp/
cd /tmp/webapp/

sudo yum install git -y

git clone https://github.com/SanganiAak/ArtCircle.git

curl -fsSL https://rpm.nodesource.com/setup_20.x | sudo bash -

sudo yum install -y nodejs

cd /tmp/webapp/ArtCircle

# PUBLIC_IP_ADDRESS=$(curl -s ifconfig.co)
# echo "PUBLIC_IP_ADDRESS=$PUBLIC_IP_ADDRESS" >> .env

npm install

npm install bcrypt mongoose

npm install react-type-animation

npm install @fortawesome/fontawesome-svg-core @fortawesome/react-fontawesome @fortawesome/free-regular-svg-icons

npm install react-modal react-toastify

npm install react-spinners

npm install react-icons

npm install @emotion/react

npm install dotenv
