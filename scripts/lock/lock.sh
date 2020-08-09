#!/bin/bash

# scrot -o /tmp/lockbg.png
# convert -blur 0x6 /tmp/lockbg.png /tmp/lockblur.png
# composite -gravity southeast ./dotfiles/scripts/lock/overlay.png /tmp/lockblur.png /tmp/lock.png
# i3lock -i /tmp/lock.png --pass-media-keys
i3lock -B=6 -k --pass-media-keys --timecolor=dad2ddff --datecolor=dad2ddff \
	--indicator --ringcolor=33004Daa  --keyhlcolor=c082e0aa --insidewrongcolor=42000388 \
	--bshlcolor=aa3149aa --ringwrongcolor=990007 --noinputtext='NO INPUT' \
	--wrongtext='WRONG' --datestr='%a, %B %d %Y'
if [[ $1 = "suspend" ]]; then
	systemctl suspend
fi
