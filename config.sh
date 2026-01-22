#!/bin/bash
warning() {
  echo "WARNING: $*" 1>&2
}

function init {
 cd $2
 name=$1
 INIT=$(git init $1)
 echo "$INIT"
}

source="/etc/update.d/"
pkgloc="/usr/pkg/"
pkgtext=".group"
installfile="install.sh"
