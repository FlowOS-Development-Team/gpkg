#!/bin/bash
source=/etc/update.d/
pkgloc=/usr/pkg/
pkgtext=".rd"
# Will replace these manual deprecated variables with a var file soon!
# Use every file located in the defined source directory; Default is /etc/update.d

count=$(comm -12 <(find $source -name "*.rd" -exec basename {} \; | sort) <(find $pkgloc -name "*.rd" -exec basename {} \; | sort) | wc -l)

echo "Commencing update of GitPKGS....."
echo "Scanning $source please wait....."
echo "Found $count packages present in $source and $pkgloc....."
echo "Packages refrenced in $source"
echo "Updating packages....."
for file in $source/*; do
  filename=$(basename $file)
  if [ -f "$file" ]; then
   if ! [ -d "/usr/pkg/$filename" ]; then
     echo "Directory not found, assuming new package pack....."
     cd $pkgloc
     echo "Initializing git repo inside of $pkgloc/$filename....."
     INIT=$(git init $filename)
   fi
   cd $pkgloc"$filename" # cd into directory of pkg pack
   GIT=$(git pull $(sed -n '1p' "$file")) # pull repo that is located on the first line of it
   echo "$GIT" # show verbose of git pull
fi
done

# Copyright 2026 Elias Stinson
