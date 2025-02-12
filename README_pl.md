<!--
To README zostało automatycznie wygenerowane przez <https://github.com/YunoHost/apps/tree/master/tools/readme_generator>
Nie powinno być ono edytowane ręcznie.
-->

# AdGuard Home dla YunoHost

[![Poziom integracji](https://apps.yunohost.org/badge/integration/adguardhome)](https://ci-apps.yunohost.org/ci/apps/adguardhome/)
![Status działania](https://apps.yunohost.org/badge/state/adguardhome)
![Status utrzymania](https://apps.yunohost.org/badge/maintained/adguardhome)

[![Zainstaluj AdGuard Home z YunoHost](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=adguardhome)

*[Przeczytaj plik README w innym języku.](./ALL_README.md)*

> *Ta aplikacja pozwala na szybką i prostą instalację AdGuard Home na serwerze YunoHost.*  
> *Jeżeli nie masz YunoHost zapoznaj się z [poradnikiem](https://yunohost.org/install) instalacji.*

## Przegląd

AdGuard Home is a network-wide software for blocking ads & tracking. After you set it up, it'll cover ALL your home devices, and you don't need any client-side software for that.

It operates as a DNS server that re-routes tracking domains to a "black hole", thus preventing your devices from connecting to those servers. It's based on software we use for our public AdGuard DNS servers -- both share a lot of common code.

**Important note**: This AdGuard Home package needs to disable Dnsmasq on the main network interface to allow AdGuard Home to listen DNS resquest using it.  
However, Dnsmasq is not disabled and will continue to function as the *localhost DNS server*.


**Dostarczona wersja:** 0.107.56~ynh2

## Zrzuty ekranu

![Zrzut ekranu z AdGuard Home](./doc/screenshots/screenshot.jpg)

## Dokumentacja i zasoby

- Oficjalna strona aplikacji: <https://adguard.com/adguard-home.html>
- Oficjalna dokumentacja: <https://kb.adguard.com/en>
- Oficjalna dokumentacja dla administratora: <https://github.com/AdguardTeam/AdGuardHome/wiki>
- Repozytorium z kodem źródłowym: <https://github.com/AdguardTeam/AdGuardHome>
- Sklep YunoHost: <https://apps.yunohost.org/app/adguardhome>
- Zgłaszanie błędów: <https://github.com/YunoHost-Apps/adguardhome_ynh/issues>

## Informacje od twórców

Wyślij swój pull request do [gałęzi `testing`](https://github.com/YunoHost-Apps/adguardhome_ynh/tree/testing).

Aby wypróbować gałąź `testing` postępuj zgodnie z instrukcjami:

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/adguardhome_ynh/tree/testing --debug
lub
sudo yunohost app upgrade adguardhome -u https://github.com/YunoHost-Apps/adguardhome_ynh/tree/testing --debug
```

**Więcej informacji o tworzeniu paczek aplikacji:** <https://yunohost.org/packaging_apps>
