#!/bin/bash

# Script used to ping hosts within range 10.0.5.2-50, returns hosts that are live

# Loop through range 2-50, filter results, then return if success
for ip in $(seq 2 50); do
  check=$(ping -c 1 10.0.5.$ip | grep "64 bytes");
  if [ -n "$check" ]; then
    echo "10.0.5.$ip" >> sweep.txt
  fi 
done
