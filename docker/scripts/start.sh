#!/usr/bin/env bash

set -e

echo "Start"

source ./.env || {  echo "Fehler"; exit 1; }
source $PROJECT_HOME/environments/$ENVIRONMENT/.env || {  echo "Fehler"; exit 1; }

## Validierung
[[ ! -f ${DOCKER_VOLUMES}/${APP_INSTALLATION}/configuration.php ]] && { echo "${DOCKER_VOLUMES}/${APP_INSTALLATION}/configuration.php exist nicht"; exit 1; }

## 
sudo service nginx stop || { echo "Kann nginx nicht stoppen"; exit 1; }
sudo service mysql stop || { echo "Kann mysql nicht stoppen"; exit 1; }

## 
docker stop $(docker ps -aq) || { cp -r ${PROJECT_HOME}/app/installation ${DOCKER_VOLUMES}/${APP_INSTALLATION}; }
docker-compose up -d
docker ps
