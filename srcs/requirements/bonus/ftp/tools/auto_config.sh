#!/bin/sh

# Create the working directory for WordPress if it doesn't exist.
mkdir -p /var/www/wordpress

# Create the vsftpd directory to be able to copy the configuration.
mkdir -p /etc/vsftpd

# Create the 'empty' directory for the secure_chroot_dir option.
mkdir -p /var/run/vsftpd/empty
chown root:root /var/run/vsftpd/empty
chmod 755 /var/run/vsftpd/empty

# Copy the configuration file if this is the first time the container is started.
if [ ! -f "/etc/vsftpd/vsftpd.conf.bak" ]; then
    cp /tmp/vsftpd.conf /etc/vsftpd/vsftpd.conf
    cp /etc/vsftpd/vsftpd.conf /etc/vsftpd/vsftpd.conf.bak
fi

# Add the FTP user, set their password, and assign ownership of the WordPress directory.
adduser $FTP_USER --disabled-password --gecos "" # --gecos "" prevents asking questions during user addition.
echo "$FTP_USER:$FTP_PASSWORD" | chpasswd
chown -R $FTP_USER:$FTP_USER /var/www/wordpress

# Add the FTP user to the list of allowed users if not already present.
if ! grep -q "^$FTP_USER$" /etc/vsftpd.userlist; then
    echo $FTP_USER >> /etc/vsftpd.userlist
fi

# Start the vsftpd server in the foreground so the container doesn't exit.
exec /usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf
