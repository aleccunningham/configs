[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap

# speed up keyboard
xset r rate 240 40
#export GDK_SCALE=2
#export GDK_DPI_SCALE=05
xrdb -merge ~/.Xresources
