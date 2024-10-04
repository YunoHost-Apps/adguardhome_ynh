<!--
NB: Deze README is automatisch gegenereerd door <https://github.com/YunoHost/apps/tree/master/tools/readme_generator>
Hij mag NIET handmatig aangepast worden.
-->

# AdGuard Home voor Yunohost

[![Integratieniveau](https://dash.yunohost.org/integration/adguardhome.svg)](https://ci-apps.yunohost.org/ci/apps/adguardhome/) ![Mate van functioneren](https://ci-apps.yunohost.org/ci/badges/adguardhome.status.svg) ![Onderhoudsstatus](https://ci-apps.yunohost.org/ci/badges/adguardhome.maintain.svg)

[![AdGuard Home met Yunohost installeren](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=adguardhome)

*[Deze README in een andere taal lezen.](./ALL_README.md)*

> *Met dit pakket kun je AdGuard Home snel en eenvoudig op een YunoHost-server installeren.*  
> *Als je nog geen YunoHost hebt, lees dan [de installatiehandleiding](https://yunohost.org/install), om te zien hoe je 'm installeert.*

## Overzicht

AdGuard Home is a network-wide software for blocking ads & tracking. After you set it up, it'll cover ALL your home devices, and you don't need any client-side software for that.

It operates as a DNS server that re-routes tracking domains to a "black hole", thus preventing your devices from connecting to those servers. It's based on software we use for our public AdGuard DNS servers -- both share a lot of common code.

**Important note**: This AdGuard Home package needs to disable Dnsmasq on the main network interface to allow AdGuard Home to listen DNS resquest using it.  
However, Dnsmasq is not disabled and will continue to function as the *localhost DNS server*.


**Geleverde versie:** 0.107.53~ynh1

## Schermafdrukken

![Schermafdrukken van AdGuard Home](./doc/screenshots/screenshot.jpg)

## Documentatie en bronnen

- Officiele website van de app: <https://adguard.com/adguard-home.html>
- Officiele gebruikersdocumentatie: <https://kb.adguard.com/en>
- Officiele beheerdersdocumentatie: <https://github.com/AdguardTeam/AdGuardHome/wiki>
- Upstream app codedepot: <https://github.com/AdguardTeam/AdGuardHome>
- YunoHost-store: <https://apps.yunohost.org/app/adguardhome>
- Meld een bug: <https://github.com/YunoHost-Apps/adguardhome_ynh/issues>

## Ontwikkelaarsinformatie

Stuur je pull request alsjeblieft naar de [`testing`-branch](https://github.com/YunoHost-Apps/adguardhome_ynh/tree/testing).

Om de `testing`-branch uit te proberen, ga als volgt te werk:

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/adguardhome_ynh/tree/testing --debug
of
sudo yunohost app upgrade adguardhome -u https://github.com/YunoHost-Apps/adguardhome_ynh/tree/testing --debug
```

**Verdere informatie over app-packaging:** <https://yunohost.org/packaging_apps>
