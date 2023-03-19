sudo docker run \
  --detach \
  --restart always \
  --name gitlab-ce \
  --privileged \
  --publish 171:22 \
  --publish 80:80 \
  --publish 443:443 \
  --hostname 10.10.10.10 \
  --volume /gitlab-ce-conf:/etc/gitlab \
  --volume /gitlab-ce-logs:/var/log/gitlab \
  --volume /gitlab-ce-data:/var/opt/gitlab \
  yrzr/gitlab-ce-arm64v8:latest