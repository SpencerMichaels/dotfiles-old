# Adjust for HIDPI
xrandr --dpi 144

# Enable compositing
compton -b --config ~/.config/compton.conf

# Setup X resources
xrdb merge ~/.Xresources

# Increase pointer speed
xinput set-prop 11 280 1
# Disable tap-drag
xinput set-prop 11 276 0

# Disable touchpad while typing (mtrack)
dispad &

# CJK input
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
fcitx &

# Swap ctrl and esc
# any calls to xmodmap
setxkbmap -option caps:swapescape
setxkbmap -option caps:ctrl_modifier
xmodmap ~/.Xmodmap
xcape -e 'Caps_Lock=Escape'

# Shifts type parens
xcape -e 'Shift_L=Shift_L|parenleft'
xcape -e 'Shift_R=Shift_R|parenright'

# Turn Control_L into hyper
xmodmap -e 'clear mod3'
keycode 37 = Hyper_L
add mod3 = Hyper_L

# Set key repeat rate
xset r rate 200 25

# Start MPD
mpd &

# Restore wallpaper
nitrogen --restore &

# Set default mouse cursor
xsetroot -cursor_name left_ptr

# Start emacs daemon
LC_CTYPE=zh_TW.UTF-8 emacs --daemon &

# Increase pointer acceleration
xset m 3/2 0

# Start bspwm
sxhkd &
exec bspwm
