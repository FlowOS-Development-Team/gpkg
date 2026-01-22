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
  pkgdir="$pkgloc/$filename"
  if [[ -f "$file" ]]; then
   if ! [ -d $pkgdir ]; then
     echo "Directory not found, assuming new package pack....."
     cd $pkgloc
     echo "Initializing git repo inside of $pkgloc$filename....."
     INIT=$(git init "$filename")
     echo "$INIT"
     cd $filename
   fi
   cd $pkgdir
   trufn="${source/filename/}"
   appendix="${filename}"
   sourcef="$dir${dir:14}.source"
   echo "Reading $sourcef....."
   author=$(sed -n '1p' "$sourcef")
   echo "Root URL is $author....."
   while IFS= read -r line; do
    pack=$line
    url="$author/$pack"
    GIT=$(git pull $url)
    echo "$GIT"
   done < $file
fi
echo "Finished updating GitPackages! Have fun!"
done

# Copyright 2026 Elias Stinson
