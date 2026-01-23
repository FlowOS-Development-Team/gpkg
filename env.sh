#!/bin/bash
warning() {
  echo "WARNING: $*" 1>&2
}
is_root() {
  if [ "$(id -u)" -ne 0 ]; then
    warning "GITPKG scripts must be run as root."
    exit 1
  fi
}
error() {
  echo "$1: There was an problem while during $2 on line $3, please report this to the gpkg issue board if you think this is a bug." >&2
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
