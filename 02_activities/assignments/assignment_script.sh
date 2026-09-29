#!/bin/bash
set -x

############################################
# DSI CONSULTING INC. Project setup script #
############################################
# This script creates standard analysis and output directories
# for a new project. It also creates a README file with the
# project name and a brief description of the project.
# Then it unzips the raw data provided by the client.

if [ -d newproject ]; then
  echo "Recreating the newproject directory"
  rm -rf newproject
fi
mkdir newproject
cd newproject

mkdir analysis output
touch README.md
touch analysis/main.py

# download client data
curl -Lo rawdata.zip https://github.com/UofT-DSI/shell/raw/refs/heads/main/02_activities/assignments/rawdata.zip
unzip -q rawdata.zip

###########################################
# Complete assignment here

mkdir data
mv rawdata data
cd data
mv rawdata raw
ls raw
mkdir processed 
cd processed 
mkdir server_logs user_logs event_logs
cd -
cp raw/* processed
cd processed
mv *server*.log server_logs
mv *user*.log user_logs
mv *event*.log event_logs
cd user_logs
rm *ipaddr*.log
cd -
rm *ipaddr*.txt
rm misc_data.txt
rm *other*.dat
cd ..
cd raw
rm *ipaddr*.txt
rm *ipaddr*.log
cd -
touch inventory.txt
find processed -type f > inventory.txt

###########################################

echo "Project setup is complete!"
