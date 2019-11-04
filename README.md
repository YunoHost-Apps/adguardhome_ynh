# AdGuard Home app for YunoHost
AdGuard Home Server

**Shipped version:** 0.99.2

- [Yunohost project](https://yunohost.org)
- [AdGuard Home website](https://github.com/AdguardTeam/AdGuardHome)

![](https://camo.githubusercontent.com/c6c427a65dd6a52d092015fff9205e148130aa94/68747470733a2f2f63646e2e616467756172642e636f6d2f7075626c69632f416467756172642f436f6d6d6f6e2f616467756172645f686f6d652e737667)


[![Install AdGuard Home with YunoHost](https://install-app.yunohost.org/install-with-yunohost.png)](https://install-app.yunohost.org/?app=adguard)

### Installing guide

 App can be installed by YunoHost **admin web-interface** or by **running following command**:

         $ sudo yunohost app install https://github.com/YunoHost-Apps/adguard_ynh

 Fail to start ? try :

         $ systemctl status adguard
         $ apt install -y net-tools
         $ netstat -tlnp | grep 53


### Upgrade this package:

        $ sudo yunohost app upgrade adguard -u https://github.com/YunoHost-Apps/adguard_ynh

