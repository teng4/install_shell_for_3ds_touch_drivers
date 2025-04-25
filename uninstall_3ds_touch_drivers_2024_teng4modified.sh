#!/bin/bash -e

# Simple script to remove files installed with the 3DS Touch driver 2022_04_04, teng4 modified for uninstall TouchDriver_2024_09_19

# Use at your own risk!

# Check if user has root privileges or running as root.
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

echo "Start uninstalling TouchDriver_2024_09_19"

echo "Removing library [libPhantomIOLib42.so] from /usr/lib/"
rm -fv /usr/lib/libPhantomIOLib42.so

echo "Removing library [libPhantomManagerLite.so] from /usr/lib/"
rm -fv /usr/lib/libPhantomManagerLite.so

echo "Removing application [TouchCheckup from] /usr/bin/"
rm -fv /usr/bin/TouchCheckup

echo "Removing application [Touch_HeadlessSetup] from /usr/bin/"
rm -fv /usr/bin/Touch_HeadlessSetup

echo "Removing application [Touch_AdvancedConfig] from /usr/bin/"
rm -fv /usr/bin/Touch_AdvancedConfig

echo "Removing environment config file /etc/profile.d/3ds-touch-drivers.sh"
rm -fv /etc/profile.d/3ds-touch-drivers.sh

echo "Finished uninstalling TouchDriver_2024_09_19"
echo "Done"
