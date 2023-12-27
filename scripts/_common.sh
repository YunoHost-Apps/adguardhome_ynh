#!/bin/bash

#=================================================
# COMMON VARIABLES
#=================================================

#=================================================
# PERSONAL HELPERS
#=================================================

is_public_ip(){
# used to discriminate publics IPs over privates IPs

	local IP="$1"

	if [[ "$IP" =~ ^10.*|^169.*|^172.*|^192.168.* ]] ; then
		# private ipv4, so false
        return 1
	elif [[ "$IP" =~ ^fc*|^fd*|^fe80:* ]] ; then
		# private ipv6, so false
        return 1
	else
		# public ip, so true
        return 0
	fi
}

#=================================================
# EXPERIMENTAL HELPERS
#=================================================

#=================================================
# FUTURE OFFICIAL HELPERS
#=================================================
