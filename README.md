<!--
N.B.: This README was automatically generated by <https://github.com/YunoHost/apps/tree/master/tools/readme_generator>
It shall NOT be edited by hand.
-->

# AdGuard Home for YunoHost

[![Integration level](https://apps.yunohost.org/badge/integration/adguardhome)](https://ci-apps.yunohost.org/ci/apps/adguardhome/)
![Working status](https://apps.yunohost.org/badge/state/adguardhome)
![Maintenance status](https://apps.yunohost.org/badge/maintained/adguardhome)

[![Install AdGuard Home with YunoHost](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=adguardhome)

*[Read this README in other languages.](./ALL_README.md)*

> *This package allows you to install AdGuard Home quickly and simply on a YunoHost server.*  
> *If you don't have YunoHost, please consult [the guide](https://yunohost.org/install) to learn how to install it.*

## Overview

AdGuard Home is a network-wide software for blocking ads & tracking. After you set it up, it'll cover ALL your home devices, and you don't need any client-side software for that.

It operates as a DNS server that re-routes tracking domains to a "black hole", thus preventing your devices from connecting to those servers. It's based on software we use for our public AdGuard DNS servers -- both share a lot of common code.

**Important note**: This AdGuard Home package needs to disable Dnsmasq on the main network interface to allow AdGuard Home to listen DNS resquest using it.  
However, Dnsmasq is not disabled and will continue to function as the *localhost DNS server*.


**Shipped version:** 0.107.56~ynh1

## Screenshots

![Screenshot of AdGuard Home](./doc/screenshots/screenshot.jpg)

## Documentation and resources

- Official app website: <https://adguard.com/adguard-home.html>
- Official user documentation: <https://kb.adguard.com/en>
- Official admin documentation: <https://github.com/AdguardTeam/AdGuardHome/wiki>
- Upstream app code repository: <https://github.com/AdguardTeam/AdGuardHome>
- YunoHost Store: <https://apps.yunohost.org/app/adguardhome>
- Report a bug: <https://github.com/YunoHost-Apps/adguardhome_ynh/issues>

## Developer info

Please send your pull request to the [`testing` branch](https://github.com/YunoHost-Apps/adguardhome_ynh/tree/testing).

To try the `testing` branch, please proceed like that:

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/adguardhome_ynh/tree/testing --debug
or
sudo yunohost app upgrade adguardhome -u https://github.com/YunoHost-Apps/adguardhome_ynh/tree/testing --debug
```

**More info regarding app packaging:** <https://yunohost.org/packaging_apps>
