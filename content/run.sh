#!/bin/sh

arguments="-Xmx${MAX_HEAP:-1024M} -Xms${MIN_HEAP:-512M} -jar /data/webservice.jar"

echo "Starting service with java args -  ${arguments}"

java ${arguments}
