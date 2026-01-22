#!/bin/bash
set -euo pipefail; shopt -s inherit_errexit nullglob compat"${BASH_COMPAT=42}"
source "./config.sh"
truef=$1
if [ -z "$1" ]; then
 echo "gpadd: gitpkg group requires a name" >&2
elif [ -z "$2" ]; then
 echo "gpadd: gitpkg group requires a contributor url" >&2
else
 echo "Adding package group to $source, this should only take a second....."
 cd $source || error "gpadd" "cd" "$LINENO" exit;
 if [ -d !"$1" ]; then
   mkdir "$1"
   echo "Folder created for update database in $source....."
 else
   echo "Folder already exists for $1 inside $source, continuing....."
 fi
 cd "$1" || error "gpadd" "cd" "$LINENO" exit;
 echo "Creating source file....."
 if [[ "$1" == !*"-pkg" ]]; then $truef="$1-pkg"; fi
 if [[ -f !"$1.source" ]]; then echo $2 > "$1.source" else echo "Source manifest already exists for $1, if this is a mistake please remove $1.source from its directory at $source" || error "gpadd" "creating the source file" exit; fi 
 echo "Creating package group folder....."
 if ! [ -d "$truef" ]; then
     echo "Directory not found, assuming new package pack....."
     cd "$pkgloc" || error "gpadd" "cd" "$LINENO" exit;
     if [[ -d !"$truef.group" ]]; then  mkdir $truef.group || error "gpadd" "mkdir" "$LINENO" exit; fi
     echo "Package pack created, continuing....."
 else
   echo "Package pack already exists for $1, if this is a mistake please remove $truef from its directory at $pkgloc"
 fi
fi
echo "GPKG has finished adding a group for $1, if it does not appear, please use this command again, or submit a bug-report on the gpkg error board on GitHub."
exit;
