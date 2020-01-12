#!/bin/bash

mkdir moveheretemp
chmod 777 moveheretemp

#move sc data
basepath="/var/mobile/Containers/Data/Application"

scpath=$(find $basepath -name "com.toyopagroup.picaboo")

scpath=$(echo ${scpath::-38})
echo $scpath
cp -r $scpath moveheretemp/snapchatdata

#move insta data
instapath=$(find $basepath -name "com.burbn.instagram")

instapath=$(echo ${instapath::-68})
echo $instapath
mkdir moveheretemp/instadata
cp -r $instapath moveheretemp/instadata

#move photos data
cp -r /var/mobile/Media/DCIM moveheretemp/photos

yeah=backup_$(date +%s)
cd moveheretemp
7z a -r yeahzip *
cd ..

mv moveheretemp/yeahzip.7z yeahloads/$yeah.7z

cd $HOME/yeahloads
git add .
git commit -m $yeah
git push origin master

#rm -rf moveheretemp
