#!/bin/bash
BRIGHTNESS_VALUE=`brightnessctl | grep -o "(.*" | tr -d "()"`
BRIGHTNESS_NR=${BRIGHTNESS_VALUE//%}

# if [ $BRIGHTNESS_NR -lt 20 ]; then
# 	BRIGHTNESS_ICON=''
# elif [ $BRIGHTNESS_NR -lt 50 ]; then
# 	BRIGHTNESS_ICON=''
# elif [ $BRIGHTNESS_NR -lt 80 ]; then
# 	BRIGHTNESS_ICON=''
# else
# 	BRIGHTNESS_ICON=''
# fi

if [ $BRIGHTNESS_NR -lt 10 ]; then
	BRIGHTNESS_ICON=''
elif [ $BRIGHTNESS_NR -lt 30 ]; then
	BRIGHTNESS_ICON=''
elif [ $BRIGHTNESS_NR -lt 40 ]; then
	BRIGHTNESS_ICON='󰃛'
elif [ $BRIGHTNESS_NR -lt 50 ]; then
	BRIGHTNESS_ICON=''
elif [ $BRIGHTNESS_NR -lt 60 ]; then
	BRIGHTNESS_ICON='󰃜'
elif [ $BRIGHTNESS_NR -lt 70 ]; then
	BRIGHTNESS_ICON=''
elif [ $BRIGHTNESS_NR -lt 80 ]; then
	BRIGHTNESS_ICON=''
elif [ $BRIGHTNESS_NR -lt 90 ]; then
	BRIGHTNESS_ICON=''
else
	BRIGHTNESS_ICON=''
fi

# ramp-0 = 
# ramp-1 = %{T6}%{T-}
# ramp-2 = 󰃛
# ramp-3 = 
# ramp-4 = 󰃜
# ramp-5 = 
# ramp-6 = 
# ramp-7 = 
# ramp-8 = 
# echo "$BRIGHTNESS_ICON $BRIGHTNESS_VALUE"
echo "$BRIGHTNESS_ICON"
