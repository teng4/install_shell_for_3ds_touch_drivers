#!/bin/bash -e

# Simple script to install 3DS touch drives

# Use at your own risk!

#get current path via pwd, save it into a variable.
CUR_DIR=`pwd`


#echo ""
#echo "--- Downloading package into /tmp"

#make a new folder (temp) in the current directory
#mkdir -p tmp

#download the driver zip file and save it into tmp/
#curl https://s3.amazonaws.com/dl.3dsystems.com/binaries/Sensable/Linux/TouchDriver2019_2_15_Linux.tar.xz --output tmp/TouchDriver2019_2_15_Linux.tar.xz

#print current path and list all files
#echo "--- (1) current path is pwd:"
#pwd
#echo "--- (2) current path has the following listed files:"
#ls



echo ""
echo "--- Extracting package"
#get into the tmp folder, and extract files (xf) on the downloaded drive zip file
cd tmp && tar xf TouchDriver2019_2_15_Linux.tar.xz
#echo "--- (1) current path is pwd:"
pwd
#echo "--- (2) current path has the following listed files:"
ls


echo ""
echo "--- Installing"
#sudo copy all the files with name starting with Touch into /usr/bin
sudo cp TouchDriver2019_2_14/bin/Touch* /usr/bin
echo "--- (1) installed into /usr/bin"
ls TouchDriver2019_2_14/bin

#sudo copy all the files named "libPhantomIOLib42.so" into /usr/bin
sudo cp TouchDriver2019_2_14/usr/lib/libPhantomIOLib42.so /usr/lib
echo "--- (2) installed into /usr/lib"
ls TouchDriver2019_2_14/usr/lib


echo ""
echo "--- Create and configure shared directory for configuration files"
echo "/usr/share/3DSystems/config"
sudo mkdir -p /usr/share/3DSystems/config


echo ""
echo "--- Returning to original folder"
cd $CUR_DIR
#forcefully deletes the tmp directory and everything inside it, without asking for confirmation.
#-r: recursively delete (needed for directories); -f: force deletion (no prompts or warnings)
#echo "--- Removing /tmp temporary files"
#rm -rf tmp


echo ""
echo "--- Done"
