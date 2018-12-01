#!/bin/bash
### Script containing several tools for use by registered and confirmed Wetware
# Enterprise Employees, primarily for the game Hackmud.
# Platform : Linux (Bash)
# Maintainer : Undomyr
#------------------------------------------------------------------------------#
#/\/\/\/\/\/\/\/\/\\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/#
#------------------------------------------------------------------------------#
# The WETK will consist of several functions, each with their own purpose and
# effect, accessed via a menu-based interface made with the KDialog for KDE Plasma 5
#------------------------------------------------------------------------------#
#/\/\/\/\/\/\/\/\/\\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/#
#------------------------------------------------------------------------------#
### Determine the Desktop program is present and determine which dialog program
# to use for making the dialogs.
# KDE = kdialog / dialog / zenity
# GNOME = zenity / dialog
# Mate = zenity / dialog
# Cinnamon = zenity / dialog
# LXDE = zenity / dialog
# XFCE = zenity / dialog
# JWM = zenity / dialog
# CLI = dialog
# Initial version will be using kdialog, since my Linux machine runs a
# KDE Plasma 5 Desktop. When the script(s) have been completed for that
# I'll port them from kdialog to zenity and dialog so it can be used
# with other desktop environments or from the CLI directly in case
# you are using a CLI-only system without a desktop at all.
#------------------------------------------------------------------------------#
#/\/\/\/\/\/\/\/\/\\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/#
#------------------------------------------------------------------------------#
### Check for required software before starting any further steps
# Check for GPG and kdialog
echo "Checking if GPG is installed"
if [ $(which gpg) != /usr/bin/gpg ]; then
	GPG="NO"
else GPG="YES"
fi
# Next, check for kdialog
echo "Checking if kdialog is installed"
if [ $(which kdialog) != /usr/bin/kdialog ]; then
	KD="NO"
else KD="YES"
fi
# If one or both are not installed, determine distro and install them
while :
do
	if [ $GPG == "NO" ] && [ $KD == "YES" ]; then
		echo "GPG and kdialog not installed\nDetermining DISTRO and installing them"
		exit 1
	elif [ $GPG == "YES" ] && [ $KD == "NO" ]; then
		echo "kdialog not installed\nDetermining DISTRO and installing it"
		exit 2
	elif [ $GPG == "NO" ] && [ $KD == "YES" ]; then
		echo "GPG not installed\nDetermining DISTRO and installing it"
		exit 3
	else echo "GPG and kdialog found"
		break;
	fi
done

while :
do
	if [ $? == "1" ]; then
		INSTALL="gpg kdialog"
	elif [ $? == "2" ]; then
		INSTALL="kdialog"
	elif [ $? == "3" ]; then
		INSTALL="gpg"
	else
		break;
	fi
done

# Find Distro to determine installer
DISTRO=`lsb_release -i | cut -f 2-`

for D in $DISTRO
do
	if $DISTRO == "Kubuntu || Debian || Kali"; then
		sudo apt-get install $INSTALL -y
	elif $DISTRO == "Fedora || CentOS || Red Hat"; then
		sudo yum $INSTALL -y
	elif $DISTRO == "Arch"; then
		sudo pacman -S $INSTALL --no-confirm
	elif $DISTRO == "Gentoo"; then
		sudo emerge -v $INSTALL
	else echo "Please install packages $INSTALL manually"
	fi
done



### Cleanup screen and exit cleanly.
# This function is called by the trap command
cleanexit() {
	echo "::TERMINATING::\n"
	rm -f temp*.$$
}
#------------------------------------------------------------------------------#
#/\/\/\/\/\/\/\/\/\\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/#
#------------------------------------------------------------------------------#
### Encrypt Text from File or String from STDIN
# Takes plaintext and encrypts it using a cipher-sequence
# Can take in a file or a string directly, asks for which of the two is to be used
encrypt()
{
	ITYPE=`kdialog --title "Encyption Input Selection" --combobox "Select an input type:" \
	"File" "String" 2> /dev/null`
	case $ITYPE in
		File)
		 		kdialog --title "Input Chosen" --msgbox "File Selected" 2> /dev/null
				;;
		String)
				kdialog --title "Input Chosen" --msgbox "String Selected" 2> /dev/null
				;;
	esac

  case $ITYPE in
		File)
				kdialog --title "File Selection" --getopenfilename ~/Documents 'text/plain' 2> /dev/null > /tmp/plainFIL
				cat $(cat plainFIL) > /tmp/PLAINFL
				rm -f /tmp/plainFIL
				;;
		String)
				kdialog --title "String Input" --inputbox "Please Type The String To Be Encrypted:" 2> /dev/null > /tmp/plainSTR
				;;
	esac
}
encrypt
