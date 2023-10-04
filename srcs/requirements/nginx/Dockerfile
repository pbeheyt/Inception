# Use a Debian buster image as the base
FROM debian:buster

# Update package repositories and upgrade installed packages
RUN apt update && apt upgrade -y

# Install Nginx
RUN apt install -y nginx

# Create a directory for SSL certificates
RUN mkdir -p /etc/nginx/ssl

# Install the OpenSSL tool
RUN apt install -y openssl

# Generate an SSL certificate (without a password)
RUN openssl req -x509 -nodes\
-out /etc/nginx/ssl/inception.crt\
-keyout /etc/nginx/ssl/inception.key\
-subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=pbeheyt.42.fr/UID=pbeheyt"

# Create a directory for configuration files
RUN mkdir -p /var/run/nginx

# Copy the custom configuration file
COPY conf/nginx.conf /etc/nginx/nginx.conf

# Modify permissions for the root directory of the website
RUN chmod 755 /var/www/html

# Assign permissions to the www-data user
RUN chown -R www-data:www-data /var/www/html

# Expose port 443 for HTTPS connections
EXPOSE 443

# Command to start NGINX in daemon mode
CMD ["nginx", "-g", "daemon off;"]
