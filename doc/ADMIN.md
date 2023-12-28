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
Please note: They should be automatically removed when upgrading this package or when modifiying this port 53 exposure setting, but it's in the docs just in case.
You can remove them in your config file `/var/www/adguardhome/AdGuardHome.yaml` in the `dns: bind_hosts:` section.
Any IP that doesn't start with the folowing are public ones:

- `10.`
- `169.`
- `172.`
- `192.168.`
- `fcxx:` (where the `x` can be any hexadecimal character)
- `fdxx:` (where the `x` can be any hexadecimal character)
- `fe80:`

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
