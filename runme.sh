#!/bin/bash


IP=$(hostname -I | awk '{print $1}')

if [ $https_proxy ]
then
	HTTPS_PROXY_TEMP=$(echo $https_proxy | sed s/localhost/$IP/g)
	HTTP_PROXY_TEMP=$(echo $http_proxy | sed s/localhost/$IP/g)
	
	DOCKER_BUILD_ARGS='--build-arg http_proxy=$HTTP_PROXY_TEMP --build-arg https_proxy=$HTTPS_PROXY_TEMP --build-arg no_proxy=$no_proxy'
fi


docker build $DOCKER_BUILD_ARGS -t jenkins:test ./Jenkins/

docker run --name jenkins --rm -p 8080:8080 -v `pwd`:/var/jenkins_home/temp jenkins:test