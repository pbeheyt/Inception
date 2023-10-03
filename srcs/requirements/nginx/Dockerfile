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

# Expose le port 443 (seul a pouvoir etre utilisée)
EXPOSE 443

# Commande pour démarrer NGINX
CMD ["nginx", "-g", "daemon off;"]
