#!/bin/bash
mkdir -p jenkins_home jenkins_docker_certs
docker-compose up --build -d
