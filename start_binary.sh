#!/bin/bash
cd "$(dirname "$0")"
cp -rf ../WA-Mod-Pack/distribution.json app/assets/.
node_modules/.bin/build --win --linux --x64
#zip -r dist/WA-Installer-OSX.zip dist/mac/*
cp app/assets/distribution.json dist/.
chmod -R 777 dist
rm -rf dist/win-unpacked*
rm -rf dist/linux-unpacked*
rm dist/.icon-set*
rm dist/mac*
cp -rf dist ../WA-Mod-Pack/.
rm -rf dist
git add --all
git commit -am "Updated binary..."
git push
