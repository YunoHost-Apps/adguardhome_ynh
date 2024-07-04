<!--
Ohart ongi: README hau automatikoki sortu da <https://github.com/YunoHost/apps/tree/master/tools/readme_generator>ri esker
EZ editatu eskuz.
-->

# AdGuard Home YunoHost-erako

[![Integrazio maila](https://dash.yunohost.org/integration/adguardhome.svg)](https://ci-apps.yunohost.org/ci/apps/adguardhome/) ![Funtzionamendu egoera](https://ci-apps.yunohost.org/ci/badges/adguardhome.status.svg) ![Mantentze egoera](https://ci-apps.yunohost.org/ci/badges/adguardhome.maintain.svg)

[![Instalatu AdGuard Home YunoHost-ekin](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=adguardhome)

*[Irakurri README hau beste hizkuntzatan.](./ALL_README.md)*

> *Pakete honek AdGuard Home YunoHost zerbitzari batean azkar eta zailtasunik gabe instalatzea ahalbidetzen dizu.*  
> *YunoHost ez baduzu, kontsultatu [gida](https://yunohost.org/install) nola instalatu ikasteko.*

## Aurreikuspena

AdGuard Home is a network-wide software for blocking ads & tracking. After you set it up, it'll cover ALL your home devices, and you don't need any client-side software for that.

It operates as a DNS server that re-routes tracking domains to a "black hole", thus preventing your devices from connecting to those servers. It's based on software we use for our public AdGuard DNS servers -- both share a lot of common code.

**Important note**: This AdGuard Home package needs to disable Dnsmasq on the main network interface to allow AdGuard Home to listen DNS resquest using it.  
However, Dnsmasq is not disabled and will continue to function as the *localhost DNS server*.


**Paketatutako bertsioa:** 0.107.51~ynh1

## Pantaila-argazkiak

![AdGuard Home(r)en pantaila-argazkia](./doc/screenshots/demo.gif)

## Dokumentazioa eta baliabideak

- Aplikazioaren webgune ofiziala: <https://adguard.com/adguard-home.html>
- Erabiltzaileen dokumentazio ofiziala: <https://kb.adguard.com/en>
- Administratzaileen dokumentazio ofiziala: <https://github.com/AdguardTeam/AdGuardHome/wiki>
- Jatorrizko aplikazioaren kode-gordailua: <https://github.com/AdguardTeam/AdGuardHome>
- YunoHost Denda: <https://apps.yunohost.org/app/adguardhome>
- Eman errore baten berri: <https://github.com/YunoHost-Apps/adguardhome_ynh/issues>

## Garatzaileentzako informazioa

Bidali `pull request`a [`testing` abarrera](https://github.com/YunoHost-Apps/adguardhome_ynh/tree/testing).

`testing` abarra probatzeko, ondorengoa egin:

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/adguardhome_ynh/tree/testing --debug
edo
sudo yunohost app upgrade adguardhome -u https://github.com/YunoHost-Apps/adguardhome_ynh/tree/testing --debug
```

**Informazio gehiago aplikazioaren paketatzeari buruz:** <https://yunohost.org/packaging_apps>
