# Use a Debian buster image as the base
FROM debian:buster

# Update the package repositories and upgrade installed packages (-y for automatic yes to prompts)
RUN apt-get update && apt-get upgrade -y

# Install the MariaDB server
RUN apt-get install -y mariadb-server


# Copy the custom MariaDB server configuration file to the appropriate directory
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

# Copy the auto-configuration script to the root directory of the container
COPY tools/auto_config.sh /auto_config.sh

# Expose port 3306 for MySQL/MariaDB connections
EXPOSE 3306

# Set the entry point to run the auto-configuration script using the bash shell
ENTRYPOINT ["bash", "auto_config.sh"]
