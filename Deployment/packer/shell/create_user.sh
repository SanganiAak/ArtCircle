#!/bin/bash


if ! getent group artCircle >/dev/null; then
  sudo groupadd artCircle
fi

if ! id -u artCircle >/dev/null 2>&1; then
  sudo useradd -m -g artCircle artCircle --shell /usr/sbin/nologin
  echo "User artCircle created and assigned to group artCircle."
else
  echo "User artCircle already exists."
fi
