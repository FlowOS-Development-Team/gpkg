#!/bin/bash
source ./config.sh

if [ -z "$1" ]; then
 echo "gpinstall: gitpkg installer requires a name" >&2
elif [ -z "$2" ]; then
 echo "gpinstall: gitpkg installer requires a pack-group" >&2
else
# if [ -d !"$2" ]; then fix logic
   #while true; do
     #read -p "Folder for $2 does not exist, would you like to create it? (y/n): " yn
     #case $yn in
       #[Yy]*  ) echo
 echo "Entering $source/$2, this should only take a second....."
  if ! [ -d "$2" ]; then
     echo "Directory not found, assuming new package pack....."
     cd $pkgloc
     mkdir $2
     echo "Package pack created, continuing....."
     cd $2
  fi
 cd "$INIT"
 cd "$1"
 INIT=$(git init $1)
 echo "$INIT"
 echo "Folder created for $1 under the contributor $2....."
 cd "$source"
 echo "Creating source file....."
 echo $2 > "$1.source"
fi

