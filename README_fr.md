<!--
Nota bene : ce README est automatiquement généré par <https://github.com/YunoHost/apps/tree/master/tools/readme_generator>
Il NE doit PAS être modifié à la main.
-->

# AdGuard Home pour YunoHost

[![Niveau d’intégration](https://dash.yunohost.org/integration/adguardhome.svg)](https://ci-apps.yunohost.org/ci/apps/adguardhome/) ![Statut du fonctionnement](https://ci-apps.yunohost.org/ci/badges/adguardhome.status.svg) ![Statut de maintenance](https://ci-apps.yunohost.org/ci/badges/adguardhome.maintain.svg)

[![Installer AdGuard Home avec YunoHost](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=adguardhome)

*[Lire le README dans d'autres langues.](./ALL_README.md)*

> *Ce package vous permet d’installer AdGuard Home rapidement et simplement sur un serveur YunoHost.*  
> *Si vous n’avez pas YunoHost, consultez [ce guide](https://yunohost.org/install) pour savoir comment l’installer et en profiter.*

## Vue d’ensemble

AdGuard Home est un logiciel à l'échelle du réseau pour bloquer les publicités et le pistage. Après l'avoir configuré, il couvrira TOUS vos appareils domestiques et vous n'avez besoin d'aucun logiciel côté client pour cela.

Il fonctionne comme un serveur DNS qui redirige les domaines de pistage vers un "trou noir", empêchant ainsi vos appareils de se connecter à ces serveurs. Il est basé sur un logiciel que nous utilisons pour nos serveurs DNS publics AdGuard - les deux partagent beaucoup de code commun.

**Note importante** : Ce package de AdGuard Home doit désactiver Dnsmasq sur l'interface réseau principale pour permettre à AdGuard Home d'écouter les requêtes DNS en l'utilisant.  
Cependant, Dnsmasq n'est pas désactivé et continuera à fonctionner en tant que *serveur DNS localhost*.


**Version incluse :** 0.107.52~ynh2

## Captures d’écran

![Capture d’écran de AdGuard Home](./doc/screenshots/screenshot.png)

## Documentations et ressources

- Site officiel de l’app : <https://adguard.com/adguard-home.html>
- Documentation officielle utilisateur : <https://kb.adguard.com/en>
- Documentation officielle de l’admin : <https://github.com/AdguardTeam/AdGuardHome/wiki>
- Dépôt de code officiel de l’app : <https://github.com/AdguardTeam/AdGuardHome>
- YunoHost Store : <https://apps.yunohost.org/app/adguardhome>
- Signaler un bug : <https://github.com/YunoHost-Apps/adguardhome_ynh/issues>

## Informations pour les développeurs

Merci de faire vos pull request sur la [branche `testing`](https://github.com/YunoHost-Apps/adguardhome_ynh/tree/testing).

Pour essayer la branche `testing`, procédez comme suit :

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/adguardhome_ynh/tree/testing --debug
ou
sudo yunohost app upgrade adguardhome -u https://github.com/YunoHost-Apps/adguardhome_ynh/tree/testing --debug
```

**Plus d’infos sur le packaging d’applications :** <https://yunohost.org/packaging_apps>
