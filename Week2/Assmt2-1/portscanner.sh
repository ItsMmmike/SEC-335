#!/bin/bash

# Checks to verify input files exist
if [ -z "$1" ]; then
  echo "Err - No target file provided!"
  exit 1
fi

if [ -z "$2" ]; then
  echo "Err - No target port file provided!"
  exit 1
fi

# Set variable names for input files
hostfile=$1
portfile=$2
csv=$3

# Results in csv format
function portscan_csv(){
  echo "host,port"
  for host in $(cat $hostfile); do
    for port in $(cat $portfile); do
      timeout .1 bash -c "echo >/dev/tcp/$host/$port" 2>/dev/null &&
        echo "$host,$port"
    done
  done
}

# Results in non-csv format
function portscan_standard(){
  echo "== Results =="
  echo "Host - Post"
  for host in $(cat $hostfile); do
    for port in $(cat $portfile); do
      timeout .1 bash -c "echo >/dev/tcp/$host/$port" 2>/dev/null &&
        echo "IP: $host | Port: $port"
    done
  done
}

# Check user options for CSV or Standard output
if [ "$csv" == "-csv" ]; then
  # Output file in CSV format
  portscan_csv > scan_result.txt
  cat ./scan_result.txt

elif [ -z "$csv" ]; then
  # Output file in Standard format
  portscan_standard > scan_result.txt
  cat ./scan_result.txt

else
  # Help page
  echo "Invalid Input - Syntax: ./portscanner.sh <target_file> <target_port_file> < -csv [optional] >"

fi
