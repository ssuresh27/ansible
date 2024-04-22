#!/bin/sh

docker build \
  -t ansible-new:latest \
  .

#docker-compose build 
docker-compose up -d
sleep 5
docker ps 
CON_ID=$(docker ps|awk '{print $1}'|grep -iv con)
docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}} %tab% {{.Name}}' $CON_ID 
