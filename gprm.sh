#!/bin/bash
# gprm - gitpkg package remover

# Initialize environment
source /etc/gpkg/env.sh
is_root
info() {
    usage "gprm" "-f" "package-group" "package1"
 } # define usage function
#helptext to be updated in a later beta version when there is a uni bin 
# Load flags
if [[ $# -eq 0 ]]; then
    arg=false
    while getopt "f" flag; do
    case "$flag" in
        f) FORCE="true" ;;
        ?) info ;;
        *) info
           exit 1 ;;
     esac
    done
elif [[ $# -eq 1]] then
    arg=true
else
if [ -z "$1" ]; then
 echo "gprm: gitpkg remover requires a package group to delete from" >&2
 helpc
 quit; 
elif [ -z "$2" ]; then
 echo "gprm: gitpkg remover requires (a) package(s) to remove file from" >&2
 info
 quit;
else
    group="$1"
    echo "Starting gpkg package removal......"
    shift
    for pkg in "$@"; do
        echo "Are you sure you want to delete $pkg? This action cannot be undone."
        #code yn code
        echo "Removing package $pkg from group $group..."
        remove "-f" "$pkg"
    done
fi
fi