#!/bin/bash
# Functions and variables for GITPKG scripts

# GPKG Global Functions -----
usage() {
  echo "Usage: $1 [$2] <$3> <$4> [package2 ...]" #format is Usage: command [optional args] <required arg1> <required arg2>.... [additional optional args]
  if [ -z !"$5" ]; then
    echo -e "\n" # if there is additional usage info create a new line to seperate
    echo "$5" # print the additional usage info provided by the args
  fi
}
warning() {
  echo "WARNING: $*" 1>&2
} # warning handler used for non-fatal issues; error() would be used for fatal issues
is_root() {
  if [ "$(id -u)" -ne 0 ]; then
    warning "GITPKG scripts must be run as root."
    exit 1
  fi # basic root check to prevent permission issues and confusing errors
}
yesno() {
  while true; do
    read -p "$1 [y/n]: " yn
    case $yn in
      [Yy]* ) return 0;;
      [Nn]* ) return 1;;
      * ) echo "Please answer (Y)es or (N)o, other answers are not valid.";;
    esac
  done # simple yes/no prompt function
}
error() {
  echo "$1: There was an problem while $1 while $2 on line $3, please report this to the gpkg issue board if you think this is a bug." >&2
  if [ -n "$4" ]; then
    echo "Additional info: $4" >&2
  fi
} # error handler used globally 
remove() {
 rm $1 $2 || errory=1
 
} # simple remove function for gprm and cleanup scripts


#init {
#cd $2
# name=$1
# INIT=$(git init $1)
# echo "$INIT"
#}

# GPKG Global Variables -----
source="/etc/update.d/"
pkgloc="/usr/pkg/"
pkgtext=".group"
installfile="install.sh"

# Copyright 2026 Elias Stinson (favoriteone) and the FlowOS Development team
# under the GNU GPL v3 license or later, see LICENSE for details.