# Apps documentation

## Android

To be completed by someone who uses an Android app

## Apple devices

### AdGuard Home Remote

[AdGuard Home Remote](https://apps.apple.com/app/id1543143740) by [RocketScience IT](https://rocketscience-it.nl/) is compatible with Mac, iPhone, iPad and Watch.  
It is free with an in-app purchase of 6€ or US$5 to unlock some features. No ads, no tracking.

This app is for monitoring or configuring your AGH instance, not to use your AGH as a DNS server on your Apple device.

You can easilly configure this app:

- Add Instance
- Choose a display name
- Write your AdGuard Home domain name, here `adguard.example.com` as an example
- Pick `https`, this will automatically fill the port field with `443`
- Enter your AdGuard Home credentials in the "Authentication" fields
- Test the connection, if a green check is showed up, you're alright

[Your configuration should look like this.](https://raw.githubusercontent.com/YunoHost-Apps/adguardhome_ynh/master/doc/screenshots/apps/AGH-remote.PNG)

### Secure DNS profile creator

To use your AGH instance as a DNS server on your Apple device, you can use [Secure DNS profile creator](https://dns.notjakob.com/index.html).

To do so, you first need to activate the DNS over HTTP/TLS/QUIC functionnality using the YunoHost Webadmin.  
If you're reading this you should already be in the right page: just click the "AdGuard Home configuration" option at the top of this text, toggle on "Activate DNS over HTTP/TLS/QUIC?" then "Save".  
Else, open The YunoHost Webadmin and follow this path: `Applications -> AdGuard Home -> AdGuard Home configuration`

Now, click the "Secure DNS profile creator" link above and fill the input fields.

- Name of DNS provider: put an arbitrary name here, for example "AGH"
- Select either DNS-over-HTTPS (DoH) or DNS-over-TLS (DoT)
  - If you don't know which one to choose, you can read the "DNS-over-HTTPS or DNS-over-TLS?" section of [the tool's homepage(https://dns.notjakob.com/index.html)
  - If you want to use the [ClientID](https://github.com/AdguardTeam/AdGuardHome/wiki/Clients#clientid) option, you can't chose DoT since YunoHost can't handle wildcard domain names, so mandatory DoH for you
- For the primary DNS settings, you have to put trustworthy servers IPs, for example [the FDN ones](https://www.fdn.fr/actions/dns/)
- And finally the setting for your AdGuard Home server URL:
  - If you selected DoH: put your domain name between `https://` and `/dns-query`: `https://__DOMAIN__/dns-query`
  - If you selected DoT: put your bare domain name: `__DOMAIN__`

You can toggle the "Advanced" button to exclude the created profile to be used when you're on your domestic WiFi network or some other settings.

[Your configuration should look like this.](https://raw.githubusercontent.com/YunoHost-Apps/adguardhome_ynh/master/doc/screenshots/apps/DNS-profile-creator.jpeg)

Now, click the "Add to profile" button to generate the profile file, validate the "Configuration successfully added to profile." message showed on screen, then click the "Download Profile" button and accept the download.

And finaly, open the system settings, click the "Downloaded profile" and install it bu entering your device password and tapping the final "Install" button.

Your device should now use your AdGuard Home instance as its DNS server. Congrats!

Installed DNS profiles can be managed in the Settings under "General" then "VPN and Device Management".
