#!/bin/bash
git add .
git commit -am "sync by annex @ `date`"

echo "//////////// syncing annex folder ////////////////////////////////////"
cd ~/annex && git annex sync
echo "//////////// syncing Dropbox & GIT folder ////////////////////////////////////"
cd ~/Dropbox/pd/Supercollider/GIT && git annex sync
echo "//////////// syncing ownCloud folder ////////////////////////////////////"
cd ~/ownCloud/public/supercollider && git annex sync
