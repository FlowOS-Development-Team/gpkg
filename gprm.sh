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
        echo "Removing package $pkg from group $group..."
    done
fi