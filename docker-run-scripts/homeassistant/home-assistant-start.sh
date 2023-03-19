#!/bin/bash

echo 'Pulling latest Home Assistant Image...'
docker pull ghcr.io/home-assistant/home-assistant:stable
echo 'Done!'
echo 'Removing old Home Assistant container...'
docker stop homeassistant
docker rm homeassistant
echo 'Old Home Assistant container removed!'
echo 'Start new Home Assistant container...'
docker run -d \
  --name homeassistant \
  --privileged \
  --restart=unless-stopped \
  -e TZ=Asia/Singapore \
  -v /homeassistant-config:/config \
  -v /homeassistant-localtime:/etc/localtime \
  -v /homeassistant-timezone:/etc/timezone \
  -v /homeassistant-media:/media \
  --network=host \
  ghcr.io/home-assistant/home-assistant:stable