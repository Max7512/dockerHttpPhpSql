# Serveurs MySQL et Apache avec PHP 

Ce projet permet de lancer facilement un serveur Apache incluant PHP ainsi qu'un serveur MySQL, il permet aussi de configurer les différents services.

## Configurations

Les services peuvent être configurés à partir des fichiers de configuration dans le dossier config. 
Pour que les configurations s'actualisent, il faut reconstruire les images des conteneurs des services ciblés.

### PHP

PHP peut être configuré à partir du fichier php.ini, il est important de bien configurer les extensions avant tout pour que PHP puisse fonctionner dans certains cas.
Les extensions comme mysqli, curl ou autres ne sont pas activées au départ et sont nécessaires au fonctionnement de programmes communicant avec une base de données par exemple.
Pour activer une extension il faut se rendre à la partie des extensions (ligne 923) et enlever le symbole ; au début de la ligne de l'extension voulue. Ce symbole agit comme commentaire et empêche le programme d'activer l'extension.

### Apache

Il est possible de changer la configuration du serveur Apache depuis apache###conf, mais ça ne sert à rien mis à part changer le comportement du serveur quand certains répertoires sont demandés.
Le répertoire racine est définit à la ligne 170 et des directives de répertoire peuvent en être déduites.

## Changer la configuration Docker

La configuration Docker peut être changée depuis le fichier docker-compose.yml et définit les ports à utiliser par Docker, l'emplacement du répertoire racine du serveur Apache et le mot de passe par défaut de la racine de la base de données.

### Ports

Pour changer les ports de l'hôte qui recevront les requêtes il suffit seulement de changer le nombre de gauche des entrées en dessous des attributs ports des services. Le nombre de droite ne doit surtout pas être changé car il correspond au port du conteneur qui sera lié au port de l'hôte.

### Répertoire racine Apache

L'emplacement du répertoire à utiliser comme racine est définit dans apache.volumes, tout comme les ports, seule la valeur de gauche doit être changée et il s'agit d'un chemin vers le répertoire de l'hôte.

### Mot de passe racine de la base de données

Le mot de passe est définit dans la variable d'environnement MYSQL_ROOT_PASSWORD dans mysql.environment, le nom d'utilisateur associé est root et ne peut être changé

## Lancer, arrêter et redémarrer les serveurs

Les serveurs peuvent être manipulés en totalité ou individuellement selon le besoin, pour spécifier si un seul serveur doit être affecté, il suffit de préciser le nom du service définit dans docker-compose.yml.

### Lancer les serveurs

La commande de lancement est comme si dessous, l'option d permet de lancer le serveur en arrière plan, ce qui évite d'afficher les logs du serveur constament, bloquant ainsi le terminal jusqu'à sortir manuellement des logs du serveur.
```bash
docker-compose up [-d] [apache | mysql]
```

### Arrêter les serveurs

Cette commande permet d'arrêter des services sans nécessairement les effacer tout comme leur données qui peuvent être réutilisées à la prochaine utilisation du serveur.
```bash
docker-compose down [apache | mysql]
```

### Redémarrer les serveurs

Cette commande permet de redémarrer des services pour appliquer des changements de configuration ou en cas d'erreur par exemple.
```bash
docker-compose restart [apache | mysql]
```