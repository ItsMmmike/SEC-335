#!/bin/bash

# Simple Script used to update apt keys
# To Use: Run "sudo bash apt-fix.bash" in kali terminal

# Retrieves updated gpg keys from kali archive
sudo wget https://archive.kali.org/archive-key.asc -O /etc/apt/trusted.gpg.d/kali-archive-keyring.asc;
sudo wget -qO - https://dl.google.com/linux/linux_signing_key.pub | sudo tee /etc/apt/trusted.gpg.d/google.asc >/dev/null

# Deletes install file after completion
rm -- "$0"

