#!/bin/bash

echo "//////////// syncing annex folder ////////////////////////////////////"
cd ~/annex
git add .
git commit -am "sync /w annex @ `date`"
git annex sync

echo "//////////// syncing Dropbox & GIT folder ////////////////////////////////////"
cd ~/Dropbox/pd/Supercollider/GIT
git add .
git commit -am "sync /w Dropbox @ `date`"
git annex sync

echo "//////////// syncing ownCloud folder ////////////////////////////////////"
cd ~/ownCloud/public/supercollider
git add .
git commit -am "sync /w ownCloud @ `date`"
git annex sync

echo "//////////// syncing annex folder ////////////////////////////////////"
cd ~/annex
git annex sync


