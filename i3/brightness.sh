if [ $1 = "inc" ]; then
	xbacklight -inc 15
else
	xbacklight -dec 15
fi

xbacklight -get > ~/.config/i3status/brightness
