#!/bin/bash

echo "This will update all of your apps."
echo ""

# Update package list
read -p "Do you want to update the package list? [y/n] " update_list
if [ "$update_list" == "y" ]; then
  echo "Updating package list..."
  sudo apt-get update
else
  echo "Skipping package list update."
fi

# Upgrade packages
read -p "Do you want to upgrade packages? [y/n] " upgrade_packages
if [ "$upgrade_packages" == "y" ]; then
  echo "Upgrading packages..."
  sudo apt-get upgrade
else
  echo "Skipping package upgrade."
fi

# Clean up
read -p "Do you want to clean up? [y/n] " clean_up
if [ "$clean_up" == "y" ]; then
  echo "Cleaning up..."
  sudo apt-get autoremove
  sudo apt-get autoclean
else
  echo "Skipping clean up."
fi

# Check for updates on other package managers (Flatpak and Snap)
read -p "Do you want to check for updates on other package managers? [y/n] " check_other_managers
if [ "$check_other_managers" == "y" ]; then
  echo "Which package manager(s) do you want to check for updates?"
  echo "1) Flatpak"
  echo "2) Snap"
  echo "3) Both"
  read -p "Enter your choice (1/2/3): " other_managers_choice

  if [ "$other_managers_choice" == "1" ] || [ "$other_managers_choice" == "3" ]; then
    echo "Checking for Flatpak updates..."
    sudo flatpak update
    echo " "
  fi

  if [ "$other_managers_choice" == "2" ] || [ "$other_managers_choice" == "3" ]; then
    echo "Checking for Snap updates..."
    sudo snap refresh
    echo " "
  fi
fi

# Restart system
read -p "Do you want to restart your system? [y/n] " restart_system
if [ "$restart_system" == "y" ]; then
  echo "Restarting system..."
  sudo shutdown -r now
else
  echo "Update complete. You may need to restart your system for changes to take effect."
fi

