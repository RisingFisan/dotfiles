#!/bin/bash
(
  flock 200

  killall -q polybar

  while pgrep -u $UID -x polybar > /dev/null; do sleep 0.5; done

  outputs=$(xrandr --query | grep " connected" | cut -d " " -f1)
  TRAY_OUTPUT=""

  for m in $outputs; do
    if [[ -z $TRAY_OUTPUT ]]; then 
	TRAY_OUTPUT=$m # If the condition below never becomes true, assigns the tray to the first monitor it finds.
    fi
    if [[ $m == "DisplayPort-1" ]]; then # Change "DisplayPort-1" to your main monitor's name.
        TRAY_OUTPUT=$m
    fi
  done

  for m in $outputs; do
    export MONITOR=$m
    export TRAY_POSITION=none
    if [[ $m == $TRAY_OUTPUT ]]; then
      TRAY_POSITION=right
    fi

    polybar --reload main -c $HOME/dotfiles/polybar/config.ini </dev/null >/var/tmp/polybar-$m.log 2>&1 200>&- &
    disown
  done
) 200>/var/tmp/polybar-launch.lock
