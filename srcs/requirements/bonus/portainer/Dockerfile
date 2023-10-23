FROM debian:bookworm

RUN apt-get update && apt-get install -y wget

# Define an environment variable for Portainer's home directory
ENV PORTAINER_HOME /var/lib/portainer

# Create the Portainer home directory and set permissions
RUN mkdir -p $PORTAINER_HOME && \
    addgroup portainer && \
    adduser --system --disabled-login --no-create-home --ingroup portainer --home $PORTAINER_HOME --shell /bin/sh portainer && \
    chown portainer:portainer $PORTAINER_HOME

RUN wget -qO- https://github.com/portainer/portainer/releases/download/2.19.1/portainer-2.19.1-linux-amd64.tar.gz \
| tar -xz -C /usr/local

CMD ["/usr/local/portainer/portainer"]
