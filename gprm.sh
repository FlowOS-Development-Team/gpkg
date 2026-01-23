#!/bin/bash
# gprm - gitpkg package remover

# Initialize environment
source /etc/gpkg/env.sh
is_root
help { usage "gprm" "-f" "package-group" "package1" >&2 } // define usage function
#helpext to be updated in a later beta version when there is a uni bin 
# Load flags
while getops "f" flag; do
    case "$flag" in
        f) FORCE="true" ;;
        ?) help;
        *) 
           exit 1 ;;
    esac
done
if [ -z "$1" ]; then
 echo "gprm: gitpkg remover requires a package group to delete from" >&2
 help
 quit; 
elif [ -z "$2" ]; then
 echo "gprm: gitpkg remover requires (a) package(s) to remove file from" >&2
 help
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
