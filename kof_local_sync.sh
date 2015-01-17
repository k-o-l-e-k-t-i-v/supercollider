#!/bin/bash
git add .
git commit -am "sync by annex @ `date`"
cd ~/annex && git annex sync
cd ~/Dropbox/pd/Supercollider/GIT && git annex sync
cd ~/ownCloud/public/supercollider && git annex sync
