#! /bin/bash
sudo docker rmi $(sudo docker images -aq)
sudo docker rm $(sudo docker ps -aq)
