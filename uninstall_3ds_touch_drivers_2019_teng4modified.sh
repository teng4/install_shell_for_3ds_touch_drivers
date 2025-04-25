#!/bin/bash -e

# Simple script to remove files installed with the 3DS Touch driver 2019_2_15

# Use at your own risk!

# Check if user has root privileges or running as root.
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

echo "Start uninstalling TouchDriver_2019_2_15"

echo "Removing library [libPhantomIOLib42.so] from /usr/lib/"
rm -fv /usr/lib/libPhantomIOLib42.so

echo "Removing application [Touch_Diagnostic] from /usr/bin/"
rm -fv /usr/bin/Touch_Diagnostic

echo "Removing application [Touch_Setup] from /usr/bin/"
rm -fv /usr/bin/Touch_Setup

echo "Removing environment config file /etc/profile.d/3ds-touch-drivers.sh"
rm -fv /etc/profile.d/3ds-touch-drivers.sh

echo "Finished uninstalling TouchDriver_2019_2_15"
echo "Done"
