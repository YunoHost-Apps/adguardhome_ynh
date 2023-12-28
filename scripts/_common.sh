#!/bin/bash

#=================================================
# COMMON VARIABLES
#=================================================

#=================================================
# PERSONAL HELPERS
#=================================================

get_network_interface(){
# get the network interface name for IPv4 and IPv6

    local IPvx="$1"

    # note: echo the IP route command to prevent a crash if the server doesn't have any IPv4/6
    if [[ "$IPvx" = "4" ]]; then
        # shellcheck disable=SC2005
        echo "$(echo "$(ip -4 route get 1.2.3.4 2> /dev/null)" | head -n1 | grep -oP '(?<=dev )\w+' || true)"
    else
        # shellcheck disable=SC2005 
        echo "$(echo "$(ip -6 route get ::1.2.3.4 2> /dev/null)" | head -n1 | grep -oP '(?<=dev )\w+' || true)"
    fi
}

configure_network_interface_dnsmasq(){
# used to put the network interface in a dedicated dnsmasq config

    local ipv4_interface="$1"
    local ipv6_interface="$2"

    if [ -z "$ipv4_interface" ] && [ -z "$ipv6_interface" ]; then
            ynh_die --message="Impossible to find the main network interface, please report this issue."
    elif [ "$ipv4_interface" != "$ipv6_interface" ]; then
            if [ -z "$ipv4_interface" ]; then
                    echo -e "bind-interfaces\nexcept-interface=$ipv6_interface" > "/etc/dnsmasq.d/$app"
            elif [ -z "$ipv6_interface" ]; then
                    echo -e "bind-interfaces\nexcept-interface=$ipv4_interface" > "/etc/dnsmasq.d/$app"
            else
                    echo -e "bind-interfaces\nexcept-interface=$ipv4_interface, $ipv6_interface" > "/etc/dnsmasq.d/$app"
            fi
    else
            echo -e "bind-interfaces\nexcept-interface=$ipv4_interface" > "/etc/dnsmasq.d/$app"
    fi

    systemctl restart dnsmasq

    ynh_store_file_checksum --file="/etc/dnsmasq.d/$app"
}

is_public_ip(){
# used to discriminate publics IPs over privates IPs
# private IPv4 start with: 10.; 169.; 172. or 192.168.
# private IPv6 start with: fc; fd or fe80:

	local IP="$1"

	if [[ "$IP" =~ ^10.*|^169.*|^172.*|^192.168.* ]] ; then
		# private IPv4, so false
        return 1
	elif [[ "$IP" =~ ^fc*|^fd*|^fe80:* ]] ; then
		# private IPv6, so false
        return 1
	else
		# public IP, so true
        return 0
	fi
}

process_ips(){
# used to process the IPs to put in the AGH's config file

    local ips="$1"
    local processed_ips=""

    for i in $(seq "$(echo "$ips" | wc -w)" -1 1); do
            ip=$(echo "$ips" | awk "{print \$$i}")
            # check if the so-called IP really is one
            if ynh_validate_ip4 --ip_address="$ip" || ynh_validate_ip6 --ip_address="$ip"; then
                # don't process if the IP is public and the port 53 closed
                if is_public_ip "$ip" && [ "$open_port_53" == "false" ] ; then
                    exit 1
                else
                    if [[ "${is_install:-}" = true ]]; then
                    # to get a dash before each IP
                        processed_ips+=$'- 192.168.42.80\n'
                    else
                        processed_ips+=$'$ip\n'
                    fi
                fi
            fi
    done

    echo "${processed_ips:-}"
}

update_agh_config(){
# used to update the IP adresses in the AGHconfig file

python3 -c "import yaml
with open(\"$install_dir/AdGuardHome.yaml\", 'r') as file:
	conf_file = yaml.safe_load(file)

need_file_update = False

conf_file[\"dns\"][\"bind_hosts\"] = []
if \"$ipv4_addr\":
    conf_file[\"dns\"][\"bind_hosts\"].append(\"$ipv4_addr\")
    need_file_update = True
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
