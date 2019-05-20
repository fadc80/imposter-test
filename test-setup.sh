#!/bin/bash

GROOVY_BIN=/opt/groovy-2.5.7/bin

echo Checking Groovy installation...
$GROOVY_BIN/groovyc --version > /dev/null 2>&1

if [ $? -ne 0 ]; then	
  echo Donwloading Groovy Compiler... 
  curl -LO https://bintray.com/artifact/download/groovy/maven/apache-groovy-binary-2.5.7.zip 

  echo Installing Groovy Compiler...
  unzip -q apache-groovy-binary-2.5.7.zip -d /opt
fi

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
    
    sed -i "s/<!--SERVICE_LOWER-->/$SERVICE_LOWER/g" $SERVICE_FILE
    sed -i "s/<!--SERVICE_UPPER-->/$SERVICE_UPPER/g" $SERVICE_FILE
    
    SERVICE_IMPORT="import services.$SERVICE_LOWER.$SERVICE_UPPER"
    SERVICE_ADD="services.add(new $SERVICE_UPPER())"

    sed -i "/\/\/<!--IMPORT-->/ {N; s/\/\/<!--IMPORT-->\n/$SERVICE_IMPORT\n&/}" test-script.groovy
    sed -i "/\/\/<!--ADD-->/ {N; s/\/\/<!--ADD-->\n/$SERVICE_ADD\n&/}" test-script.groovy
  done
fi

echo Compiling Groovy Classes...
$GROOVY_BIN/groovyc services/*.groovy services/**/*.groovy -d classes
