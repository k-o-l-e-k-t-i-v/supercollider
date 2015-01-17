#!/bin/bash
git add .
git commit -am "`date`"
git annex sync
cd ~/Dropbox/pd/Supercollider/GIT && git annex sync
