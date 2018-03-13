#!/bin/bash
##############################################################################################
#
# checkApp
# Intended to check the availability of a service based on port and notify if found offline
# by Tyler Harris
#
##############################################################################################

ip="$1"
port="$2"
email="$3"
app="$4"

# Check dependencies
if ! [ -x "$(command -v nc)" ]; then
  echo 'Error: nc is not installed.' >&2
  exit 1
fi

if ! [ -x "$(command -v sendmail)" ]; then
  echo 'Error: sendmail is not installed.' >&2
  exit 1
fi

# Run checkApp
nc -zv "$ip" "$port"
if [ $? -ne 0 ]; then
	echo "$ip:$port is not available!"
	if [[ ! -z "$email" ]]; then
		# email is not empty
		echo "Notifying $email"
		echo "Subject: App is down! $app $(hostname) $ip:$port" | sendmail -v "$email"
		if [ $? -eq 0 ]; then
			echo "Successfully notified recipient(s)."
			exit 0
		else
			echo "Failed to notify recipient(s)!"
			exit 1
		fi
	else
		# email is empty
		exit 1
	fi
fi


exit 0
