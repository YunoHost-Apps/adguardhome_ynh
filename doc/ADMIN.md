# Admin notebook of YunoHost's AdGuard Home

You want to be sure to understand the config settings? You're at the right place! ^w^

## Expose port 53 to the Internet?

This setting is **disabled** by default.

You need to know that anyone who knows your server's IP can make a DNS request to it. It may be used to perform [amplification attacks](https://en.wikipedia.org/wiki/Denial-of-service_attack#Amplification)!

To use AdGuard Home in your home network, you don't need to activate this setting.  
You simply have to use the private IP adress of your server (like `192.168.0.1` or so) as DNS IP for your IT hardware at home.  
The right IP to use are shown in the "Setup Guide" page of your AdGuard Home instance.

If you would expose the port 53 on Internet, you'll be able to use the public IP of your server (the same as in your domain name DNS settings) on any device outside your home network.

**Warning:** you should not have public IPs of the config file if the port 53 is **not exposed** on Internet (else: AGH crashes)  
**Please note:** They should be automatically removed when upgrading this package or when modifiying this port 53 exposure setting, but it's in the docs just in case.
You can remove them in your config file `/var/www/adguardhome/AdGuardHome.yaml` in the `dns: bind_hosts:` section.
Any IP that doesn't start with the folowing are public ones:

- `10.`
- `169.`
- `172.`
- `192.168.`
- `fcxx:` (where the `x` can be any hexadecimal character)
- `fdxx:` (where the `x` can be any hexadecimal character)

**Warning:** IPv6 starting with `fe80:` (IPv6 LLA) can't be used for DNS purposes, if you try to put one in the AGH config, it won't work.

So, any other IP should be a public one.

Restart AdGuard Home after applying the needed edits: `yunohost service restart adguardhome`

## Enable DNS over HTTP and DNS over QUIC?

This setting is **disabled** by default.

You need to know that anyone who knows your AdGuard Home domain-name can make a DNS request to it. It may be used to perform [amplification attacks](https://en.wikipedia.org/wiki/Denial-of-service_attack#Amplification)!

It's really important to use the configuration panel to deactivate this setting, and **NOT** the built-in setting in the AdGuardHome interface.  
This is because YunoHost needs to perform actions such as automatically opening or closing the server's ports and refresh the IP to provide to AdGuard Home, which cannot be done without going through the configuration panel.

If you host your machine at home, for using DoH or DoQ, you have to open the following ports on your router:

- `853` in TCP & UDP (for DNS over HTTP)
- `784` in UDP (for DNS over QUIC)

Then you can use `https://adguard.example.com/dns-query` (where `adguard.example.com` is the domain-name associated to your AdGuard Home) as a DoH or DoQ DNS server for your devices. ^w^

## Allowlist

If your port 53 is exposed on Internet, you can secure your AdGuard Home server using allowlist to prevent unauthorized use.

We've had YunoHost users surprised to see their instance receiving tens of thousands of requests per day, this was due to the public exposure of port 53 on Internet and the lack of securisation of their instance.

The allowlist setting is located in your AdGuard Home interface:  
Settings → DNS settings → Access settings → Allowed clients

### Local network

If you selfhost at home, you can simply paste this in your allowlist (it will allow any kind of private IP):

```text
10.0.0.0/8
172.16.0.0/12
192.168.0.0/16
fc00::/7
fe80::/16
```

**Note:** The slash `/` and the following number after the IP adresses represents the network mask, it's called the CIDR notation. If you want to learn about the CIDR notation, [you can read this article](https://whatismyipaddress.com/cidr).

### Authorize some public IP addresses

Then you need to add the authorized public IP addresses.

For example, to authorize the IPv4 of your home internet connexion, open <https://ip.yunohost.org/> and paste the showed IP in the allowlist.

If your ISP has assigned you an IPv6 range (ex. `2a01:d34d:b33f:1312::/64`), you can add it so that any device on your home network using an address in this range will be authorized.

You can add any public IP you know you'll use.

If you want to use your AGH instance on your smartphone, it gets more complex: you have to allow the IP ranges of your mobile operator.  
It's not perfect but it still drastically reduces the chances of unauthorized use, while allowing you to use it with your smartphone.  
**Note:** in case of connection on not authorized wifi networks with your smartphone, you will not be able to use your AdGuard Home instance.

Using the connexion to allow, go to <https://ip.guide/> and click on "Autonomous Systems".  
**Note:** If you're using an iPhone, make sure that the ["Limit IP tracking" setting](https://support.apple.com/guide/iphone/iph499d287c2/ios) is disabled (otherwise you must authorize Akamai IP addresses using the same method).  
You can now copy all the IP adresses in the "routes" section, remove all quotation marks, commas and spaces, but keep one IP per line, then paste the result into your allowlist.  
It should look like the list in the previous section.

You can use the following command to automatically give you a ready-to-use list:

```bash
curl -sL ip.guide/AS"$(curl -sL ip.guide | jq -s --indent 1 ".[].network.autonomous_system.asn")" | jq -s -j --indent 1 ".[].routes" | sed "/v.*:/d;/\],/d" | tr -d " [{]\",}"
```

The command asks your IP address to ip.guide, which returns the "Autonomous System" number, then the commands asks the IP ranges, then display it on your screen.

**Note:** maybe you'll need to do this step multiple times, as some Internet provider have multiple ASN numbers. So if one day your AdGuard Home refuses to reply, it might be because of this.
