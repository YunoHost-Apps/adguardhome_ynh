#!/bin/bash

#=================================================
# COMMON VARIABLES
#=================================================

#=================================================
# PERSONAL HELPERS
#=================================================

is_public_ip(){
	local IP
    IP="$1"
	if [[ "$IP" =~ ^10.*|^169.*|^172.*|^192.168.* ]] ; then
		# private ipv4
        returns false
	elif [[ "$IP" =~ ^fd*|^fe80:* ]] ; then
		# private ipv6
        returns false
	else
		# public ip
        returns true
	fi
}

#=================================================
# EXPERIMENTAL HELPERS
#=================================================

#=================================================
# FUTURE OFFICIAL HELPERS
#=================================================
