<!--
N.B.: README ini dibuat secara otomatis oleh <https://github.com/YunoHost/apps/tree/master/tools/readme_generator>
Ini TIDAK boleh diedit dengan tangan.
-->

# AdGuard Home untuk YunoHost

[![Tingkat integrasi](https://dash.yunohost.org/integration/adguardhome.svg)](https://ci-apps.yunohost.org/ci/apps/adguardhome/) ![Status kerja](https://ci-apps.yunohost.org/ci/badges/adguardhome.status.svg) ![Status pemeliharaan](https://ci-apps.yunohost.org/ci/badges/adguardhome.maintain.svg)

[![Pasang AdGuard Home dengan YunoHost](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=adguardhome)

*[Baca README ini dengan bahasa yang lain.](./ALL_README.md)*

> *Paket ini memperbolehkan Anda untuk memasang AdGuard Home secara cepat dan mudah pada server YunoHost.*  
> *Bila Anda tidak mempunyai YunoHost, silakan berkonsultasi dengan [panduan](https://yunohost.org/install) untuk mempelajari bagaimana untuk memasangnya.*

## Ringkasan

AdGuard Home is a network-wide software for blocking ads & tracking. After you set it up, it'll cover ALL your home devices, and you don't need any client-side software for that.

It operates as a DNS server that re-routes tracking domains to a "black hole", thus preventing your devices from connecting to those servers. It's based on software we use for our public AdGuard DNS servers -- both share a lot of common code.

**Important note**: This AdGuard Home package needs to disable Dnsmasq on the main network interface to allow AdGuard Home to listen DNS resquest using it.  
However, Dnsmasq is not disabled and will continue to function as the *localhost DNS server*.


**Versi terkirim:** 0.107.52~ynh1

## Tangkapan Layar

![Tangkapan Layar pada AdGuard Home](./doc/screenshots/screenshot.png)

## Dokumentasi dan sumber daya

- Website aplikasi resmi: <https://adguard.com/adguard-home.html>
- Dokumentasi pengguna resmi: <https://kb.adguard.com/en>
- Dokumentasi admin resmi: <https://github.com/AdguardTeam/AdGuardHome/wiki>
- Depot kode aplikasi hulu: <https://github.com/AdguardTeam/AdGuardHome>
- Gudang YunoHost: <https://apps.yunohost.org/app/adguardhome>
- Laporkan bug: <https://github.com/YunoHost-Apps/adguardhome_ynh/issues>

## Info developer

Silakan kirim pull request ke [`testing` branch](https://github.com/YunoHost-Apps/adguardhome_ynh/tree/testing).

Untuk mencoba branch `testing`, silakan dilanjutkan seperti:

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/adguardhome_ynh/tree/testing --debug
atau
sudo yunohost app upgrade adguardhome -u https://github.com/YunoHost-Apps/adguardhome_ynh/tree/testing --debug
```

**Info lebih lanjut mengenai pemaketan aplikasi:** <https://yunohost.org/packaging_apps>
