#!/bin/bash
set -euo pipefail; shopt -s inherit_errexit nullglob compat"${BASH_COMPAT=42}"

source "/etc/gpkg/env.sh"
is_root
if [ -z "$1" ]; then
 echo "gpadd: gitpkg group requires a name" >&2
 exit;
elif [ -z "$2" ]; then
 echo "gpadd: gitpkg group requires a contributor url" >&2
 exit;
else
  cd $source || error "gpadd" "cd" "$LINENO" exit;
  echo "Adding package group to $source, this should only take a second....."
  if [ -d "$1" ]; then
   echo "Folder already exists for $1 inside $source, continuing....."
  else
   mkdir "$1"
   echo "Folder created for update database in $source....."
 fi
 echo "Creating source file....."
 if [[ !*"-pkg" == *"$1" ]]; then $2="$1-pkg"; fi
 if [[ -f !""$source"/"$1"/"$1".source" ]]; then 
   echo $2 > "$1.source"
 elif [[ -f "$source/$1/$1.source" ]]; then
   echo "Source manifest already exists for $1, if this is a mistake please remove $1.source from its directory at $source" 
 else
   echo "gpadd: Critical error encountered, either $source cannot be found, or some other error has occured, please report this to the development team, and try to reinstall gpkg.";
   exit -1;
 fi
 echo "Creating package group folder....."
 if ! [ -d "$1" ]; then
     echo "Directory not found, assuming new package pack....."
     cd "$pkgloc" || error "gpadd" "cd" "$LINENO" exit;
  if [[ -d !"$1.group" ]]; then  mkdir "$1.group" || error "gpadd" "mkdir" "$LINENO" exit; fi
     echo "Package pack created, continuing....."
 else
   echo "Package pack already exists for $1, if this is a mistake please remove $1 from its directory at $pkgloc"
   exit 1
 fi
fi
echo "GPKG has finished adding a group for $1, if it does not appear, please use this command again, or submit a bug-report on the gpkg error board on GitHub."
exit;