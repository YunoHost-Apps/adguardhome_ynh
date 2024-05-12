<!--
NOTA: Este README foi creado automáticamente por <https://github.com/YunoHost/apps/tree/master/tools/readme_generator>
NON debe editarse manualmente.
-->

# AdGuard Home para YunoHost

[![Nivel de integración](https://dash.yunohost.org/integration/adguardhome.svg)](https://dash.yunohost.org/appci/app/adguardhome) ![Estado de funcionamento](https://ci-apps.yunohost.org/ci/badges/adguardhome.status.svg) ![Estado de mantemento](https://ci-apps.yunohost.org/ci/badges/adguardhome.maintain.svg)

[![Instalar AdGuard Home con YunoHost](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=adguardhome)

*[Le este README en outros idiomas.](./ALL_README.md)*

> *Este paquete permíteche instalar AdGuard Home de xeito rápido e doado nun servidor YunoHost.*  
> *Se non usas YunoHost, le a [documentación](https://yunohost.org/install) para saber como instalalo.*

## Vista xeral

AdGuard Home is a network-wide software for blocking ads & tracking. After you set it up, it'll cover ALL your home devices, and you don't need any client-side software for that.

It operates as a DNS server that re-routes tracking domains to a "black hole", thus preventing your devices from connecting to those servers. It's based on software we use for our public AdGuard DNS servers -- both share a lot of common code.


**Versión proporcionada:** 0.107.45~ynh1

## Capturas de pantalla

![Captura de pantalla de AdGuard Home](./doc/screenshots/68747470733a2f2f63646e2e616467756172642e636f6d2f7075626c69632f416467756172642f436f6d6d6f6e2f616467756172645f686f6d652e676966.gif)

## Documentación e recursos

- Web oficial da app: <https://adguard.com/adguard-home.html>
- Documentación oficial para usuarias: <https://kb.adguard.com/en>
- Documentación oficial para admin: <https://github.com/AdguardTeam/AdGuardHome/wiki>
- Repositorio de orixe do código: <https://github.com/AdguardTeam/AdGuardHome>
- Tenda YunoHost: <https://apps.yunohost.org/app/adguardhome>
- Informar dun problema: <https://github.com/YunoHost-Apps/adguardhome_ynh/issues>

## Info de desenvolvemento

Envía a túa colaboración á [rama `testing`](https://github.com/YunoHost-Apps/adguardhome_ynh/tree/testing).

Para probar a rama `testing`, procede deste xeito:

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/adguardhome_ynh/tree/testing --debug
ou
sudo yunohost app upgrade adguardhome -u https://github.com/YunoHost-Apps/adguardhome_ynh/tree/testing --debug
```

**Máis info sobre o empaquetado da app:** <https://yunohost.org/packaging_apps>
