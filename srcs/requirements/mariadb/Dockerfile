FROM debian:bookworm

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y mariadb-server

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/auto_config.sh /auto_config.sh

ENTRYPOINT ["bash", "auto_config.sh"]
