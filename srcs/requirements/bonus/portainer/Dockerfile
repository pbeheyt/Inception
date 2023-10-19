FROM debian:bookworm

RUN apt-get update && apt-get install -y wget

RUN wget -qO- https://github.com/portainer/portainer/releases/download/2.19.1/portainer-2.19.1-linux-amd64.tar.gz \
| tar -xz -C /usr/local

CMD ["/usr/local/portainer/portainer"]
