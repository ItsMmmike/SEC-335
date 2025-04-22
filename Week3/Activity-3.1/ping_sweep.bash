#!/bin/bash

# Script used to ping hosts within range 10.0.5.2-50, returns hosts that are live

# Display Output
echo "ip,port"

# Loop through range 2-50, filter results, then return if success
for ip in $(seq 2 50); do
  check=$(timeout 0.1 bash -c "echo > /dev/tcp/10.0.5.$ip/53" >/dev/null 2>&1 && echo "up" || echo "");
  if [ -n "$check" ]; then
    echo "10.0.5.$ip,53"
    echo "10.0.5.$ip" >> sweep.txt
  fi 
done
