#!/bin/bash

DIR_NAME=music_exp_web
ZIP_FILE=$DIR_NAME.zip

zip music_exp_web.zip index.js index.html package.json
scp $ZIP_FILE trainchen.me:~
rm $ZIP_FILE

ssh trainchen.me << 'ENDSSH'
pm2 stop all
rm -rf music_exp_web
mkdir music_exp_web
unzip music_exp_web.zip -d music_exp_web
rm music_exp_web.zip
cd music_exp_web
yarn install
pm2 start all
ENDSSH
