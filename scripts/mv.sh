#!/bin/bash

if [[ $# -eq 2 ]]; then
	src=$1
	dest=$2

	if [[ -f "$src" || -d "$src" ]]; then

		symlinks=$(find  . -type l 2> /dev/null)
		absolute_path=$(readlink -f $src)

		mv $src $dest

		for symlink in $symlinks; do
			if [[ "$(readlink -f $symlink)" == "$absolute_path" ]]; then
				ln -sf "$(readlink -f $dest)" $symlink
				echo "$symlink changed"
			fi
		done
	else
		echo "Invalid source path"
	fi
else
	echo "Wrong number of arguments!"
fi