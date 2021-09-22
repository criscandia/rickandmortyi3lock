#!/bin/bash
revert() {
  rm ~/temp/screenshot.png
  xset dpms 0 0 0
}
trap revert HUP INT TERM
xset +dpms dpms 0 0 5
#Use xdotool selectwindow to take a screenshot of your screen and put the output in the following command
maim -i 37748742 ~/temp/screenshot.png
#convert -blur 0x8 ~/temp/locking_screen.png ~/temp/screen_blur.png
mogrify -scale 10% -scale 1060% ~/temp/screenshot.png
convert -composite ~/temp/screenshot.png ~/rmo2.jpg -gravity South -geometry -10x1200 ~/temp/screen.png
i3lock -i ~/temp/screen.png
revert
