# Apps documentation

## Preamble

To use the DNS-over-HTTPS/TLS/QUIC functionality, you need to enable the "Enable DNS-over-HTTPS/TLS/QUIC?" option in your YunoHost admin panel, in the AdGuard Home app page.

If you're reading this using the YunoHost interface, you should already be in the right page: just click on the [AdGuard Home configuration](#/apps/__APP__/main) option at the top of this text, toggle on "Activate DNS over HTTP/TLS/QUIC?" then "Save".
Else, open The YunoHost Webadmin and follow this path: `Applications → AdGuard Home → AdGuard Home configuration`.

From the command line interface: `yunohost app config set __APP__ main.options.dns_over_https -v 1`

## Android

### Built-in Private DNS

Android offers a Private DNS feature starting its version 9 and above.
This Private DNS setting will only work for DNS-over-TLS with Adguard Home, since DNS-over-HTTPS is limited to a couple of hardcoded providers.
Make sure to have followed the instructions of the Preamble above.

⚠️ Note: You can't use the [ClientID](https://github.com/AdguardTeam/AdGuardHome/wiki/Clients#clientid) option to whitelist your client with DNS-over-TLS since YunoHost can't handle wildcard domain names.

Android being available under various flavours depending on your phone manufacturer, the location of that setting can vary.
It is generally along the lines of `Settings → Connections → More connection parameters → Private DNS`.
There, select "Hostname of the private DNS provider" and enter your Adguard Home's domain: `__DOMAIN__` (no protocol, no slash, only the domain).

### Intra

Intra by [Jigsaw Operations LLC](https://jigsaw.google.com) can be downloaded from [Google Play](https://play.google.com/store/apps/details?id=app.intra) or [F-Droid](https://f-droid.org/packages/app.intra/).
This free app can connect you to your Adguard Home server through DNS-over-HTTPS.

To configure it, once installed:
- Open its side menu `≡ → Parameters → Select a DNS over HTTPS menu`
- Choose `Custom URL server` and enter your server address:
  - `https://__DOMAIN__/dns-query`
  - If you want to track your device requests and use some per-device rules, replace [ClientID](https://github.com/AdguardTeam/AdGuardHome/wiki/Clients#clientid) in the following URL: `https://__DOMAIN__/dns-query/ClientID`,
    - Don't forget to add the exact same ClientID to your Allowlist in the `Settings → DNS settings → Access settings → Allowed clients`
- Go back to the main screen of the app, and enable the app with the top-right switch.

Technically, it creates a local VPN connection to enforce the use of your DNS server: a 🔑 icon will appear at the top of your screen once it is enabled.

## Apple devices

### AdGuard Home Remote

[AdGuard Home Remote](https://apps.apple.com/app/id1543143740) by [RocketScience IT](https://rocketscience-it.nl/) is compatible with Mac, iPhone, iPad and Watch.  
It is free with an in-app purchase of 6€ or US$5 to unlock some features. No ads, no tracking.

This app is for monitoring or configuring your AGH instance, not to use your AGH as a DNS server on your Apple device. See the section bellow for that!

You can easily configure this app:

- Add Instance
- Choose a display name
- Write your AdGuard Home domain name, here `adguard.example.com` as an example
- Pick `https`, this will automatically fill the port field with `443`
- Enter your AdGuard Home credentials in the "Authentication" fields
- Test the connection, if a green check is showed up, you're alright

[Your configuration should look like this.](https://raw.githubusercontent.com/YunoHost-Apps/adguardhome_ynh/master/doc/screenshots/apps/AGH-remote.PNG)

### Secure DNS profile

To use your AGH instance as the DNS server on your Apple device, you can generate an Apple 'Secure DNS profile'.  
**Note:** as a more tech-savvy alternative to this tutorial, you can use [Secure DNS profile creator](https://dns.notjakob.com/index.html).

Make sure you have followed the instructions of the Preamble above, then go to the [Setup Guide](https://__DOMAIN____PATH__#guide) page of your AdGuard Home instance, click the "DNS Privacy" option and scroll to the bottom.

- Hostname: keep it that way
- HTTPS port: same, keep it that way
- Protocol: now you have to made a choice: select either DNS-over-HTTPS or DNS-over-TLS
  - ⚠️ If you want to use the [ClientID](https://github.com/AdguardTeam/AdGuardHome/wiki/Clients#clientid) option to whitelist your client, you can't choose DNS-over-TLS since YunoHost can't handle wildcard domain names, so mandatory DNS-over-HTTPS for you
  - If you don't know which one to choose, here's some help:
    - As stated above, pick DNS-over-HTTPS if you want to use the ClientID feature to authenticate your requests
    - Pick DNS-over-HTTPS if you are likely to use networks that filter the DNS-over-TLS port, such as companies, schools, etc.
    - Else, pick DNS-over-TLS because it's a bit faster, as it uses one less [OSI network layer](https://en.wikipedia.org/wiki/OSI_model)
- ClientID: enter a ClientID, `iphone-123456` as an example
  - Don't forget to add the exact same ClientID to your Allowlist in the `Settings → DNS settings → Access settings → Allowed clients`

You can now click on the "Download configuration file" button and accept the download.

Finaly, open the system settings, click on the "Downloaded profile" message and install it by entering your device password and tapping the "Install" button a couple times. Ignore the text indicating that the profile is unsigned.

Your device should now use your AdGuard Home instance as its DNS server. Congrats!

**Note:** Installed DNS profiles can be managed in the Settings under "General" then "VPN and Device Management".
