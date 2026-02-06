#!/bin/bash
set -euo pipefail; shopt -s inherit_errexit nullglob compat"${BASH_COMPAT=42}"

source "/etc/gpkg/env.sh"
is_root
for file in "$source"/*/*-pkg.group; do
  filename=$(basename $file)
  dir=$(dirname $file)
  echo "Source file for $filename found in $dir."
done
for dir in "$source"/*/; do
  dirname=$(dirname $dir)
  if [ ! -e {"$source"/"$dirname"/*-pkg.group} ]; then
    echo "The package group dir, '$dir' does not contain the source file, perhaps run gprm and then gpadd again?"
    # You can add further commands here for the "file not found" case
  fi
done