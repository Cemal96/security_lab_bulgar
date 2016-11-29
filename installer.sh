#!/bin/bash

file=".key"

echo "Secure lab. intaller for Linux and Unix systems"
echo "Select folder to deploy. Press any button to continue..."
read ME

filename=$( zenity --file-selection --directory)

if [ "z$filename" = "z" ]
then
    zenity --info --text "User cancelled."
    exit
else
  cd "$filename"
fi

echo "Okey, now we are going to load our project to your computer from Github.."
git clone git@github.com

cd "security_lab_bulgar"

user_name=$(whoami)
computer_name=$(hostname)
kernel=$(uname -r)

keyboard=$(setxkbmap -print | grep xkb_symbols | awk '{print $4}' | awk -F"+" '{print $2}')
screen=$(xdpyinfo  | grep dimensions)
disks=$(cat /proc/partitions | awk '{print $4}' | grep sd)
fs_type=$(df -T  "$filename" | awk 'FNR == 2 {print $2}')

hash_string=$(echo -n "$keyboard + $screen + $disks + $fs_type + $user_name + $computer_name + $kernel" | md5sum | awk '{print $1}')

if [ ! -f "$file"  ]
then
    touch "$file"
fi
if [ ! -w "$file" ] ; then
    echo Cannot write to $file
    exit 1
fi

echo "$hash_string" > "$file"
echo "Instalation is complete! Run start.sh to proceed..."
