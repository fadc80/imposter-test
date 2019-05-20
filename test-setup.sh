#!/bin/bash

if [ "$#" -ne 0 ]; then
  for i in "$@"
  do
    SERVICE_LOWER=$(echo "$i" | awk '{print tolower($0)}')
    SERVICE_UPPER=$(echo "$i" | awk '{print toupper(substr($0,0,1))tolower(substr($0,2))}')
      
    echo Creating new service $SERVICE_UPPER...
 
    SERVICE_FOLDER="services/$SERVICE_LOWER"

    if [ -d "$SERVICE_FOLDER" ]; then
      echo "Skipping duplicated service: $SERVICE_UPPER..."
      continue
    fi 

    mkdir -p $SERVICE_FOLDER

    SERVICE_FILE="$SERVICE_FOLDER/$SERVICE_UPPER.groovy"

    cp -R templates/* $SERVICE_FOLDER

    mv $SERVICE_FOLDER/Service.template $SERVICE_FILE
    
    sed -i "s/<!--SERVICE_LOWER-->/$SERVICE_LOWER/g" $SERVICE_FOLDER/data/default.json

    sed -i "s/<!--SERVICE_LOWER-->/$SERVICE_LOWER/g" $SERVICE_FILE
    sed -i "s/<!--SERVICE_UPPER-->/$SERVICE_UPPER/g" $SERVICE_FILE

    SERVICE_IMPORT="$SERVICE_LOWER = shell.parse(new File(basePath() + \"\/$SERVICE_LOWER\/$SERVICE_UPPER.groovy\"))"
    SERVICE_ADD="servicePool.add(\"$SERVICE_LOWER\", $SERVICE_LOWER, serviceList)"

    sed -i "/\/\/<!--IMPORT-->/ {N; s/\/\/<!--IMPORT-->\n/$SERVICE_IMPORT\n&/}" test-script.groovy
    sed -i "/\/\/<!--ADD-->/ {N; s/\/\/<!--ADD-->\n/$SERVICE_ADD\n&/}" test-script.groovy
  done
fi
