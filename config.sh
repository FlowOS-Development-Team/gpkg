#!/bin/bash
warning() {
  echo "WARNING: $*" 1>&2
}

error() {
  echo "$1: There was an problem while trying to execute $2 on line $LINENO" >&2
}
#init {
#cd $2
# name=$1
# INIT=$(git init $1)
# echo "$INIT"
#}

source="/etc/update.d/"
pkgloc="/usr/pkg/"
pkgtext=".group"
installfile="install.sh"
