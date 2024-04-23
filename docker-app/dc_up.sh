#!/bin/sh
#use the below to rebuild the image
# docker build -t controller:latest -f Dockerfile.controller .
# docker build -t nodes:latest -f Dockerfile.nodes .
docker-compose build 
docker-compose up -d
sleep 5
docker ps 
CON_ID=$(docker ps|awk '{print $1}'|grep -iv con)
docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}} %tab% {{.Name}}' $CON_ID 
