# Guide d'administration de AdGuard Home pour YunoHost

Vous voulez comprendre comment bien configurer les paramètres de AdGuard Home ? Vous êtes au bon endroit ! ^w^

## Liaison avec les adresses IP publiques ?

Ce paramètre est **désactivé** par défaut.

Lorsque désactivé :

- YunoHost **ne va pas** vérifier l'accessibilité du port 53 depuis Internet et vous avertir s'il n'est pas accessible (donc éviter les alertes non pertinentes)
- Les adresses IP publiques **ne seront pas** ajoutées à la configuration de AdGuard Home

Lorsque activé :

- YunoHost **vérifiera** l'accessibilité du port 53 depuis Internet et vous avertira s'il n'est pas accessible
- ⚠️ Vous devrez **ouvrir manuellement le port 53** sur votre routeur si vous vous auto-hébergez à la maison !
- Les adresses IP publiques **seront** ajoutées à la configuration de AdGuard Home, donc AGH se liera à elles

Vous devez savoir que lorsque vous exposez votre serveur DNS sur Internet, quiconque connaît son adresse peut l'utiliser. **Il peut être détourné** afin de réaliser des [attaques par amplification DNS](https://www.malekal.com/attaque-dos-amplification) !  
Ce risque est grandement limité par le système de limitation du nombre de requêtes (rate limiting), qui est consifuré pr défaut à 20 requêtes par secondes par client :
`Settings → DNS settings → DNS server configuration → Rate limit`

Vous pouvez complètement ou presque complètement ces risques d'usages non autorisés à l'aide de la section [Liste blanche](#liste-blanche) plus loin dans cette documentation.

Pour utiliser AdGuard Home sur votre réseau domestique si vous vous auto-hébergez à la maison, il **n'est pas nécessaire** d'activer ce paramètre.  
Vous avez simplement à utiliser l'adresse IP privée de votre serveur (telle que `192.168.0.1` ou similaire) en tant qu'adresse IP du serveur DNS de vos appareils électroniques domestiques.  
La bonne adresse à utiliser est indiquée en haut de la page "Setup Guide" de votre instance AdGuard Home.

Si vous voulez exposer le port 53 sur Internet, vous devrez utiliser l'adresse IP publique de votre serveur (la même que celle configurée dans les paramètres DNS de votre nom de domaine) sur les apapreils situés ou pouvant se situer à l'extérieur de votre domicile.

**Avertissement :** vous ne devez pas avoir d'adresse IP publique dans votre configuration AdGuard Home si le port 53 n'est pas exposé sur Internet (sinon AGH crash). 
**Veuillez noter :** Elles devraient être automatiquement lors de la mise à jour du packge ou en modifiant ce réglage de l'exposition du port 53, mais c'est dans la doc au cas où.  
Vous pouvez les retirer dans la configuration située à `/var/www/adguardhome/AdGuardHome.yaml` dans la section `dns: bind_hosts:`.  
Si une IP **ne débute pas** par ce qui suit, c'est une IP publique :

- `10.`
- `169.`
- `172.`
- `192.168.`
- `fcxx:` (où le `x` peut être n'importe quel caractère' hexadecimal)
- `fdxx:` (où le `x` peut être n'importe quel caractère' hexadecimal)

**Avertissement :** Les IPv6 débutant par `fe80:` (IPv6 LLA) NE peuvent PAS être utilisées pour du DNS, si vous essayez d'en mettre une dans la configuration de AGH, ça ne fonctionnera pas et AGH crashera !

Donc toute autre adresse IP devrait être une adresse IP publique.

Redémarrez AdGuard Home manuellement après avoir modifié sa configuration à la main : `yunohost service restart adguardhome`

## Activer le DNS-sur-HTTPS/TLS/QUIC ?

Ce paramètre est **désactivé** par défaut.

Si activé, vous devez savoir que quiconque connaît le nom de domaine de votre AdGuard Home peut l'utiliser. **Il peut être détourné** afin de réaliser des [attaques par amplification DNS](https://www.malekal.com/attaque-dos-amplification) !



## Liste blanche



### Réseau local



### Authoriser quelques adresses IP publiques


