<!--
N.B.: Aquest README ha estat generat automàticament per <https://github.com/YunoHost/apps/tree/master/tools/readme_generator>
NO s'ha de modificar manualment.
-->

# AdGuard Home per YunoHost

[![Nivell d'integració](https://apps.yunohost.org/badge/integration/adguardhome)](https://ci-apps.yunohost.org/ci/apps/adguardhome/)
![Estat de funcionament](https://apps.yunohost.org/badge/state/adguardhome)
![Estat de manteniment](https://apps.yunohost.org/badge/maintained/adguardhome)

[![Instal·la AdGuard Home amb YunoHosth](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=adguardhome)

*[Llegeix aquest README en altres idiomes.](./ALL_README.md)*

> *Aquest paquet et permet instal·lar AdGuard Home de forma ràpida i senzilla en un servidor YunoHost.*  
> *Si no tens YunoHost, consulta [la guia](https://yunohost.org/install) per saber com instal·lar-lo.*

## Visió general

AdGuard Home is a network-wide software for blocking ads & tracking. After you set it up, it'll cover ALL your home devices, and you don't need any client-side software for that.

It operates as a DNS server that re-routes tracking domains to a "black hole", thus preventing your devices from connecting to those servers. It's based on software we use for our public AdGuard DNS servers -- both share a lot of common code.

**Important note**: This AdGuard Home package needs to disable Dnsmasq on the main network interface to allow AdGuard Home to listen DNS resquest using it.  
However, Dnsmasq is not disabled and will continue to function as the *localhost DNS server*.


**Versió inclosa:** 0.107.59~ynh1

## Captures de pantalla

![Captures de pantalla de AdGuard Home](./doc/screenshots/screenshot.jpg)

## Documentació i recursos

- Lloc web oficial de l'aplicació: <https://adguard.com/adguard-home.html>
- Documentació oficial per l'usuari: <https://kb.adguard.com/en>
- Documentació oficial per l'administrador: <https://github.com/AdguardTeam/AdGuardHome/wiki>
- Repositori oficial del codi de l'aplicació: <https://github.com/AdguardTeam/AdGuardHome>
- Botiga YunoHost: <https://apps.yunohost.org/app/adguardhome>
- Reportar un error: <https://github.com/YunoHost-Apps/adguardhome_ynh/issues>

## Informació per a desenvolupadors

Envieu les pull request a la [branca `testing`](https://github.com/YunoHost-Apps/adguardhome_ynh/tree/testing).

Per provar la branca `testing`, procedir com descrit a continuació:

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/adguardhome_ynh/tree/testing --debug
o
sudo yunohost app upgrade adguardhome -u https://github.com/YunoHost-Apps/adguardhome_ynh/tree/testing --debug
```

**Més informació sobre l'empaquetatge d'aplicacions:** <https://yunohost.org/packaging_apps>
