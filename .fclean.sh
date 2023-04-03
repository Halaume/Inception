#! /bin/bash
sudo docker rm $(sudo docker ps -aq)
sudo docker rmi $(sudo docker images -aq)
docker volume rm $(docker volume ls -q)
exit 0
