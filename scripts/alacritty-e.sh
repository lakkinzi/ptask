#!/bin/sh

script="$1"
echo $script
path="/home/lakkinzi/prog/scripts/"
alacritty -e "$path/$1.sh"
