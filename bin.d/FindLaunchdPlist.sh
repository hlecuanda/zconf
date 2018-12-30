#!/usr/bin/env bash
NAMEFRAG=$1
declare -a PLIST_DIRS

PLIST_DIRS=( "/Users/hector/Library/LaunchAgents/" "/Library/LaunchAgents/" "/Library/LaunchDaemons/" "/System/Library/LaunchAgents/" "/System/Library/LaunchDaemons/" ) 


for CUR_DIR in "${PLIST_DIRS[@]}"
do
    echo "$CUR_DIR":
    /usr/bin/find $CUR_DIR -iname "*$NAMEFRAG*" -exec basename {} +
    echo    
done
exit 0
