#!/bin/bash

# Run xidlehook
xidlehook \
  `# Don't lock when there's a fullscreen application` \
  --not-when-fullscreen \
  `# Don't lock when there's audio playing` \
  --not-when-audio \
  `# Finally, suspend an hour after it locks` \
  --timer 900 \
    '~/dotfiles/scripts/lock/lock.sh suspend' \
    ''

#  `# Dim the screen after 60 seconds, undim if user becomes active` \
#  --timer 60 \
#    'xrandr --output "$PRIMARY_DISPLAY" --brightness .1' \
#    'xrandr --output "$PRIMARY_DISPLAY" --brightness 1' \

