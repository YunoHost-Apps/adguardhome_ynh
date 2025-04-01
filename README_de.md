<!--
N.B.: Diese README wurde automatisch von <https://github.com/YunoHost/apps/tree/master/tools/readme_generator> generiert.
Sie darf NICHT von Hand bearbeitet werden.
-->

# AdGuard Home für YunoHost

[![Integrations-Level](https://apps.yunohost.org/badge/integration/adguardhome)](https://ci-apps.yunohost.org/ci/apps/adguardhome/)
![Funktionsstatus](https://apps.yunohost.org/badge/state/adguardhome)
![Wartungsstatus](https://apps.yunohost.org/badge/maintained/adguardhome)

[![AdGuard Home mit YunoHost installieren](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=adguardhome)

*[Dieses README in anderen Sprachen lesen.](./ALL_README.md)*

> *Mit diesem Paket können Sie AdGuard Home schnell und einfach auf einem YunoHost-Server installieren.*  
> *Wenn Sie YunoHost nicht haben, lesen Sie bitte [die Anleitung](https://yunohost.org/install), um zu erfahren, wie Sie es installieren.*

## Übersicht

AdGuard Home is a network-wide software for blocking ads & tracking. After you set it up, it'll cover ALL your home devices, and you don't need any client-side software for that.

It operates as a DNS server that re-routes tracking domains to a "black hole", thus preventing your devices from connecting to those servers. It's based on software we use for our public AdGuard DNS servers -- both share a lot of common code.

**Important note**: This AdGuard Home package needs to disable Dnsmasq on the main network interface to allow AdGuard Home to listen DNS resquest using it.  
However, Dnsmasq is not disabled and will continue to function as the *localhost DNS server*.


**Ausgelieferte Version:** 0.107.59~ynh1

## Bildschirmfotos

![Bildschirmfotos von AdGuard Home](./doc/screenshots/screenshot.jpg)

## Dokumentation und Ressourcen

- Offizielle Website der App: <https://adguard.com/adguard-home.html>
- Offizielle Benutzerdokumentation: <https://kb.adguard.com/en>
- Offizielle Verwaltungsdokumentation: <https://github.com/AdguardTeam/AdGuardHome/wiki>
- Upstream App Repository: <https://github.com/AdguardTeam/AdGuardHome>
- YunoHost-Shop: <https://apps.yunohost.org/app/adguardhome>
- Einen Fehler melden: <https://github.com/YunoHost-Apps/adguardhome_ynh/issues>

## Entwicklerinformationen

Bitte senden Sie Ihren Pull-Request an den [`testing` branch](https://github.com/YunoHost-Apps/adguardhome_ynh/tree/testing).

Um den `testing` Branch auszuprobieren, gehen Sie bitte wie folgt vor:

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/adguardhome_ynh/tree/testing --debug
oder
sudo yunohost app upgrade adguardhome -u https://github.com/YunoHost-Apps/adguardhome_ynh/tree/testing --debug
```

**Weitere Informationen zur App-Paketierung:** <https://yunohost.org/packaging_apps>
