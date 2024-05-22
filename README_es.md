<!--
Este archivo README esta generado automaticamente<https://github.com/YunoHost/apps/tree/master/tools/readme_generator>
No se debe editar a mano.
-->

# AdGuard Home para Yunohost

[![Nivel de integración](https://dash.yunohost.org/integration/adguardhome.svg)](https://dash.yunohost.org/appci/app/adguardhome) ![Estado funcional](https://ci-apps.yunohost.org/ci/badges/adguardhome.status.svg) ![Estado En Mantención](https://ci-apps.yunohost.org/ci/badges/adguardhome.maintain.svg)

[![Instalar AdGuard Home con Yunhost](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=adguardhome)

*[Leer este README en otros idiomas.](./ALL_README.md)*

> *Este paquete le permite instalarAdGuard Home rapidamente y simplement en un servidor YunoHost.*  
> *Si no tiene YunoHost, visita [the guide](https://yunohost.org/install) para aprender como instalarla.*

## Descripción general

AdGuard Home is a network-wide software for blocking ads & tracking. After you set it up, it'll cover ALL your home devices, and you don't need any client-side software for that.

It operates as a DNS server that re-routes tracking domains to a "black hole", thus preventing your devices from connecting to those servers. It's based on software we use for our public AdGuard DNS servers -- both share a lot of common code.

**Important note**: This AdGuard Home package needs to disable Dnsmasq on the main network interface to allow AdGuard Home to listen DNS resquest using it.  
However, Dnsmasq is not disabled and will continue to function as the *localhost DNS server*.


**Versión actual:** 0.107.49~ynh1

## Capturas

![Captura de AdGuard Home](./doc/screenshots/demo.gif)

## Documentaciones y recursos

- Sitio web oficial: <https://adguard.com/adguard-home.html>
- Documentación usuario oficial: <https://kb.adguard.com/en>
- Documentación administrador oficial: <https://github.com/AdguardTeam/AdGuardHome/wiki>
- Repositorio del código fuente oficial de la aplicación : <https://github.com/AdguardTeam/AdGuardHome>
- Catálogo YunoHost: <https://apps.yunohost.org/app/adguardhome>
- Reportar un error: <https://github.com/YunoHost-Apps/adguardhome_ynh/issues>

## Información para desarrolladores

Por favor enviar sus correcciones a la [`branch testing`](https://github.com/YunoHost-Apps/adguardhome_ynh/tree/testing

Para probar la rama `testing`, sigue asÍ:

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/adguardhome_ynh/tree/testing --debug
o
sudo yunohost app upgrade adguardhome -u https://github.com/YunoHost-Apps/adguardhome_ynh/tree/testing --debug
```

**Mas informaciones sobre el empaquetado de aplicaciones:** <https://yunohost.org/packaging_apps>
