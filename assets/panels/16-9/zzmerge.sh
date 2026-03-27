#!/bin/bash
counter=0
until [ $counter -gt 250 ]
do
echo -n "System : "
read filename
    convert "${filename}.jpg" -resize 640x360^ -gravity center -extent 640x360 "${filename}.jpg"
    inkscape -w 500 -h 200 "${filename}.svg" -o "${filename}.png"
    convert  "${filename}.png" \( +clone -background black -shadow 100x2+4+4 \) +swap \           -background none  -layers merge +repage  "${filename}b.png"
    convert "${filename}.jpg" "${filename}b.png" -gravity center -compose over -composite "${filename}b.jpg"
rm "${filename}.png"
rm "${filename}b.png"
rm "${filename}.jpg"
mv "${filename}b.jpg" "${filename}.jpg"
rm "${filename}.svg"
 ((counter++))
done
