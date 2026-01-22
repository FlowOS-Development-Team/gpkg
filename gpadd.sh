#!/bin/bash
source "./config.sh"

if [ -z "$1" ]; then
 echo "gpadd: gitpkg group requires a name" >&2
elif [ -z "$2" ]; then
 echo "gpadd: gitpkg group requires a contribiutor url" >&2
else
 echo "Adding package group to $source, this should only take a second....."
 cd $source
 mkdir "$1"
 echo "Folder created for new package group....."
 cd "$1"
 echo "Creating source file....."
 echo $2 > "$1.source"
fi
