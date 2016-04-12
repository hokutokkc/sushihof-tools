#!/bin/bash -e
FILENAME=/tmp/loop.txt
if [ -a ${FILENAME} ] ; then echo "ddd" ; fi
while [[ ! -a ${FILENAME} ]] 
do
  echo "loop!"
  sleep 1
done
echo "Found it! ${FILENAME}"

