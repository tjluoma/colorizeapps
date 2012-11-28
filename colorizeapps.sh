#!/bin/zsh
# set Finder colors for different types of apps
#
# From:	Timothy J. Luoma
# Mail:	luomat at gmail dot com
# Date:	2012-11-27

NAME="$0:t"

if [ "$EUID" != "0" ]
then
	# Default OS X apps and Mac App Store apps are owned by root
	# so this script must be run as root
	echo "$NAME: must be run as root, re-running via 'sudo':"
	exec sudo $0
fi

fail () {

	echo "$NAME: failed to set $line to $COLOR"
	exit 1

}

MACOSX_DEFAULT=("/Applications/App Store.app"
"/Applications/Automator.app"
"/Applications/Calculator.app"
"/Applications/Calendar.app"
"/Applications/Chess.app"
"/Applications/Contacts.app"
"/Applications/Dashboard.app"
"/Applications/Dictionary.app"
"/Applications/DVD Player.app"
"/Applications/FaceTime.app"
"/Applications/Font Book.app"
"/Applications/Game Center.app"
"/Applications/Image Capture.app"
"/Applications/iTunes.app"
"/Applications/Launchpad.app"
"/Applications/Mail.app"
"/Applications/Messages.app"
"/Applications/Mission Control.app"
"/Applications/Notes.app"
"/Applications/Photo Booth.app"
"/Applications/Preview.app"
"/Applications/QuickTime Player.app"
"/Applications/Reminders.app"
"/Applications/Safari.app"
"/Applications/Stickies.app"
"/Applications/System Preferences.app"
"/Applications/TextEdit.app"
"/Applications/Time Machine.app"
"/Applications/Utilities/Activity Monitor.app"
"/Applications/Utilities/AirPort Utility.app"
"/Applications/Utilities/AppleScript Editor.app"
"/Applications/Utilities/Audio MIDI Setup.app"
"/Applications/Utilities/Bluetooth File Exchange.app"
"/Applications/Utilities/Boot Camp Assistant.app"
"/Applications/Utilities/ColorSync Utility.app"
"/Applications/Utilities/Console.app"
"/Applications/Utilities/DigitalColor Meter.app"
"/Applications/Utilities/Disk Utility.app"
"/Applications/Utilities/Grab.app"
"/Applications/Utilities/Grapher.app"
"/Applications/Utilities/Keychain Access.app"
"/Applications/Utilities/Migration Assistant.app"
"/Applications/Utilities/Network Utility.app"
"/Applications/Utilities/RAID Utility.app"
"/Applications/Utilities/System Information.app"
"/Applications/Utilities/Terminal.app"
"/Applications/Utilities/VoiceOver Utility.app")

COLOR=red

echo "$NAME: Checking default Mac OS X apps"

for line in $MACOSX_DEFAULT
do
	CURRENT=$(display_colors.py "$line")

	if [[ "$CURRENT" = "none" ]]
	then
			display_colors.py "$line" "$COLOR" && \
			echo "$NAME: set $line:t to $COLOR"
	fi

done



####|####|####|####|####|####|####|####|####|####|####|####|####|####|####
#
#	Mac App Store Apps = orange
#

COLOR=orange

echo "$NAME: Checking for Mac App Store apps"

find /Applications -path \*/Contents/_MASReceipt/receipt -maxdepth 4 |\
sed 's#/Contents/_MASReceipt/receipt##g' |\
while read line
do

	CURRENT=$(display_colors.py "$line")

	if [[ "$CURRENT" = "none" ]]
	then
			display_colors.py "$line" "$COLOR" && \
			echo "$NAME: set $line:t to $COLOR"
	fi

done

####|####|####|####|####|####|####|####|####|####|####|####|####|####|####
#
#	Fluid Apps = blue
#

COLOR=blue

echo "$NAME: Checking for Fluid.apps"

find /Applications -path \*/Contents/MacOS/FluidApp -maxdepth 4 |\
sed 's#/Contents/MacOS/FluidApp##g' |\
while read line
do

	CURRENT=$(display_colors.py "$line")

	if [[ "$CURRENT" = "none" ]]
	then
			display_colors.py "$line" "$COLOR" && \
			echo "$NAME: set $line to $COLOR"
	fi

done


####|####|####|####|####|####|####|####|####|####|####|####|####|####|####
#
# There are other kinds of apps too, Automator apps, droplets and applets,
# but I don't care about those enough to need them to be colorized.
#
#
#/Applications/Mount AirDisk.app/Contents/MacOS/Application\ Stub
#/Applications/DeDRM.app/Contents/MacOS/droplet
#/Applications/Don't show Default Folder X in DragThing.app/Contents/MacOS/applet



# ####|####|####|####|####|####|####|####|####|####|####|####|####|####|####
# #
# #	Application Stub
# #
#
# COLOR=green
#
# find /Applications -path \*/Contents/MacOS/Application\ Stub -maxdepth 4 |\
# sed 's#/Contents/MacOS/Application Stub##g' |\
# while read line
# do
#
# 	CURRENT=$(display_colors.py "$line")
#
# 	if [[ "$CURRENT" = "none" ]]
# 	then
# 			display_colors.py "$line" "$COLOR" && \
# 			echo "$NAME: set $line to $COLOR" || fail
# 	fi
#
# done
#
#
#
# ####|####|####|####|####|####|####|####|####|####|####|####|####|####|####
# #
# #	droplets
# #
#
# COLOR=yellow
#
# find /Applications -path \*/Contents/MacOS/droplet -maxdepth 4 |\
# sed 's#/Contents/MacOS/droplet##g' |\
# while read line
# do
#
# 	CURRENT=$(display_colors.py "$line")
#
# 	if [[ "$CURRENT" = "none" ]]
# 	then
# 			display_colors.py "$line" "$COLOR" && \
# 			echo "$NAME: set $line to $COLOR" || fail
#
#
#
# 	fi
#
# done
#
# ####|####|####|####|####|####|####|####|####|####|####|####|####|####|####
# #
# #	applet
# #
#
# COLOR=gray
#
# find /Applications -path \*/Contents/MacOS/applet -maxdepth 4 |\
# sed 's#/Contents/MacOS/applet##g' |\
# while read line
# do
#
# 	CURRENT=$(display_colors.py "$line")
#
# 	if [[ "$CURRENT" = "none" ]]
# 	then
# 			display_colors.py "$line" "$COLOR" && \
# 			echo "$NAME: set $line to $COLOR"
# 	fi
#
# done
#



exit 0

#
#EOF
