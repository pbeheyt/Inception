# Utilisation d'une image Debian comme base
FROM debian:stable-slim

# Mise à jour des paquets
RUN apt update && apt upgrade -y

# Installation de Nginx
RUN apt install -y nginx

# Création d'un répertoire pour les certificats SSL
RUN mkdir -p /etc/nginx/ssl

# Installation de l'outil OpenSSL
RUN apt install -y openssl

# Génération du certificat SSL (sans mot de passe)
RUN openssl req -x509 -nodes \
    -out /etc/nginx/ssl/inception.crt \
    -keyout /etc/nginx/ssl/inception.key \
    -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=pbeheyt.42.fr/UID=pbeheyt"

# Création d'un répertoire pour les fichiers de configuration
RUN mkdir -p /var/run/nginx

# Copie du fichier de configuration personnalisé
COPY conf/nginx.conf /etc/nginx/nginx.conf

# Modification des permissions du répertoire racine du site web
RUN chmod 755 /var/www/html

# Attribution des permissions à l'utilisateur www-data
RUN chown -R www-data:www-data /var/www/html

# Exposer le port 443 pour les connexions HTTPS
EXPOSE 443

# Commande pour démarrer NGINX en mode démon
CMD ["nginx", "-g", "daemon off;"]
