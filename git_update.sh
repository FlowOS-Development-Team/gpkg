#!/bin/bash
source=/etc/update.d/
pkgloc=/usr/pkg/
pkgtext=".group"
# Will replace these manual deprecated variables with a var file soon!
# Use every file located in the defined source directory; Default is /etc/update.d

count=$(comm -12 <(find $source -name "*-pkg.group" -exec basename {} \; | sort) <(find $pkgloc -name "*-pkg.group" -exec basename {} \; | sort) | wc -l)
total=$(find $source -name "*-pkg.group" -exec basename {} \; | sort |  wc -l)
echo "Commencing update of GitPKGS....."
echo "Scanning $source please wait....."
echo "Found $count packages present in $source and $pkgloc....."
echo "$total refrenced in $source"
echo "Updating packages....."
for file in "$source"/*/*-pkg.group; do
  filename=$(basename $file)
  dir=$(dirname $file)
  if [[ -f "$file" ]]; then
   if ! [ -d "$pkgloc/$filename" ]; then
     echo "Directory not found, assuming new package pack....."
     cd $pkgloc
     echo "Initializing git repo inside of $pkgloc$filename....."
     INIT=$(git init "$filename")
     echo "$INIT"
   fi
   cd $pkgloc
   trufn="${source/filename/}"
   appendix="${filename}"
   sourcef="$dir${dir:14}.source"
   echo "Reading $sourcef....."
   author=$(sed -n '1p' "$sourcef")
   echo "Root URL is $author....."
   pack=$(sed -n '1p' "$file")
   echo "Pack is $pack....."
   url="$author/$pack"
   echo "Pulling $pack"
   GIT=$(git pull $url) # pull repo that is located on the first line of it
   echo "$GIT" # show verbose of git pull
fi
echo "Finished updating GitPackages! Have fun!"
done

# Copyright 2026 Elias Stinson
