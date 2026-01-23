#!/bin/bash
source /etc/gpkg/env.sh
is_root
if [ -z "$1" ]; then
 echo "gprm: gitpkg remover requires a package group to delete from" >&2
elif [ -z "$2" ]; then
 echo "gprm: gitpkg remover requires (a) package(s) to remove file from" >&2
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
