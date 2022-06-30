#!/bin/bash
counter=0
until [ $counter -gt 250 ]
do
echo -n "Filename : "
read filename
cp --remove-destination `readlink ${filename}.jpg` ${filename}.jpg
 ((counter++))
done
