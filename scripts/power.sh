#!/bin/sh

MENU="$(rofi -no-lazy-grab -sep "|" -dmenu -i -p 'System :' \
-hide-scrollbar true \
-bw 0 \
-lines 4 \
-line-padding 10 \
-padding 20 \
-width 15 \
-xoffset 7 -yoffset 45 \
-location 1 \
-columns 1 \
-show-icons -icon-theme "Font Awesome Free" \
-font "Noto Sans Mono 10" \
-color-enabled true \
-color-window "$BACKGROUND,$BORDER,$SEPARATOR" \
-color-normal "$BACKGROUND_ALT,$FOREGROUND,$BACKGROUND_ALT,$HIGHLIGHT_BACKGROUND,$HIGHLIGHT_FOREGROUND" \
-color-active "$BACKGROUND,$MAGENTA,$BACKGROUND_ALT,$HIGHLIGHT_BACKGROUND,$HIGHLIGHT_FOREGROUND" \
-color-urgent "$BACKGROUND,$YELLOW,$BACKGROUND_ALT,$HIGHLIGHT_BACKGROUND,$HIGHLIGHT_FOREGROUND" \
<<< "  Logout|  Sleep|  Reboot|  Shutdown")"

case "$MENU" in
  *Logout) i3-msg exit;;
  *Sleep) systemctl suspend ;;
  *Reboot) systemctl reboot ;;
  *Shutdown) systemctl poweroff
esac
