FROM debian:bookworm

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y redis

COPY tools/auto_config.sh /tmp/.

CMD ["bash", "/tmp/auto_config.sh"]
