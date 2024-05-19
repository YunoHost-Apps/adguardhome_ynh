# Documentation des applications

## Android

### DNS privé intégré

Android propose une fonctionalité nommée **DNS privé** depuis sa version 9.
Ce paramètre **DNS privé** ne fonctionnera que pour *DNS-over-TLS*, car *DNS-over-HTTPS* n'est limité qu'à une paire de fournisseurs figés dans le code.

Android étant distribuée en de multiples variantes selon les fournisseurs d'appareils, l'emplacement de ce paramètre peut varier.
Il est peu ou prou placé dans `Paramètres → Connexions → Plus de paramètres de connexion → DNS privé`
Là, sélectionnez "Nom d'hôte du fournisseur DNS privé", et encodez le nom de domaine de votre serveur Adguard Home: `__DOMAIN__` (pas de protocole, pas de barre oblique, seulement le domaine).

### Intra

Intra par [Jigsaw Operations LLC](https://jigsaw.google.com) peut-être téléchargée depuis [Google Play](https://play.google.com/store/apps/details?id=app.intra) ou [F-Droid](https://f-droid.org/packages/app.intra/).
Cette application gratuite permet de vous connecter à votre serveur Adguard Home via *DNS-over-HTTPS*.

Pour la configurer, une fois installée :
- Ouvrez son menu latéral `≡ → Paramètres → Sélectionnez un serveur DNS over HTTPS`
- Choisissez `URL de serveur personnaliséer` et encodez votre URL :
  - `https://__DOMAIN__/dns-query`
  - Si vous souhaitez suivre les requêtes de votre appareil ou utiliser des règles personnalisées, remplacez [ClientID](https://github.com/AdguardTeam/AdGuardHome/wiki/Clients#clientid) dans l'URL suivante: `https://__DOMAIN__/dns-query/ClientID`,
- Retournez au menu principal de l'app, et activez-la avec l'interrupteur en haut à droite de l'écran.

Techniquement, elle créé une connexion VPN locale pour imposer l'usage de votre serveur DNS : une icône 🔑 apparaîtra en haut de votre écran, une fois activée.

## Appareils Apple

### AdGuard Home Remote

[AdGuard Home Remote](https://apps.apple.com/app/id1543143740) par [RocketScience IT](https://rocketscience-it.nl/) est compatible avec les Mac, iPhone, iPad et Watch.  
Elle est gratuite and un achat in-app de 6 € pour débloquer des fonctionnalités supplémentaires. Aucune publicité ni tracking.

Cette app sert à monitorer ou configurer votre instance AGH, et non pas utiliser cette dernière comme serveur DNS pour votre appareil Apple.

Vous pouvez facilement configurer l'app :

- Ajouter une instance
- Choisir un nom d'affichage
- Écrire le nom de domaine de votre instance AdGuard Home, par exemple `adguard.example.com`
- Choisir `https`, cela va automatiquement remplir le champ du port avec `443`
- Renseigner vos identifiants AdGuard Home dans les champs "Authentification"
- Tester la connexion, si une coche verte apparaît, tout est bon!

[Votre configuration devrait ressemblr à ceci.](https://raw.githubusercontent.com/YunoHost-Apps/adguardhome_ynh/master/doc/screenshots/apps/AGH-remote.PNG)

### Profil DNS sécurisé

Afin d'utiliser votre instance AGH en tant que serveur DNS de votre appareil Apple, vous pouvez générer un "Profil DNS sécurisé".
**Note :** en alternative pour utilisateurice expérimenté•e à ce tutoriel, vous pouvez également utiliser l'outil  [Secure DNS profile creator](https://dns.notjakob.com/index.html).

Pour ce faire, vous devez au préalable activer la fonctionnalité DNS sur HTTP/TLS/QUIC en utilisant l'interface d'administration Web de YunoHost.  
Si vous lisez ceci via l'interface YunoHost', vous devriez déjà être au bon endroit: cliquez simplement sur l'option "AdGuard Home configuration" au dessus de ce texte, activez "Activate DNS over HTTP/TLS/QUIC?" puis cliquez sur "Save".  
Sinon, ouvrez l'interface d'administration Web et suivez ce chemin : `Applications → AdGuard Home → AdGuard Home configuration`

Désormais, rendez-vous sur la page [Setup Guide](https://__DOMAIN____PATH__#guide) de votre instance AdGuard Home, cliquez sur "DNS privacy" et descendez tout en bas.

- Hostname : laisser comme tel
- HTTPS port : laisser aussi comme tel
- Protocol : vous devez désormais faire un choix entre DNS-over-HTTPS et DNS-over-TLS
  - Si vous désirez utiliser la fonctionnalité [ClientID](https://github.com/AdguardTeam/AdGuardHome/wiki/Clients#clientid) afin de mettre vos appareils sur liste blanche, vous ne pouvez pas choisir DNS-over-TLS car YunoHost ne peut pas gérer les noms de domaines "wildcard", l'usage du DNS-over-HTTPS sera donc obligatoire pour vous
  - Si vous ne savez pas lequel choisir, voici un peu d'aide :
    - Comme expliqué ci-dessus, choisissez DNS-over-HTTPS si vous souhaitez utiliser la fonctionnalité ClientID pour authentifier vos requêtes
    - Choisissez DNS-over-HTTPS si vous devez fréquemment utiliser des réseaux succeptibles de filtrer le port du DNS-over-TLS, tels que ceux des entreprises, des écoles, etc.
    - Sinon, choisissez le DNS-over-TLS pour sa rapidité légèrement supérieure, comme il utilise une [couche réseau OSI](https://fr.wikipedia.org/wiki/Mod%C3%A8le_OSI) de moins
- ClientID : renseigner un ClientID, `iphone-123456` par exemple
  - N'oubliez pas d'ajouter un ClientID identique dans votre liste blanche : `Settings → DNS settings → Access settings → Allowed clients`

Vous pouvez maintenant cliquer sur le bouton "Download configuration file" et accepter le téléchargement.

Pour finir, ouvrez les réglages système, cliquez sur le message "Profil téléchargé" et installez-le en entrant le mot de passe de l'appareil et en tapant "Installer" quelques fois.

Votre appareil devrait maintenant utiliser votre instance AdGuard Home en tant que serveur DNS. Super !

**Note :** les profils installés peuvent être gérés dans les Réglages, dans "Général" puis "VPN et gestion de l'appareil".
