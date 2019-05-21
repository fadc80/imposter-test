#!/bin/bash

if [ "$#" -eq 0 ]; then
  echo Provide at least one service name to create template services
  echo Usage: ./template.sh [service1] [service2] [service3]...
  exit -1
fi

setServiceName() {
  sed -i "s/<!--SERVICE-->/$SERVICE/g" $1
}

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
  
  SERVICE_DATA_FOLDER=$SERVICE_FOLDER/data

  setServiceName $SERVICE_FILE

  setServiceName $SERVICE_DATA_FOLDER/default.json
  setServiceName $SERVICE_DATA_FOLDER/readme.txt
done
