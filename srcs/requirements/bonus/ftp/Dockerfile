FROM debian:bookworm

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y vsftpd

COPY conf/vsftpd.conf /tmp/.

COPY tools/auto_config.sh /tmp/.

RUN chmod +x /tmp/auto_config.sh

CMD [ "bash", "/tmp/auto_config.sh" ]