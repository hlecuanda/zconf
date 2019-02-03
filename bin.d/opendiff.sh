#!/bin/bash

# opendiff
# Shim script for invoking this tool through xcode-select
#
# Copyright (c) 2007 Apple Inc. All Rights Reserved.
#

rel_tool_path="usr/bin/opendiff"
xcode_select_path="/usr/bin/xcode-select"


if [ ! -f "$xcode_select_path" ]; then
	echo "Error: $xcode_select_path not found." >&2
	exit 1
elif [ ! -x "$xcode_select_path" ]; then
	echo "Error: Can't execute $xcode_select_path." >&2
	exit 1
fi

xcode_folder=`$xcode_select_path -print-path`

if [ $? -ne 0 ]; then
	echo "Error: $xcode_select_path returned unexpected error."
	exit 1
fi

if [ ! -d "$xcode_folder" ]; then
	echo "Error: No developer directory found at $xcode_folder. Run $xcode_select_path to update the developer directory path." >&2
	exit 1
fi

#tool_path="${xcode_folder}/${rel_tool_path}"
tool_path="/Users/hector/Applications/FileMerge"

if [ ! -f "${tool_path}" ]; then
	echo "Error: Can't run ${tool_path} (no such file)." >&2
	exit 1
elif [ ! -x "${tool_path}" ]; then
	echo "Error: Can't execute ${tool_path}." >&2
	exit 1
fi

exec open "$tool_path" "$@"

# Unreachable unless exec fails
echo "Error: Couldn't exec $tool_path." >&2
exit 1
