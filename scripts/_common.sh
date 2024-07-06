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

    # remove the 'inet6' and 'inet' from the IP addresses string
    ips="$(echo "$ips" | sed "s/inet6//g ; s/inet//g")"

    # for each IP
    for ip in $ips; do
        # check if the so-called IP really is one
        if ynh_validate_ip4 --ip_address="$ip" || ynh_validate_ip6 --ip_address="$ip"; then
            # we can't use IPv6 LLA for DNS: https://github.com/AdguardTeam/AdGuardHome/issues/2926#issuecomment-1284489380
            # if we try to bind port 53 on a fe80:: address, AGH crashes
            if ! [[ "$ip" =~ ^fe80:* ]]; then
                # don't process if the IP is public and the port 53 closed
                if is_public_ip "$ip" && [ "$expose_port_53" == "false" ]; then
                    # don't add this IP (do nothing)
                    :
                else
                    # add this IP and a space as IP delimiter
                    processed_ips+="$ip "
                fi
            fi
        fi
    done

    echo "${processed_ips:-}"
}

update_agh_ip_config(){
# used to update the IP adresses in the AGHconfig file

if [ -z "${ipv4_addr:-}" ] && [ -z "${ipv6_addr:-}" ]; then
    if [ -z "${expose_port_53:-}" ] || [[ "$expose_port_53" = "false" ]]; then
        # if the variable 'expose_port_53' is unset or false, maybe the machine
        # doesn't have any private IP? User guidance is relevant...
        ynh_die --message="At leat one IP adress is required to run AdGuard Home. Please report this error. 
        (You can refer to [the troubleshooting page](https://github.com/YunoHost-Apps/adguardhome_ynh/blob/master/doc/TROUBLESHOOTING.md) to get help)"
    else
        # else, do not show the message under parenthesis, because it's irrelevant
        ynh_die --message="At leat one IP adress is required to run AdGuard Home. Please report this error."
    fi
fi

# use python's yaml and open the AGH config file
python3 -c "import yaml
with open(\"$install_dir/AdGuardHome.yaml\", 'r') as file:
	conf_file = yaml.safe_load(file)

# reset the IPs in the AGH config file
conf_file[\"dns\"][\"bind_hosts\"] = []

# add each IPv4 and IPv6 in the AGH config file
for ip in \"$ipv4_addr\".split():
    conf_file[\"dns\"][\"bind_hosts\"].append(ip)
for ip in \"$ipv6_addr\".split():
    conf_file[\"dns\"][\"bind_hosts\"].append(ip)

# save the config file
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
