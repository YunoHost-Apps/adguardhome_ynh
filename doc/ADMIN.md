# Admin notebook of YunoHost's AdGuard Home

You want to be sure to understand the config settings? You're at the right place! ^w^

## Bind to public IP addresses?

This setting is **disabled** by default.

When disabled:

- YunoHost **will not** check if the port 53 is accessible on Internet and warns you if not (so no irrelevant warning)
- Public IP adresses **will not** be added to the AdGuard Home configuration

When enabled:

- YunoHost **will** check if the port 53 is accessible on Internet and warns you if not
- ⚠️ You need to **manually open port 53** of your router if you self-host at home!
- Server's public IP adresses **will** be added to the AdGuard Home configuration, so AGH will be able to bind to them and will expose directly the port 53 to the Internet

You need to know that if you expose your DNS server to Internet, anyone who knows your server's IP can make a DNS request to it. It *may be used* to perform [amplification attacks](https://en.wikipedia.org/wiki/Denial-of-service_attack#Amplification)!  
This risk is greatly minimized by the rate limiting setting, which is set to 20 requests per second per client by default:  
`Settings → DNS settings → DNS server configuration → Rate limit`

You can completely or almost completely reduce the risk of unauthorized use with the help of the [Allowlist section](#allowlist) further down in this documentation.

To use AdGuard Home in your home network if your self-hosting at home, you **don't need** to activate this setting.  
You simply have to use the private IP adress of your server (like `192.168.0.1` or so) as DNS IP for your IT devices at home.  
The right IP addresses to use are shown at the top of the "Setup Guide" page of your AdGuard Home instance.

If you would expose the port 53 on Internet, you'll be able to use the public IP of your server (the same as in your domain name DNS settings) on any device outside your home network.

**Warning:** you should not have public IPs in the config file if the port 53 is **not exposed** on Internet (else: AGH crashes)  
**Please note:** They should be automatically removed when upgrading this package or when modifiying this port 53 exposure setting, but it's in the docs just in case.  
You can remove them in your config file `/var/www/adguardhome/AdGuardHome.yaml` in the `dns: bind_hosts:` section.  
Any IP **that doesn't start** with the folowing are public ones:

- `10.`
- `169.`
- `172.`
- `192.168.`
- `fcxx:` (where the `x` can be any hexadecimal character)
- `fdxx:` (where the `x` can be any hexadecimal character)

**Warning:** IPv6 starting with `fe80:` (IPv6 LLA) CAN'T be used for DNS purposes, if you try to put one in the AGH config, it won't work and crash!

So, any other IP should be a public one.

Restart AdGuard Home after applying the needed edits: `yunohost service restart adguardhome`

## Enable DNS over HTTP, DNS over TLS and DNS over QUIC?

This setting is **disabled** by default.

If enabled, you need to know that anyone who knows your AdGuard Home domain-name can make a DNS request to it. It may be used to perform [amplification attacks](https://en.wikipedia.org/wiki/Denial-of-service_attack#Amplification)!

It's really important to use the configuration panel included in the YunoHost Webadmin interface to activate or deactivate this setting, and **NOT** the built-in setting in the AdGuardHome interface.  
This is because YunoHost needs to perform actions such as automatically opening or closing the server's ports and refresh the IP to provide to AdGuard Home, which cannot be done without going through the configuration panel.

If you host your machine at home, for using DoT or DoQ, you have to open the following ports on your router by yourself:

- `__PORT_DNS_OVER_TLS__` in TCP & UDP (for DNS over TLS)
- `__PORT_DNS_OVER_QUIC__` in UDP (for DNS over QUIC)

Then you can use the following adresses as a DoH, DoT or DoQ DNS server for your devices:

- DNS over HTTP: `https://__DOMAIN__/dns-query` (or `https://__DOMAIN__/dns-query/your-client-id` with a [ClientID](https://github.com/AdguardTeam/AdGuardHome/wiki/Clients#clientid))
- DNS over TLS: `tls://__DOMAIN__:__PORT_DNS_OVER_TLS__`
- DNS over QUIC: `quic://__DOMAIN__:__PORT_DNS_OVER_QUIC__`

## Allowlist

If your port 53 is exposed on Internet, you can secure your AdGuard Home server using allowlist to prevent unauthorized use.

We've had YunoHost users surprised to see their instance receiving tens of thousands of unknown requests per day, this was due to the public exposure of port 53 on Internet and the lack of securisation of their instance.

In this allowlist, you can put [ClientID](https://github.com/AdguardTeam/AdGuardHome/wiki/Clients#clientid)s in place of IP addresses for the devices that uses DNS over HTTP.  
But since since YunoHost can't handle wildcard domain names, you can't use this ClientID functionnality with DNS over TLS and DNS over QUIC, sorry about that.
**Note:** to use DNS over HTTP with a ClientID, you have to use the following URL: `https://__DOMAIN__/dns-query/your-client-id`

The allowlist setting is located in your AdGuard Home interface:  
`Settings → DNS settings → Access settings → Allowed clients`

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

Then you can add some authorized public IP addresses.

For example, to authorize the IPv4 of your home internet connexion, open <https://ip.yunohost.org/> and paste the showed IP in the allowlist.

If your ISP has assigned you an IPv6 range (ex. `2a01:d34d:b33f:1312::/64`), you can add it so that any device on your home network using an address in this range will be authorized.

You can add any public IP you know you'll use.

If you want to use your AGH instance on your smartphone without using the [ClientID](https://github.com/AdguardTeam/AdGuardHome/wiki/Clients#clientid) feature (only availabe with DoH, check the 'Apps' documentation to find out how to use it on your phone), it gets more complex: you have to allow the IP ranges of your mobile operator.  
It's not perfect but it still drastically reduces the chances of unauthorized use, while allowing you to use it with your smartphone.  
**Note:** in case of connection on non authorized wifi networks with your smartphone, you will not be able to use your AdGuard Home instance.

Using the connexion to allow, go to <https://ip.guide/> and click on "Autonomous Systems".  
**Note:** If you're using an iPhone, make sure that the ["Limit IP tracking" or "iCloud private relay" settings](https://support.apple.com/guide/iphone/iph499d287c2/ios) are disabled (otherwise you must authorize Akamai IP addresses using the same method).  
You can now copy all the IP adresses in the "routes" section, remove all quotation marks, commas and spaces, but keep one IP per line, then paste the result into your allowlist.  
It should look like the list in the previous section.

You can use the following command to automatically give you a ready-to-use list:

```bash
curl -sL ip.guide/AS"$(curl -sL ip.guide | jq -s ".[].network.autonomous_system.asn")" | jq -s ".[].routes" | sed "/v.*:/d;/\],/d" | tr -d " {]\",}"
```

The command asks your IP address to ip.guide, which returns the "Autonomous System" number (ASN) of your access provider, then the commands asks its IP ranges, then display it on your screen.

**Note:** maybe you'll need to do this step multiple times, as some Internet provider have multiple ASN numbers. So if one day your AdGuard Home refuses to reply, it might be because of this.
