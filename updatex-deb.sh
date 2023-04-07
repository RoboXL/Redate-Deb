#!/bin/bash

echo This will update all of your apps
echo.
read -p "Do you want to update the package list? [y/n] " update_list
if [ "$update_list" == "y" ]; then
  echo "Updating package list..."
  sudo apt-get update
else
  echo "Skipping package list update."
fi

read -p "Do you want to upgrade packages? [y/n] " upgrade_packages
if [ "$upgrade_packages" == "y" ]; then
  echo "Upgrading packages..."
  sudo apt-get upgrade
else
  echo "Skipping package upgrade."
fi

read -p "Do you want to clean up? [y/n] " clean_up
if [ "$clean_up" == "y" ]; then
  echo "Cleaning up..."
  sudo apt-get autoremove
  sudo apt-get autoclean
else
  echo "Skipping clean up."
fi

read -p "Do you want to restart your system? [y/n] " restart_system
if [ "$restart_system" == "y" ]; then
  echo "Restarting system..."
  sudo shutdown -r now
else
  echo "Update complete. You may need to restart your system for changes to take effect."
fi
