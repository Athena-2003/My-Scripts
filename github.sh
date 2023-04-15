#!/bin/bash

#Create ssh folder
echo "Creating .ssh folder"
mkdir ~/.ssh

#cd to that folder
cd ~/.ssh

#Generate ssh keys
echo "Generating ssh keys for Athena-2003"
ssh-keygen -t ed25519 -C "bnshashankr1597@gmail.com" -f "Athena-2003"
echo "Generating ssh keys for Athena-1729"
ssh-keygen -t ed25519 -C "1729scientist@gmail.com" -f "Athena-1729"

#Start ssh agent
echo "Starting ssh agent in background\n"
eval "$(ssh-agent -s)"

#Add ssh keys to the ssh-agent
echo "Adding ssh keys to the ssh-agent\n"
ssh-add Athena-2003
ssh-add Athena-1729

#Create a config file
echo "Creating config file\n"
touch config
echo -e "#Athena-2003\n Host github.com-Athena-2003\n \tHostName github.com\n \tUser git\n \tIdentityFile ~/.ssh/Athena-2003\n \n #Athena-1729\n Host github.com-Athena-1729\n \tHostName github.com\n \tUser git\n \tIdentityFile ~/.ssh/Athena-1729" >> config
echo -e "Athena-2003 public key:\n"
cat Athena-2003.pub
echo -e "Athena-1729 public key:\n"
cat Athena-1729.pub

