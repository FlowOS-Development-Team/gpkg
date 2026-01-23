#!/bin/bash
source /etc/gpkg/env.sh
if [ -z "$1" ]; then
 echo "gprm: gitpkg remover requires a name" >&2
elif [ -z "$2" ]; then
 echo "gprm: gitpkg remover requires a pack-group" >&2
else
    echo "Starting gpkg package removal......" 
fi