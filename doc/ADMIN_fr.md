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
- Les adresses IP publiques **seront** ajoutées à la configuration de AdGuard Home, donc AGH se liera à elles, ce qui exposera directement le port 53 sur Internet

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

## Activer le DNS-sur-HTTPS, DNS-sur-TLS et DNS-sur-QUIC ?

Ce paramètre est **désactivé** par défaut.

Si activé, vous devez savoir que quiconque connaît le nom de domaine de votre AdGuard Home peut l'utiliser. **Il peut être détourné** afin de réaliser des [attaques par amplification DNS](https://www.malekal.com/attaque-dos-amplification) !

Il est vraiment importantd'utuliser le panneau de configuration inclus dans l'interface d'administration Web de YunoHost pour activer ou désactiver ce paramètre, et donc **NE PAS** utiliser le réglage inclus dans AdGuard Home.  
Cela en raison de la nécessité que YunoHost réalise des réglages automatisés tels que ouvrir ou fermer des ports et rafraichir la liste des IP dans le fichier de configuration de AGH, qui ne peuvent être réalisés qu'en passant par ce paneau de configuration dédié.

Si vous auto-hébergez votre serveur à la maison, afin de pouvoir utiliser de DoT ou DoQ, vous devez aussi ouvrir vous même les ports suivant dans les réglages de votre routeur :

- `__PORT_DNS_OVER_TLS__` en TCP & UDP (pour le DNS sur TLS)
- `__PORT_DNS_OVER_QUIC__` en UDP (pour le DNS sur QUIC)

Puis vous pourrez utiliser les adresses suivantes en tant que serveur DNS DoH, DoT ou DoQ pour vos appareils électroniques :

- DNS sur HTTP : `https://__DOMAIN__/dns-query` (ou `https://__DOMAIN__/dns-query/votre-client-id` en utilisant un [ClientID](https://github.com/AdguardTeam/AdGuardHome/wiki/Clients#clientid))
- DNS sur TLS : `tls://__DOMAIN__:__PORT_DNS_OVER_TLS__`
- DNS sur QUIC : `quic://__DOMAIN__:__PORT_DNS_OVER_QUIC__`

## Liste blanche

Sir votre prot 53 est exposé sur Internet, vous pouvez sécuriser votre instance AdGuard Home à l'aide de la liste blanche, afin d'empêcher des usages non autorisés.

Nous avons déjà reçu des messages d'utilisateurices de YunoHost interloqué-es en se rendant compte que leur instance AGH recevait des dizaines de milliers de requêtes inconnues par jour, cela étant du à l'exposition publique du port 53 sur Internet et au manque de sécurisation de leur instance.

Dans cette liste blanche, vous pouvez ajouter des [ClientID](https://github.com/AdguardTeam/AdGuardHome/wiki/Clients#clientid) en lieu et place des adresses IP de vos appareils utilisant le DNS sur HTTP.  
Comme YunoHost ne supporte pas les noms de domaines "wildcard", l'usage de la fonctionnalité des ClientID n'est pas possible avec l'utilisation du DNS sur TLS et le DNS sur QUIC. Nous sommes désolées pour cela.
**Note :** afin d'utiliser le DNS sur HTTP avec un ClientID, vous devez utiliser une adresse telle que : `https://__DOMAIN__/dns-query/votre-client-id`

Les réglages de la liste blanche se situent dans l'interface de AdGuard Home à cet endroit : `Settings → DNS settings → Access settings → Allowed clients`

### Réseau local

Si vous vous autohébergez à la maison, vous pouvez simplement coller la liste d'IP suivantes dans votre liste blanche (cela autorisera n'importe quelle adresse IP privée) :

```text
10.0.0.0/8
172.16.0.0/12
192.168.0.0/16
fc00::/7
fe80::/16
```

**Note:** Le slash `/` et le numéro le suivant, après une adresse IP, representent le masque de sous réseau, ceci est appelé la notation CIDR. Si vous voulez en savoir plus sur la notation CIDR, [vous pouvez lire cet article](https://whatismyipaddress.com/cidr) (en anglais).

### Authoriser quelques adresses IP publiques

Vous pouvez maintenant aussi autoriser quelques adresses IP publiques.

Par exemple, pour autoriser l'adresse IPv4 de votre connexion Internet domestique, ouvrez <https://ip.yunohost.org/> et collez l'adresse affichée dans votre liste blanche.

Si votre FAI vous a assigné une plage d'adresses IPv6 (par exemple `2a01:d34d:b33f:1312::/64`), vous pouvez l'ajouter pour autoriser n'importe quel appareil de votre réseau utilisant cette plage d'adresses.

Vous pouvez ajouter n'importe quelle adresse IP dont vous avez l'usage.

Si vous voulez utiliser votre instance AGH avec votre smartphone sans utiliser la fonctionnalité [ClientID](https://github.com/AdguardTeam/AdGuardHome/wiki/Clients#clientid) (qui est uniquement disponible en utilisant le DoH, lisez la documentation des applications pour savoir comment l'utiliser avec votre smartphone), cela devient plus complexe : vous devrez autoriser les plages IP de votre opérateur mobile.  
Ce n'est clairement pas parfait mais cela diminue quand même drastiquement les chances d'utilisations non autorisées, tout en vous permettant un usage avec votre smartphone.  
**Note :** en cas de connexion sur des réseaux wifi non préalablement autorisés, vous ne pourrez pas utiliser votre instance AdGuard Home.

En utilisant la connexion à autoriser, rendez-vous sur <https://ip.guide/> et cliquez sur "Autonomous Systems".  
**Note :** Si vous utilisez un iPhone, vérifiez bien que [les options "Limiter le suivi de l'adresse IP" ou "Relais privé iCloud"](https://support.apple.com/guide/iphone/iph499d287c2/ios) sont désactivées (sinon vous devrez autoriser les adresses IP de Akamai en utilisant la même méthode).
Vous pouvez désormais copier toutes les adresses IP présentes dans la section "routes", retirer tous les guillemets, virgules et espaces en conservant une IP par ligne, puis coller ce résultat dans votre liste blanche.  
Cela devrait ressembler à la liste de la section précédente de ce tutoriel.

Vous pouvez utiliser la ligne de commande suivante pour avoir un résultat clé en main :

```bash
curl -sL ip.guide/AS"$(curl -sL ip.guide | jq -s ".[].network.autonomous_system.asn")" | jq -s ".[].routes" | sed "/v.*:/d;/\],/d" | tr -d " {]\",}"
```

Cette commande demande votre adresse IP sur ip.guide, et la réponse contient l'identifiant "Autonomous System" (ASN) lié à votre opérateur. Puis la commande demande ses plages IP et les affiche sur votre écran.

**Note :** il est possible que vous deviez réaliser cette opération plusieurs fois, comme certains fournisseurs d'accès possèdent plusieurs numéros ASN. Donc si un jour votre AdGuard Home refuse de répondre, cela peut être la cause.
