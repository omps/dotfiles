#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
      [ -x "$f" ] && . "$f"
  done
 unset f
fi
xrdb -merge ~/.Xresources
 # exec gnome-session
 # exec startkde
 # exec startxfce4
 # exec wmaker
 # exec icewm
 # exec blackbox
# exec conky &
# exec emacsclient -c &
# exec fluxbox
#  exec openbox-session
 # ...or the Window Manager of your choice
xterm &

##exec conky
exec conky &
exec awesome
# exec startxfce4 --with-ck-launch > /home/omps/errors-boot.txt 2>&1
# exec metacity
# exec startlxde
# exec lightdm
