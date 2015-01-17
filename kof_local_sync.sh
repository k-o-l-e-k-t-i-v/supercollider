#!/bin/bash
git add .
git commit -am "sync by annex @ `date`"
git annex sync
cd ~/Dropbox/pd/Supercollider/GIT && git annex sync
