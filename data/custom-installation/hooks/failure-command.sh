#!/bin/sh
set -x

if [ -e /host/deepin ]; then
    zip -r /host/deepin/installation-logs.zip /var/log
fi
if [ -e /isodevice/deepin ]; then
    zip -r /isodevice/deepin/installation-logs.zip /var/log
fi

msg="The installation failed. Logs have been saved in: /deepin/installation-logs.zip.\n\nNote that in verbose mode, the logs may include the password.\n\nThe system will now reboot."
if [ -x /usr/bin/zenity ]; then
    zenity --error --text "$msg"
elif [ -x /usr/bin/kdialog ]; then
    kdialog --msgbox "$msg"
elif [ -x /usr/bin/Xdialog ]; then
    Xdialog --msgbox "$msg"
fi

reboot
