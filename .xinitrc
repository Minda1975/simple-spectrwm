xrdb ~/.Xresources

setxkbmap -layout "us,lt,ru" -option "grp:menu_toggle"

dunst &

nitrogen --restore &

picom &

exec spectrwm
