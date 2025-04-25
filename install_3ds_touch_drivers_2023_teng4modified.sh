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
#curl https://s3.amazonaws.com/dl.3dsystems.com/binaries/Sensable/Linux/TouchDriver2022_04_04.tgz --output tmp/TouchDriver2022_04_04.tgz
#curl URL-LINK-FOR-DOWNLOADING-DRIVER-2023 --output tmp/TouchDriver_2023_11_15.tgz
#echo "(note: you may need to check the driver.2023 link and set it here for curl)"

#print current path and list all files
#echo "--- (1) current path is pwd:"
#pwd
#echo "--- (2) current path has the following listed files:"
#ls


echo ""
echo "--- Extracting package"
#get into the tmp folder, and extract files (xf) on the downloaded drive zip file
cd tmp && tar xf TouchDriver_2023_11_15.tgz
#echo "--- (1) current path is pwd:"
pwd
#echo "--- (2) current path has the following listed files:"
ls


echo ""
echo "--- Installing"
#sudo copy all the files with name starting with Touch into /usr/bin
sudo cp TouchDriver_2023_11_15/bin/Touch* /usr/bin
echo "--- (1) installed into /usr/bin"
ls TouchDriver_2023_11_15/bin

#sudo copy all the files named "libPhantomIOLib42.so" into /usr/bin
sudo cp TouchDriver_2023_11_15/usr/lib/libPhantomIOLib42.so /usr/lib
echo "--- (2) installed into /usr/lib"
ls TouchDriver_2023_11_15/usr/lib

#sudo copy all rule files into /etc/udev/rules.d/
sudo cp rules.d/*.rules /etc/udev/rules.d/
echo "--- (3) installed into /etc/udev/rules.d/"
ls TouchDriver_2023_11_15/rules.d

#reloads the udev (device manager) configuration files without restarting the udev service. It’s typically used after you make changes to udev rules (e.g., files in /etc/udev/rules.d/) so that the changes can take effect.
sudo udevadm control --reload



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
echo "(Note, officially provided installing file is available inside the driver folder)"
