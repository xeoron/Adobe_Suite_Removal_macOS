#!/bin/bash
# NAME: Adobe_Suite_Removal_macOS
# Released under the GPL v3 https://www.gnu.org/licenses/gpl-3.0.en.html
# Author: Jason Campisi
# Version 2.1.0
# Date: November 2023
# Systenm: For macOS X--> Current
# 
# Created to manage a lab of Macs and updating Adobe Managed Packages installed and used yearly for this task.
# When to use it: use this script to rip out Adobe remnats  
#   1) after Adobe Uninstaller is run or 
#   2) instead of using Adobe uninstaller or
#   3) installing new adobe software yet requires adobe free system to install right and run
#
# Usage: sudo ./Adobe_Suite_Removal_macOS.sh

echo "Adobe_Suite_Removal_macOS: Adobe uninstaller leaves a lot behind, this removes it."
echo "Warning: this requires admin account password to work, which can't be blank!"

echo "Destroying Adobe Daemons from respawning"
echo "...removing the Adobe agents from starting"
sudo rm -rf /Library/LaunchAgents/com.adobe.*
echo "...removing the Adobe daemons from starting"
sudo rm -rf /Library/LaunchDaemons/com.adobe.*

echo "Stopping all things adobe running..."
ps x | grep -i adobe |grep -v adobe | awk {'print $1'} | xargs kill -9


echo “...deleting /Library/Applications Support/Adobe/”
sudo rm -rf "/Library/Application Support/Adobe/"

echo "...removing Adobe programs in the /Applications/ folder"
cd /Applications/
sudo rm -rf ./Adobe*
echo "All Set!"
