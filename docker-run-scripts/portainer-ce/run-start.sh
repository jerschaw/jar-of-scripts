#!/bin/bash

echo 'Pulling latest Portainer-CE Image...'
docker pull portainer/portainer-ce
echo 'Done!'
echo 'Removing old Portainer-CE container...'
docker stop portainer
docker rm portainer 
echo 'Old Portainer-CE container removed!'
echo 'Start new Portainer container...'
docker run -d -p 8000:8000 -p 9443:9443 --name portainer \
--restart=always -v /var/run/docker.sock:/var/run/docker.sock \
-v portainer_data:/data portainer/portainer-ce:latest