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

process_ips(){
# used to process the IPs to put them in the AGH's config file

    local ips="$1"

    for i in $(seq "$(echo "$ips" | wc -w)" -1 1); do
            ip=$(echo "$ips" | awk "{print \$$i}")
            if ynh_validate_ip4 --ip_address="$ip"; then
                if is_public_ip "$ip" && [ "$open_port_53" == "false" ] ; then
                    # if the IP is public and the user doesn't want to expose port 53, skip it
                    break
                else
                    ips="- $ip"
                    break
                fi
            fi
    done

    echo "$ips"
}

update_config(){
# used to update the IP adresses in the AGHconfig file

# Reset the bind_hosts if the current ip is 0.0.0.0
python3 -c "import yaml
with open(\"$install_dir/AdGuardHome.yaml\", 'r') as file:
	conf_file = yaml.safe_load(file)

need_file_update = False

if \"0.0.0.0\" in conf_file[\"dns\"][\"bind_hosts\"]:
	conf_file[\"dns\"][\"bind_hosts\"] = []
	if \"$ipv4_addr\":
		conf_file[\"dns\"][\"bind_hosts\"].append(\"$ipv4_addr\")
	if \"$ipv6_addr\":
		conf_file[\"dns\"][\"bind_hosts\"].append(\"$ipv6_addr\")
	need_file_update = True
	
if need_file_update:
	with open(\"$install_dir/AdGuardHome.yaml\", 'w') as file:
		yaml.dump(conf_file, file)
"
}

#=================================================
# EXPERIMENTAL HELPERS
#=================================================

#=================================================
# FUTURE OFFICIAL HELPERS
#=================================================
