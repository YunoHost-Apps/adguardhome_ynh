AdGuard Home est un logiciel à l'échelle du réseau pour bloquer les publicités et le pistage. Après l'avoir configuré, il couvrira TOUS vos appareils domestiques et vous n'avez besoin d'aucun logiciel côté client pour cela.

Il fonctionne comme un serveur DNS qui redirige les domaines de pistage vers un "trou noir", empêchant ainsi vos appareils de se connecter à ces serveurs. Il est basé sur un logiciel que nous utilisons pour nos serveurs DNS publics AdGuard - les deux partagent beaucoup de code commun.

**Note importante** : Ce package de AdGuard Home doit désactiver Dnsmasq sur l'interface réseau principale pour permettre à AdGuard Home d'écouter les requêtes DNS en l'utilisant.  
Cependant, Dnsmasq n'est pas désactivé et continuera à fonctionner en tant que *serveur DNS localhost*.
