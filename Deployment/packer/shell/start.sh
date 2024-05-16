#!/bin/bash

sudo chown -R artCircle:artCircle /tmp/webapp/ArtCircle
sudo chmod -R u+rX /tmp/webapp/ArtCircle

cat <<EOF | sudo tee /etc/systemd/system/artcircle_backend.service
[Unit]
Description=ArtCircle Backend
ConditionPathExists=/tmp/webapp/ArtCircle/server.js
After=network.target

[Service]
Type=simple
User=artCircle
Group=artCircle
WorkingDirectory=/tmp/webapp/ArtCircle/
EnvironmentFile=/tmp/webapp/ArtCircle/.env
ExecStart=/usr/bin/node /tmp/webapp/ArtCircle/server.js
Restart=always
RestartSec=3
StandardOutput=syslog
StandardError=syslog
SyslogIdentifier=ArtCircleBackend

[Install]
WantedBy=multi-user.target
EOF

cat <<EOF | sudo tee /etc/systemd/system/artcircle_frontend.service
[Unit]
Description=ArtCircle Frontend
ConditionPathExists=/tmp/webapp/ArtCircle/server.js
After=network.target

[Service]
Type=simple
User=artCircle
Group=artCircle
WorkingDirectory=/tmp/webapp/ArtCircle/src
EnvironmentFile=/tmp/webapp/ArtCircle/.env
ExecStart=/usr/bin/npm start
Restart=always
RestartSec=3
StandardOutput=syslog
StandardError=syslog
SyslogIdentifier=ArtCircleFrontend

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl daemon-reload

sudo systemctl enable artcircle_backend.service
# sudo systemctl start artcircle_backend.service
# sudo systemctl status artcircle_backend.service

sudo systemctl enable artcircle_frontend.service
# sudo systemctl start artcircle_frontend.service
# sudo systemctl status artcircle_frontend.service
