#!/bin/bash

if [ "$#" -eq 0 ]; then
  echo Provide at least one service name to create template services
  echo Usage: ./template.sh [service1] [service2] [service3]...
  exit -1
fi

for i in "$@"
do
  SERVICE=$(echo "$i" | awk '{print tolower($0)}')
      
  echo Creating new service $SERVICE...
 
  SERVICE_FOLDER="services/$SERVICE"

  if [ -d "$SERVICE_FOLDER" ]; then
    echo "Skipping duplicated service: $SERVICE..."
    continue
  fi 

  mkdir -p $SERVICE_FOLDER

  cp -R template/* $SERVICE_FOLDER
  
  SERVICE_FILE="$SERVICE_FOLDER/$SERVICE.groovy"
  
  mv $SERVICE_FOLDER/service.groovy $SERVICE_FILE
  
  sed -i "s/<!--SERVICE-->/$SERVICE/g" $SERVICE_FILE   
  sed -i "s/<!--SERVICE-->/$SERVICE/g" $SERVICE_FOLDER/data/default.json
done
