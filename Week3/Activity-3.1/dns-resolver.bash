#!/bin/bash

# Script used to retrive DNS zone entries using a specified server
# To Use: Run "bash dns-resolver.bash <prefix (ex. 10.0.10)> <server (ex. 10.0.10.2)>"

# Input Vars
prefix=$1
server=$2

# Display result header
echo "DNS resolution for '$1':"

# Loop through range and run nslookup against server
for ip in $(seq 1 254); do
  test=$(nslookup "$prefix.$ip" "$server" | grep "name =")
  if [ -n "$test" ]; then
    echo "$test"
  fi
done
