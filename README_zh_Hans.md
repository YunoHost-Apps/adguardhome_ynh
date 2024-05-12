<!--
注意：此 README 由 <https://github.com/YunoHost/apps/tree/master/tools/readme_generator> 自动生成
请勿手动编辑。
-->

# YunoHost 上的 AdGuard Home

[![集成程度](https://dash.yunohost.org/integration/adguardhome.svg)](https://dash.yunohost.org/appci/app/adguardhome) ![工作状态](https://ci-apps.yunohost.org/ci/badges/adguardhome.status.svg) ![维护状态](https://ci-apps.yunohost.org/ci/badges/adguardhome.maintain.svg)

[![使用 YunoHost 安装 AdGuard Home](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=adguardhome)

*[阅读此 README 的其它语言版本。](./ALL_README.md)*

> *通过此软件包，您可以在 YunoHost 服务器上快速、简单地安装 AdGuard Home。*  
> *如果您还没有 YunoHost，请参阅[指南](https://yunohost.org/install)了解如何安装它。*

## 概况

AdGuard Home is a network-wide software for blocking ads & tracking. After you set it up, it'll cover ALL your home devices, and you don't need any client-side software for that.

It operates as a DNS server that re-routes tracking domains to a "black hole", thus preventing your devices from connecting to those servers. It's based on software we use for our public AdGuard DNS servers -- both share a lot of common code.

**Important note**: This AdGuard Home package needs to disable Dnsmasq on the main network interface to allow AdGuard Home to listen DNS resquest using it.  
However, Dnsmasq is not disabled and will continue to function as the *localhost DNS server*.


**分发版本：** 0.107.48~ynh3

## 截图

![AdGuard Home 的截图](./doc/screenshots/demo.gif)

## 文档与资源

- 官方应用网站： <https://adguard.com/adguard-home.html>
- 官方用户文档： <https://kb.adguard.com/en>
- 官方管理文档： <https://github.com/AdguardTeam/AdGuardHome/wiki>
- 上游应用代码库： <https://github.com/AdguardTeam/AdGuardHome>
- YunoHost 商店： <https://apps.yunohost.org/app/adguardhome>
- 报告 bug： <https://github.com/YunoHost-Apps/adguardhome_ynh/issues>

## 开发者信息

请向 [`testing` 分支](https://github.com/YunoHost-Apps/adguardhome_ynh/tree/testing) 发送拉取请求。

如要尝试 `testing` 分支，请这样操作：

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/adguardhome_ynh/tree/testing --debug
或
sudo yunohost app upgrade adguardhome -u https://github.com/YunoHost-Apps/adguardhome_ynh/tree/testing --debug
```

**有关应用打包的更多信息：** <https://yunohost.org/packaging_apps>
