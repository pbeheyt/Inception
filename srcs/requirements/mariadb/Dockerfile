FROM debian:bookworm

RUN apt-get update && apt-get upgrade -y

RUN apt-get install mariadb-server -y

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d

COPY tools/auto_config.sh .

CMD ["bash", "auto_config.sh"]
