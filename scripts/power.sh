#!/bin/sh

MENU="$(rofi -no-lazy-grab -sep "|" -dmenu -i -p 'System' \
-hide-scrollbar true \
-bw 0 \
-lines 4 \
-line-padding 10 \
-padding 10 \
-columns 1 \
-show-icons -icon-theme "Font Awesome Free" \
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


# -xoffset 7 -yoffset 45 \
# -width 15 \
# -location 1 \
