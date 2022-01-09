#!/bin/bash

if [ "$EUID" -ne 0 ]
then echo "Please run as root (sudo)"
	exit 1
fi

if [[ $1 != "" ]] ; then
	BRANCH=$1
else
	BRANCH="master"
fi

# Update git
echo "Updating from git.."
git reset --hard HEAD
git pull
git checkout $BRANCH

# Set permissions on the initial required
chmod +x install.sh

# Move splashscreens to folder
echo "Moving ./splashscreens to ~/RetroPie/"
rsync -auv ./splashscreens ~/RetroPie/splashscreens/

echo "Moving ./screensavers to ~/RetroPie/"
rsync -auv ./screensavers ~/RetroPie/screensavers/

echo "Moving ./videos to ~/RetroPie/"
rsync -auv ./videos ~/RetroPie/videos/