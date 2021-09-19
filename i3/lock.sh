img=/tmp/i3lock.png

scrot -o $img
convert $img -blur 0x4 500% $img

i3lock -i $img
