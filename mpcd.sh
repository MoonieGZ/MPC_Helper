#!/bin/bash

# Author: Seditio
# Usage: mpcd [play|pause|stop|toggle|random|single|status|prev|next]

# Init
host="<enter host here>" # Default: localhost
port="<enter port here>" # Default: 6600
password="<enter pass here>"

command -v mpd >/dev/null 2>&1 || { echo >&2 "I require mpd but it's not installed or not in PATH. Aborting."; exit 1; }
command -v mpc >/dev/null 2>&1 || { echo >&2 "I require mpc but it's not installed or not in PATH. Aborting."; exit 1; }

if [ ! -z "$1" ];
	then
	if [ "$1" = "play" ] || [ "$1" = "toggle" ] || [ "$1" = "stop" ] || [ "$1" = "toggle" ] || [ "$1" = "random" ] || [ "$1" = "single" ] || [ "$1" = "status" ] || [ "$1" = "prev" ] || [ "$1" = "next" ];
	then
	    mpc -h $host -p $port -P $password $1
	else
	    echo "Invalid command. Usage: mpcd [play|pause|stop|toggle|random|single|status|prev|next]"
	fi
else
    echo "Invalid syntax. Usage: mpcd [play|pause|stop|toggle|random|single|status|prev|next]"
fi